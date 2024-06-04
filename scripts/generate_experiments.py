"""
Python script to generate bash scipts which run benchmarks.
"""
import re
import os
import argparse
from datetime import datetime
from pathlib import Path


output_dir  = "experiments/{}"
output_file = "experiments/{}/run.sh"
csv_output  = "experiments/{}/results.csv"

qsy_qasm = "timeout {} ./extern/q-sylvan/build/qasm/sim_qasm {} --workers {} {} --json {} &> {}\n"
mqt_qasm = "timeout {} ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_file {} --shots 1 --ps --pm {} 2> {} 1> {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('qasm_dir', help="Path of directory with .qasm files.")
parser.add_argument('--name', help="Name for experiments dir.")
parser.add_argument('--log_vector', action='store_true', default=False, help="Log entire final state vector.")
parser.add_argument('--max_qubits', type=int, help="Get all qasm files from qasm_dir, up to max_qubits.")
parser.add_argument('--test_multicore', action='store_true', default=False, help="Run multicore benchmarks.")
parser.add_argument('--test_norm_strats', action='store_true', default=False, help="Run with different norm strats.")
parser.add_argument('--test_inv_caching', action='store_true', default=False ,help="Run with both INV-CACHING on/off.")
parser.add_argument('--test_reorder', action='store_true', default=False, help="Run with reorder qubits on/off.")
parser.add_argument('--timeout', action='store', default='10m', help='Timeout time per benchmark')
parser.add_argument('--recursive', action='store_true', default=False, help="Recursively look for .qasm files in given dir.")


def init_output_file():
    """
    Initialize the output bash file.
    """
    global output_file
    global csv_output
    dt_string = datetime.now().strftime("%Y%m%d%m_%H%M%S")
    output_file = output_file.format(dt_string)
    csv_output  = csv_output.format(dt_string)
    print(f"writing to {output_file}")

    with open(output_file, 'w', encoding='utf-8') as f:
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


def get_num_qubits(filename : str):
    """
    Assumes first number in the filename is the number of qubits.
    """
    nums = re.findall(r'\d+', filename)
    if len(nums) >= 1:
        return int(nums[0])
    return None


def skip(filename : str, args):
    """
    Returns True if file should be skipped based on args.
    """
    if args.max_qubits is not None:
        if get_num_qubits(filename) is None or\
           get_num_qubits(filename) > args.max_qubits:
            return True
    return False


def experiments_qasm(args):
    """
    Write bash file to benchmark given qasm files on both Q-Sylvan and MQT DDSIM
    """
    global output_dir
    if args.name is not None:
        output_dir = output_dir.format(args.name)
    else:
        output_dir = output_dir.format(datetime.now().strftime("%Y%m%d_%H%M%S"))
    Path(os.path.join(output_dir,'json')).mkdir(parents=True, exist_ok=True)
    bash_file_all = output_dir + '/run_all.sh'
    bash_file_mqt = output_dir + '/run_mqt.sh'
    bash_file_qsy = output_dir + '/run_qsylvan.sh'
    mqt_args = ''
    qsy_args = ''
    if args.log_vector:
        mqt_args += '--pv'
        qsy_args += '--state-vector'

    qsy_args += ' --count-nodes --allow-reorder-swaps'
    workers = [1,2,4,8] if args.test_multicore else [1]
    inv_caching = ['', ' --disable-inv-caching'] if args.test_inv_caching else ['']
    reorder = ['', ' --allow-reorder', ' --allow-reorder-swaps'] if args.test_reorder else ['']
    norm_strats = [' -s low', ' -s largest', ' -s l2'] if args.test_norm_strats else ['']

    print(f"Writing to {bash_file_all}, {bash_file_mqt}, {bash_file_qsy}")
    with open(bash_file_all, 'w', encoding='utf-8') as f_all,\
         open(bash_file_mqt, 'w', encoding='utf-8') as f_mqt,\
         open(bash_file_qsy, 'w', encoding='utf-8') as f_qsy:
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
        exp_counter = 0
        for filepath in sorted(filepaths, key=natural_sorting):
            filename = os.path.basename(filepath)
            if skip(filename, args):
                continue
            # MQT
            json_output = f"{output_dir}/json/{filename[:-5]}_mqt.json"
            log         = f"{output_dir}/json/{filename[:-5]}_mqt.log"
            f_all.write(mqt_qasm.format(args.timeout, filepath, mqt_args, log, json_output))
            f_mqt.write(mqt_qasm.format(args.timeout, filepath, mqt_args, log, json_output))
            # Q-Sylvan
            for w in workers:
                for s in norm_strats:
                    for inv in inv_caching:
                        for r in reorder:
                            exp_counter += 1
                            json_output = f"{output_dir}/json/{filename[:-5]}_qsylvan_{w}_{exp_counter}.json"
                            log         = f"{output_dir}/json/{filename[:-5]}_qsylvan_{w}_{exp_counter}.log"
                            f_all.write(qsy_qasm.format(args.timeout, filepath, w, qsy_args+s+inv+r, json_output, log))
                            f_qsy.write(qsy_qasm.format(args.timeout, filepath, w, qsy_args+s+inv+r, json_output, log))


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()
    experiments_qasm(args)


if __name__ == '__main__':
    main()
