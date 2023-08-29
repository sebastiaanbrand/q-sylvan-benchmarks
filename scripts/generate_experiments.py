import os
import sys
import argparse
from datetime import datetime
from pathlib import Path

# NOTE: This script is not updated for anything other than qasm benchmarks.

output_dir  = "experiments/{}"
output_file = "experiments/{}/run.sh"
csv_output  = "experiments/{}/results.csv"

run_grov = "timeout {} ./extern/q-sylvan/build/examples/alg_run grover --qubits={} --norm-strat={} --it-ref={} --tol={} --workers={} --csv-output={}\n"
run_shor = "timeout {} ./extern/q-sylvan/build/examples/alg_run shor --shor-N={} --norm-strat={} --it-ref={} --tol={} --workers={} --rseed={} --csv-output={}\n"
run_sup  = "timeout {} ./extern/q-sylvan/build/examples/alg_run supremacy --qubits={} --depth={} --norm-strat={} --it-ref={} --tol={} --workers={} --rseed={} --csv-output={}\n"
qsv_qasm = "timeout {} ./extern/q-sylvan/build/qasm/sim_qasm {} --workers {} {} --json {}\n"
mqt_qasm = "timeout {} ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_file {} --shots 1 --ps --pm |& tee {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('which', choices=['qasm','grover','shor','supremacy'])
parser.add_argument('--qasm_folder', action='store', help="Path to folder with .qasm files.")
parser.add_argument('--timeout', action='store', default='10m', help='Timeout time per benchmark')


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
    """
    Write bash file to benchmark given qasm files on both Q-Sylvan and MQT DDSIM
    """
    global output_dir
    output_dir = output_dir.format(datetime.now().strftime("%Y%m%d%m_%H%M%S"))
    Path(output_dir).mkdir(parents=True, exist_ok=True)
    bash_file = output_dir + '/run_all.sh'

    # TODO: test multiple workers for Q-Sylvan
    workers = [1]
    count_nodes = '--count-nodes'

    print(f"Writing to {bash_file}")
    with open(bash_file, 'w') as f:
        f.write("#!/bin/bash\n\n")
        f.write("# Q-Sylvan + MQT DDSIM benchmarks\n")
        for filename in sorted(os.listdir(args.qasm_folder)):
            if (filename.endswith('.qasm')):
                filepath = os.path.join(args.qasm_folder, filename)
                # MQT
                json_output = f"{output_dir}/{filename[:-5]}_mqt.json"
                f.write(mqt_qasm.format(args.timeout, filepath, json_output))
                # Q-Sylvan
                for w in workers:
                    json_output = f"{output_dir}/{filename[:-5]}_qsylvan_{w}.json"
                    f.write(qsv_qasm.format(args.timeout, filepath, w, count_nodes, json_output))


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()

    if args.which == 'qasm':
        if not args.qasm_folder:
            print("Must set --qasm_folder <folder>")
        else:
            experiments_qasm(args)
    elif args.which == 'grover':
        experiments_grover()
    elif args.which == 'shor':
        experiments_shor()
    elif args.which == 'supremacy':
        experiments_supremacy()

if __name__ == '__main__':
    main()
