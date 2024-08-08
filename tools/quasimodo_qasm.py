"""
Simulate quantum circuit given as QASM file using Quasimodo.
NOTE: This file must run from Quasimodo/python_pkg/ for it to be able to run.
"""
import os
import time
import json
import math
import argparse
import qiskit.qasm2 as qasm2
import quasimodo


parser = argparse.ArgumentParser()
parser.add_argument('qasmfile', help="Path to .qasm file.")


def create_qubit_mapping(circuit):
    """
    Create a mapping from named registers to single consecutive qubit numbering.
    """
    qubit_map = {}
    num = 0
    for qreg in circuit.qregs:
        for k in range(qreg.size):
            qubit_map[(qreg.name,k)] = num
            num += 1
    return qubit_map


def apply_gate(qc, instruction, qubit_map):
    """
    Apply the given Qiskit instruction, assuming it's a gate.
    """
    name = instruction.operation.name
    qubits = [qubit_map[q._register.name, q._index] for q in instruction.qubits]
    if name == 'id':
        return
    elif name == 'x':
        qc.x(qubits[0])
    elif name == 'y':
        qc.y(qubits[0])
    elif name == 'z':
        qc.z(qubits[0])
    elif name == 'h':
        qc.h(qubits[0])
    elif name == 's':
        qc.s(qubits[0])
    elif name == 'sdg':
        qc.p(qubits[0], math.pi/2)
    elif name == 't':
        qc.t(qubits[0])
    elif name == 'tdg':
        qc.p(qubits[0], math.pi/4)
    elif name == 'sx':
        qc.h(qubits[0])
        qc.s(qubits[0])
        qc.h(qubits[0])
    elif name == 'rz':
        angle = instruction.operation.params[0]
        qc.p(qubits[0], angle)
        qc.gp(angle/2)
    elif name == 'p' or name == 'u1':
        angle = instruction.operation.params[0]
        qc.p(qubits[0], angle)
    elif name == 'cx':
        qc.cx(qubits[0], qubits[1])
    elif name == 'cz':
        qc.cz(qubits[0], qubits[1])
    elif name == 'cp' or name == 'cu1':
        angle = instruction.operation.params[0]
        qc.cp(qubits[0], qubits[1], angle)
    elif name == 'ccx':
        qc.ccx(qubits[0], qubits[1], qubits[2])
    elif name == 'swap':
        qc.swap(qubits[0], qubits[1])
    elif name == 'iswap':
        qc.iswap(qubits[0], qubits[1])
    elif name == 'cswap':
        qc.cswap(qubits[0], qubits[1], qubits[2])
    elif name == 'rzz':
        angle = instruction.operation.params[0]
        qc.cx(qubits[0], qubits[1])
        qc.p(qubits[1], angle)
        qc.cx(qubits[0], qubits[1])
    else:
        return f"ERROR: Unsupported gate '{name}'"


def simulate_qiskit_circuit(circuit, qubit_map):
    """
    Simulate Qiskit circuit using Quasimodo.
    """
    # create Quasimodo QuantumCircuit
    qc = quasimodo.QuantumCircuit("CFLOBDD", circuit.num_qubits)

    # loop over circuit instructions
    for instruction in circuit.data:
        op_name = instruction.operation.name
        if op_name == 'measure': # ignore measurment, measure at the end
            continue             # (intermediate measurements shoulnd't occur in bench set)
        elif op_name == 'barrier': # ignore barriers
            continue
        else:
            res = apply_gate(qc, instruction, qubit_map)
            if res is None:
                continue
            else:
                return res
    return "FINISHED"


def simulate_circuit(args):
    """
    Simulate quantum circuit given as QASM file using Quasimodo.
    """
    # load
    circuit = qasm2.load(args.qasmfile, custom_instructions=qasm2.LEGACY_CUSTOM_INSTRUCTIONS)
    qubit_map = create_qubit_mapping(circuit)

    # simulate
    t_start = time.time()
    status = simulate_qiskit_circuit(circuit, qubit_map)
    t_end = time.time()

    # write stats as JSON
    stats = {}
    stats['circuit'] = os.path.basename(args.qasmfile)[:-5]
    stats['simulation_time'] = t_end - t_start
    stats['status'] = status
    json_data = {'statistics' : stats}
    print(json.dumps(json_data, indent=2))


def main():
    """
    Parse arguments and run.
    """
    args = parser.parse_args()
    simulate_circuit(args)


if __name__ == '__main__':
    main()
