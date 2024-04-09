import re
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
qsy_qasm = "timeout {} ./extern/q-sylvan/build/qasm/sim_qasm {} --workers {} {} {} --json {}\n"
mqt_qasm = "timeout {} ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_file {} --shots 1 --ps --pm {} |& tee {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('which', choices=['qasm','grover','shor','supremacy'])
parser.add_argument('--qasm_dir', action='store', help="Path of directory with .qasm files.")
parser.add_argument('--log_vector', action='store_true', default=False, help="Log entire final state vector.")
parser.add_argument('--timeout', action='store', default='10m', help='Timeout time per benchmark')
parser.add_argument('--recursive', action='store_true', default=False, help="Recursively look for .qasm files in given dir.")


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


def atoi(text : str):
    """
    Get int from string if it is a digit.
    """
    return int(text) if text.isdigit() else text


def natural_sorting(filename : str):
    """
    Used for sorting strings containing numbers in numerical way.
    """
    return [ atoi(c) for c in re.split(r'(\d+)', filename)]


def experiments_qasm(args):
    """
    Write bash file to benchmark given qasm files on both Q-Sylvan and MQT DDSIM
    """
    global output_dir
    output_dir = output_dir.format(datetime.now().strftime("%Y%m%d%m_%H%M%S"))
    Path(os.path.join(output_dir,'json')).mkdir(parents=True, exist_ok=True)
    bash_file_all = output_dir + '/run_all.sh'
    bash_file_mqt = output_dir + '/run_mqt.sh'
    bash_file_qsy = output_dir + '/run_qsylvan.sh'
    mqt_vec = '--pv' if args.log_vector else ''
    qsy_vec = '--state-vector' if args.log_vector else ''

    # TODO: test multiple workers for Q-Sylvan
    workers = [1,2,4,8]
    count_nodes = '--count-nodes'

    print(f"Writing to {bash_file_all}, {bash_file_mqt}, {bash_file_qsy}")
    with open(bash_file_all, 'w') as f_all,\
         open(bash_file_mqt, 'w') as f_mqt,\
         open(bash_file_qsy, 'w') as f_qsy:
        f_all.write("#!/bin/bash\n\n# Q-Sylvan + MQT DDSIM benchmarks\n")
        f_mqt.write("#!/bin/bash\n\n# MQT DDSIM benchmarks\n")
        f_qsy.write("#!/bin/bash\n\n# Q-Sylvan benchmarks\n")

        # get qasm files
        filepaths = []
        if args.recursive:
            for root, _, filenames in os.walk(args.qasm_dir):
                for filename in filenames:
                    if filename.endswith('.qasm'):
                        filepaths.append(os.path.join(root, filename))
        else:
            for filename in os.listdir(args.qasm_dir):
                if filename.endswith('.qasm'):
                    filepaths.append(os.path.join(args.qasm_dir, filename))

        # write to bash scripts
        for filepath in sorted(filepaths, key=natural_sorting):
            filename = os.path.basename(filepath)
            # MQT
            json_output = f"{output_dir}/json/{filename[:-5]}_mqt.json"
            f_all.write(mqt_qasm.format(args.timeout, filepath, mqt_vec, json_output))
            f_mqt.write(mqt_qasm.format(args.timeout, filepath, mqt_vec, json_output))
            # Q-Sylvan
            for w in workers:
                json_output = f"{output_dir}/json/{filename[:-5]}_qsylvan_{w}.json"
                f_all.write(qsy_qasm.format(args.timeout, filepath, w, count_nodes, qsy_vec, json_output))
                f_qsy.write(qsy_qasm.format(args.timeout, filepath, w, count_nodes, qsy_vec, json_output))


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()

    if args.which == 'qasm':
        if not args.qasm_dir:
            print("Must set --qasm_dir <path>")
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
