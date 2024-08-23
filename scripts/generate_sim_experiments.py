"""
Python script to generate bash scipts for QC simulation benchmarks.
"""
import re
import os
import json
import argparse
from datetime import datetime
from pathlib import Path

EXPERIMENTS_DIR = "experiments/"

QSY_QASM = "timeout {} ./tools/q-sylvan/build/qasm/run_qasm_on_qmdd {} --workers {} {} --json {} &> {}\n"
MQT_QASM = "timeout {} ./tools/mqt-ddsim/build/apps/mqt-ddsim-simple --simulate_file {} --shots 1 --ps --pm {} 2> {} 1> {}\n"
QUA_QASM = "cd tools/Quasimodo/python_pkg; "\
           "timeout {} python quasimodo_qasm.py ../../../{} 2> ../../../{} 1> ../../../{}; "\
           "cd ../../..\n"


parser = argparse.ArgumentParser()
parser.add_argument('qasm_dir', help="Path of directory with .qasm files.")
parser.add_argument('--name', help="Name for experiments dir.")
parser.add_argument('--log_vector', action='store_true', default=False, help="Log entire final state vector.")
parser.add_argument('--nqubits', type=int, nargs='+', help="Only include circuits of nqubits.")
parser.add_argument('--max_qubits', type=int, help="Only include circuits up to max_qubits.")
parser.add_argument('--norm_strat', choices=['low','max','min','l2'], default='max', help="Norm strat to use for all q-sylvan runs.")
parser.add_argument('--wgt_tab_size', type=int, default=23, help="log2 of max edge weight table size.")
parser.add_argument('--node_tab_size', type=int, default=25, help="log2 of max node table size.")
parser.add_argument('--test_norm_strats', action='store_true', default=False, help="Run with different norm strats.")
parser.add_argument('--test_inv_caching', action='store_true', default=False ,help="Run with both INV-CACHING on/off.")
parser.add_argument('--test_reorder', action='store_true', default=False, help="Run with reorder qubits on/off.")
parser.add_argument('--tools', nargs='+', default=['q-sylvan','mqt'], help="Which tools to include (q-sylvan, mqt, quasimodo).")
parser.add_argument('--workers', nargs='+', default=[1], help="Run multicore benchmarks for given number of workers.")
parser.add_argument('--timeout', action='store', default='10m', help='Timeout time per benchmark')
parser.add_argument('--recursive', action='store_true', default=False, help="Recursively look for .qasm files in given dir.")


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
    Assumes last number in the filename is the number of qubits.
    """
    nums = re.findall(r'\d+', filename)
    if len(nums) >= 1:
        return int(nums[-1])
    return None


def skip(filename : str, args):
    """
    Returns True if file should be skipped based on args.
    """
    if args.max_qubits is not None:
        if get_num_qubits(filename) is None or\
           get_num_qubits(filename) > args.max_qubits:
            return True
    if args.nqubits is not None:
        if get_num_qubits(filename) not in args.nqubits:
            return True
    return False


def experiments_sim_qasm(args):
    """
    Write bash file to simulate given qasm files on both Q-Sylvan and MQT DDSIM.
    """
    if args.name is not None:
        output_dir = os.path.join(EXPERIMENTS_DIR, args.name)
    else:
        output_dir = os.path.join(EXPERIMENTS_DIR, datetime.now().strftime("%Y%m%d_%H%M%S"))
    Path(os.path.join(output_dir,'json')).mkdir(parents=True, exist_ok=True)
    Path(os.path.join(output_dir,'logs')).mkdir(parents=True, exist_ok=True)
    Path(os.path.join(output_dir,'meta')).mkdir(parents=True, exist_ok=True)
    bash_file_all = output_dir + '/run_all.sh'
    bash_file_mqt = output_dir + '/run_mqt.sh'
    bash_file_qsy = output_dir + '/run_qsylvan.sh'
    bash_file_qua = output_dir + '/run_quasimodo.sh'

    mqt_args = ''
    qsy_args = ''
    if args.log_vector:
        mqt_args += '--pv'
        qsy_args += '--state-vector'
    if len(args.workers) == 1 and int(args.workers[0]) == 1:
        qsy_args += ' --count-nodes'
    inv_caching = ['', ' --disable-inv-caching'] if args.test_inv_caching else ['']
    reorder = ['', ' --reorder', ' --reorder-swaps'] if args.test_reorder else [' --reorder']
    norm_strats = [' -s low', ' -s max', ' -s min',  ' -s l2'] if args.test_norm_strats else [f' -s {args.norm_strat}']
    qsy_args += f' --wgt-tab-size {args.wgt_tab_size}'
    qsy_args += f' --node-tab-size {args.node_tab_size}'

    print(f"Writing to {bash_file_all}, {bash_file_mqt}, {bash_file_qsy}")
    with open(bash_file_all, 'w', encoding='utf-8') as f_all,\
         open(bash_file_mqt, 'w', encoding='utf-8') as f_mqt,\
         open(bash_file_qsy, 'w', encoding='utf-8') as f_qsy,\
         open(bash_file_qua, 'w', encoding='utf-8') as f_qua:
        f_all.write(f"#!/bin/bash\n\n# Circuit simulation benchmarks on {args.tools}\n")
        f_mqt.write("#!/bin/bash\n\n# MQT DDSIM circuit simulation benchmarks\n")
        f_qsy.write("#!/bin/bash\n\n# Q-Sylvan circuit simulation benchmarks\n")
        f_qua.write("#!/bin/bash\n\n# Quasimodo circuit simulation benchmarks\n")

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

            # TODO: put code for each of the tools in separate function
            # MQT (QMDD)
            if 'mqt' in args.tools:
                exp_counter += 1
                json_output = f"{output_dir}/json/{filename[:-5]}_mqt_{exp_counter}.json"
                log         = f"{output_dir}/logs/{filename[:-5]}_mqt_{exp_counter}.log"
                meta        = f"{output_dir}/meta/{filename[:-5]}_mqt_{exp_counter}.json"
                f_all.write(MQT_QASM.format(args.timeout, filepath, mqt_args, log, json_output))
                f_mqt.write(MQT_QASM.format(args.timeout, filepath, mqt_args, log, json_output))
                with open(meta, 'w', encoding='utf-8') as meta_file:
                    json.dump({ 'circuit_type' : filename.split('_')[0],
                                'circuit' : filename[:-5],
                                'exp_id' : exp_counter,
                                'n_qubits' : get_num_qubits(filename),
                                'tool' : 'mqt',
                                'norm_strat' : 'l2',
                                'workers' : 1}, meta_file, indent=2)

            # Quasimodo (CFLOBDD)
            if 'quasimodo' in args.tools:
                exp_counter += 1
                json_output = f"{output_dir}/json/{filename[:-5]}_quasimodo_{exp_counter}.json"
                log         = f"{output_dir}/logs/{filename[:-5]}_quasimodo_{exp_counter}.log"
                meta        = f"{output_dir}/meta/{filename[:-5]}_quasimodo_{exp_counter}.json"
                f_all.write(QUA_QASM.format(args.timeout, filepath, log, json_output))
                f_qua.write(QUA_QASM.format(args.timeout, filepath, log, json_output))
                with open(meta, 'w', encoding='utf-8') as meta_file:
                    json.dump({ 'circuit_type' : filename.split('_')[0],
                                'circuit' : filename[:-5],
                                'exp_id' : exp_counter,
                                'n_qubits' : get_num_qubits(filename),
                                'tool' : 'quasimodo',
                                'norm_strat' : 'n/a',
                                'workers' : 1}, meta_file, indent=2)

            # Q-Sylvan (QMDD)
            if 'q-sylvan' in args.tools:
                for w in args.workers:
                    for s in norm_strats:
                        for inv in inv_caching:
                            for r in reorder:
                                exp_counter += 1
                                json_output = f"{output_dir}/json/{filename[:-5]}_qsylvan_{exp_counter}.json"
                                log         = f"{output_dir}/logs/{filename[:-5]}_qsylvan_{exp_counter}.log"
                                meta        = f"{output_dir}/meta/{filename[:-5]}_qsylvan_{exp_counter}.json"
                                f_all.write(QSY_QASM.format(args.timeout, filepath, w, qsy_args+s+inv+r, json_output, log))
                                f_qsy.write(QSY_QASM.format(args.timeout, filepath, w, qsy_args+s+inv+r, json_output, log))
                                with open(meta, 'w', encoding='utf-8') as meta_file:
                                    json.dump({ 'circuit_type' : filename.split('_')[0],
                                                'circuit' : filename[:-5],
                                                'exp_id' : exp_counter,
                                                'n_qubits' : get_num_qubits(filename),
                                                'tool' : 'q-sylvan',
                                                'norm_strat' : s.split()[-1],
                                                'workers' : w}, meta_file, indent=2)


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()
    experiments_sim_qasm(args)


if __name__ == '__main__':
    main()
