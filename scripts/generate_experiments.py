import re
import os
import sys
import argparse
from datetime import datetime
from pathlib import Path


output_dir  = "experiments/{}"
output_file = "experiments/{}/run.sh"
csv_output  = "experiments/{}/results.csv"

qsy_qasm = "timeout {} ./extern/q-sylvan/build/qasm/sim_qasm {} --workers {} {} {} --json {} &> {}\n"
mqt_qasm = "timeout {} ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_file {} --shots 1 --ps --pm {} 2> {} 1> {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('qasm_dir', help="Path of directory with .qasm files.")
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
    output_dir = output_dir.format(datetime.now().strftime("%Y%m%d_%H%M%S"))
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
            log         = f"{output_dir}/json/{filename[:-5]}_mqt.log"
            f_all.write(mqt_qasm.format(args.timeout, filepath, mqt_vec, log, json_output))
            f_mqt.write(mqt_qasm.format(args.timeout, filepath, mqt_vec, log, json_output))
            # Q-Sylvan
            for w in workers:
                json_output = f"{output_dir}/json/{filename[:-5]}_qsylvan_{w}.json"
                log         = f"{output_dir}/json/{filename[:-5]}_qsylvan_{w}.log"
                f_all.write(qsy_qasm.format(args.timeout, filepath, w, count_nodes, qsy_vec, json_output, log))
                f_qsy.write(qsy_qasm.format(args.timeout, filepath, w, count_nodes, qsy_vec, json_output, log))


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()
    experiments_qasm(args)


if __name__ == '__main__':
    main()
