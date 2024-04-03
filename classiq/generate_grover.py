"""
https://docs.classiq.io/latest/reference-manual/python-sdk/
"""
from pysat.formula import CNF
from classiq import (
    RegisterUserInput, 
    construct_grover_model,
    write_qmod,
    QuantumProgram,
    synthesize,
    set_preferences,
    CustomHardwareSettings,
    Preferences
)


def to_classiq_formula(dimacs_file : str):
    """
    Convert a DIMACS CNF file to the input format classiq's Grover oracle uses.
    """
    cnf = CNF()
    cnf.from_file(dimacs_file)

    variables = set()
    formula = ""

    for clause in cnf.clauses[:-1]:
        formula += '( '
        for lit in clause[:-1]:
            variables.add(abs(lit))
            formula += '('
            if lit < 0:
                formula += 'not'
            formula += f' x{abs(lit)}) or '
        # last literal
        lit = clause[-1]
        variables.add(abs(lit))
        formula += '('
        if lit < 0:
            formula += 'not'
        formula += f' x{abs(lit)})'
        formula += ' ) and \n'

    # last clause
    clause = cnf.clauses[-1]
    formula += '( '
    for lit in clause[:-1]:
        variables.add(abs(lit))
        formula += '('
        if lit < 0:
            formula += 'not'
        formula += f' x{abs(lit)}) or '
    # last literal
    lit = clause[-1]
    variables.add(abs(lit))
    formula += '('
    if lit < 0:
        formula += 'not'
    formula += f' x{abs(lit)})'
    formula += ' )'

    # convert e.g. var '2' to 'x2'
    var_names = []
    for v in sorted(variables):
        var_names.append(f'x{v}')

    return formula, var_names


def example():
    """
    https://docs.classiq.io/latest/tutorials/algorithms/grover/3-sat-grover/3-sat-grover/
    """
    formula = """
        ( ( x1) or ( x2) or ( x3) ) and
        ( (not x1) or ( x2) or ( x3) ) and
        ( (not x1) or (not x2) or (not x3) ) and
        ( (not x1) or (not x2) or ( x3) ) and
        ( ( x1) or ( x2) or (not x3) ) and
        ( (not x1) or ( x2) or (not x3) )
    """

    register_size = RegisterUserInput(size=1)

    qmod = construct_grover_model(
        num_reps=1,
        expression="(" + formula + ")",
        definitions=[
            ("x1", register_size),
            ("x2", register_size),
            ("x3", register_size),
        ],
    )

    #custom_hardware_settings = CustomHardwareSettings(
    #    basis_gates=["cx", "cp", "sx", "rz", "x"])
    preferences = Preferences(
        output_format=["qasm", "qasm_cirq_compatible"])#, custom_hardware_settings=custom_hardware_settings)

    qmod = set_preferences(qmod, preferences)
    write_qmod(qmod, "qasm/classiq/grov_test")
    qprog = synthesize(qmod)
    circuit = QuantumProgram.from_qprog(qprog)
    with open("qasm/classiq/grov_test_cirq.qasm", "w") as f:
        f.write(circuit.qasm_cirq_compatible)
    with open("qasm/classiq/grov_test_trans.qasm", "w") as f:
        f.write(circuit.transpiled_circuit.qasm)
    with open("qasm/classiq/grov_test_trans_cirq.qasm", "w") as f:
        f.write(circuit.transpiled_circuit.qasm_cirq_compatible)
    #circuit.show()


def main():
    expr, var_names = to_classiq_formula('classiq/dimacs/test.cnf')
    print(expr)
    print(var_names)
    #example()


if __name__ == '__main__':
    main()
