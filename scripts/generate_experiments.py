import os
import sys
import argparse
from datetime import datetime

output_file = "experiments/bench_{}.sh"
csv_output  = "experiments/bench_{}_res.csv"

run_grov = "timeout {} ./extern/q-sylvan/build/examples/alg_run grover --qubits={} --norm-strat={} --it-ref={} --tol={} --workers={} --csv-output={}\n"
run_shor = "timeout {} ./extern/q-sylvan/build/examples/alg_run shor --shor-N={} --norm-strat={} --it-ref={} --tol={} --workers={} --rseed={} --csv-output={}\n"
run_sup  = "timeout {} ./extern/q-sylvan/build/examples/alg_run supremacy --qubits={} --depth={} --norm-strat={} --it-ref={} --tol={} --workers={} --rseed={} --csv-output={}\n"
run_qasm = "timeout {} ./extern/q-sylvan/build/qasm/sim_qasm {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('which', choices=['qasm','grover','shor','supremacy'])
parser.add_argument('--qasm_folder', action='store', help="Path to folder with .qasm files.")


def init_output_file():
    global output_file
    global csv_output
    dt_string = datetime.now().strftime("%Y%m%d%m_%H%M%S")
    output_file = output_file.format(dt_string)
    csv_output  = csv_output.format(dt_string)
    print(f"writing to {output_file}")

    with open(output_file, 'w') as f:
        f.write("#!/bin/bash\n\n")


def experiments_grover():

    # configs to test
    init_output_file()
    timeout = '10m'
    qubits = [9, 10, 11, 14, 19, 24, 29, 34, 39]
    tol = [1e-14]
    norm_strat = ['low', 'largest', 'l2']
    it_ref = [0]
    workers = [1,2,4,8]

    with open(output_file, 'a') as f:
        f.write("# grover experiments\n")
        for q in qubits:
            for ns in norm_strat:
                for ir in it_ref:
                    for t in tol:
                        for w in workers:
                            f.write(run_grov.format(timeout, q, ns, ir, t, w, csv_output))
        f.write("\n")


def experiments_shor():

    # configs to test
    init_output_file()
    timeout = '10m'
    shor_N = [15,21,33]
    tol = [1e-14]
    norm_strat = ['largest']
    it_ref = [0]
    workers = [1,2,4,8]
    rseed = 42

    with open(output_file, 'a') as f:
        f.write("# shor experiments\n")
        for N in shor_N:
            for ns in norm_strat:
                for ir in it_ref:
                    for t in tol:
                        for w in workers:
                            f.write(run_shor.format(timeout, N, ns, ir, t, w, rseed, csv_output))
        f.write("\n")


def experiments_supremacy():

    # configs to test
    init_output_file()
    timeout = '10m'
    qubits = [20]
    depth = [15,16,17,18,19,20]
    tol = [1e-14]
    norm_strat = ['largest']
    it_ref = [0]
    workers = [1,2,4,8]
    rseed = 42

    with open(output_file, 'a') as f:
        f.write("# supremacy experiments\n")
        for q in qubits:
            for d in depth:
                for ns in norm_strat:
                    for ir in it_ref:
                        for t in tol:
                            for w in workers:
                                f.write(run_sup.format(timeout, q, d, ns, ir, t, w, rseed, csv_output))
        f.write("\n")


def experiments_qasm(args):
    
    # configs to test
    timeout = '10m'
    qasm_folder = args.qasm_folder
    output_file = os.path.join(qasm_folder, 'bench_all.sh')

    print(f"writing to {output_file}")
    with open(output_file, 'w') as f:
        f.write("#!/bin/bash\n\n")
        f.write("# Q-Sylvan\n")
        for filename in sorted(os.listdir(qasm_folder)):
            filepath = qasm_folder + filename
            f.write(run_qasm.format(timeout, filepath))


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()

    if args.which == 'qasm':
        experiments_qasm(args)
    elif args.which == 'grover':
        experiments_grover()
    elif args.which == 'shor':
        experiments_shor()
    elif args.which == 'supremacy':
        experiments_supremacy()

if __name__ == '__main__':
    main()
