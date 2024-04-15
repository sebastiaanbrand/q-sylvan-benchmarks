"""
https://docs.classiq.io/latest/reference-manual/python-sdk/
"""
import random
import pathlib
from math import pi, sqrt
from datetime import datetime
import numpy as np
from pysat.formula import CNF
from pysat.solvers import Glucose4
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


def random_3sat(nvars : int, nclauses : int):
    """
    Generate randon 3SAT CNF formula with given number of vars and clauses.
    """
    cnf = CNF()
    for _ in range(nclauses):
        clause = []
        for _ in range(3):
            lit = random.randint(1, nvars)
            if random.random() > 0.5:
                lit = -lit
            clause.append(lit)
        cnf.append(clause)

    # check if satisfiable
    solver = Glucose4()
    for clause in cnf:
        solver.add_clause(clause)
    sat = solver.solve()

    return cnf, sat


def cnf2classiq(cnf : CNF):
    """
    Convert CNF to format classiq's Grover oracle uses.
    """
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
        formula += ' ) and '

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


def generate_grover(cnf : CNF):
    """
    Generate Grover circuit for given SAT formula.

    See https://docs.classiq.io/latest/tutorials/algorithms/grover/3-sat-grover/3-sat-grover/
    for example.
    """
    formula, variables = cnf2classiq(cnf)

    register_size = RegisterUserInput(size=1)
    definitions = [(var, register_size) for var in variables]

    qmod = construct_grover_model(
        num_reps=int(pi/4 * sqrt(2**len(variables))),
        expression=formula,
        definitions=definitions
    )

    #custom_hardware_settings = CustomHardwareSettings(
    #    basis_gates=["cx", "cp", "sx", "rz", "x"])
    preferences = Preferences(
        output_format=["qasm", "qasm_cirq_compatible"])#, custom_hardware_settings=custom_hardware_settings)

    qmod = set_preferences(qmod, preferences)

    # TODO: add constraints (gate set, connectivity)

    # synthesize circuit
    qprog = synthesize(qmod)
    circuit = QuantumProgram.from_qprog(qprog)

    return circuit


def generate_benchmarks(rseed : int = None):
    """
    Generate Grover SAT benchmarks of varying sizes.
    """
    if rseed is None:
        rseed = int(datetime.now().timestamp() * 1e6)
    random.seed(rseed)

    cnf_dir  = "qasm/classiq/cnf"
    qasm_dir = "qasm/classiq"
    pathlib.Path(cnf_dir).mkdir(parents=True, exist_ok=True)

    for nvars in range(4, 7):
        for nclauses in np.linspace(nvars*2, nvars*5, num=10, dtype=int):

            # Generate (satisfiable) 3SAT formula
            sat = False
            while not sat:
                cnf, sat = random_3sat(nvars, nclauses)

            # Write CNF to file
            cnf_file = f"{cnf_dir}/cnf_{nvars}_{nclauses}_rseed{rseed}.cnf"
            cnf.to_file(cnf_file)

            # Generate + write Grover circuit
            circuit = generate_grover(cnf)
            qasm_file = f"{qasm_dir}/grover_cnf_{nvars}_{nclauses}_rseed{rseed}.qasm"
            with open(qasm_file, 'w') as f:
                f.write(circuit.transpiled_circuit.qasm)


def main():
    generate_benchmarks(rseed=42)


if __name__ == '__main__':
    main()
