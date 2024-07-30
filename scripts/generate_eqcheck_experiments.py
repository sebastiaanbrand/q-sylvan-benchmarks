"""
Python script to generate bash scipts for QC equivalence checking benchmarks.
"""
import re
import os
import json
import argparse
from datetime import datetime
from pathlib import Path
import qiskit.qasm2


EXPERIMENTS_DIR = "experiments/"
Q_SYLVAN = "timeout {} ./tools/q-sylvan/build/examples/circuit_equivalence {} {} --workers {} {} 2> {} 1> {}\n"
#QUOKKA_SHARP = "python tools/quokka-sharp/quokka-sharp-cli.py {} {} 2> {} 1> {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('qasm_dir', help="Path to dir with subdirs origin/, opt/ gm/, flip/")
parser.add_argument('--name', help="Name for experiments dir.")
parser.add_argument('--norm_strat', choices=['low','max','min','l2'], default='max', help="Norm strat to use for all runs.")
parser.add_argument('--test_multicore', action='store_true', default=False, help="Run multicore benchmarks.")
parser.add_argument('--timeout', action='store', default=600, help='Timeout time per benchmark in seconds')


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


def experiments_eqcheck(args):
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
    bash_file = os.path.join(output_dir, 'run_all.sh')
    
    cli_args = ''
    if args.test_multicore:
        cli_args += ' --count-nodes'
    workers = [1,2,4,8] if args.test_multicore else [1]
    
    print(f"Writing to {bash_file}")
    origin_dir = os.path.join(args.qasm_dir, 'origin')
    with open(bash_file, 'w', encoding='utf-8') as f:
        f.write("#!/bin/bash\n\n# Circuit equivalence checking benchmarks\n\n")

        # get qasm files
        origin_files = []
        for filename in sorted(os.listdir(origin_dir), key=natural_sorting):
            if filename.endswith('.qasm'):
                origin_files.append(filename)

        # write to bash script
        exp_counter = 0
        for comp_dir, comp_ext in [('opt','.opt.qasm'), ('gm','.gm.qasm'), ('flip', '.fp.qasm')]:
            f.write(f'\n# {comp_dir}\n')

            comp_dir = os.path.join(args.qasm_dir, comp_dir)
            for origin_file in origin_files:
                origin_path  = os.path.join(origin_dir, origin_file)
                compare_path = os.path.join(comp_dir, origin_file) + comp_ext
                if not os.path.isfile(compare_path):
                    continue
                
                # get circuits for metadata
                qc_origin  = qiskit.qasm2.load(origin_path)
                qc_compare = qiskit.qasm2.load(compare_path)
                assert qc_origin.num_qubits == qc_compare.num_qubits

                # add quokka-sharp run
                #exp_counter += 1
                #json_out = f"{output_dir}/json/{origin_file[:-5]}_quokkasharp_{exp_counter}.json"
                #log      = f"{output_dir}/logs/{origin_file[:-5]}_quokkasharp_{exp_counter}.log"
                #meta     = f"{output_dir}/meta/{origin_file[:-5]}_quokkasharp_{exp_counter}.json"
                #f.write(QUOKKA_SHARP.format(origin_path, compare_path, log, json_out))
                #with open(meta, 'w', encoding='utf-8') as meta_file:
                #    json.dump({ 'circuit_type' : origin_file.split('_')[0],
                #                'circuit_U' : origin_file[:-5],
                #                'circuit_V' : os.path.basename(compare_path)[:-5],
                #                'exp_id' : exp_counter,
                #                'n_gates_U' : sum(qc_origin.count_ops().values()),
                #                'n_gates_V' : sum(qc_compare.count_ops().values()),
                #                'n_qubits' : qc_origin.num_qubits,
                #                'tool' : 'quokka-sharp',
                #                'type' : os.path.basename(comp_dir),
                #                'workers' : 1}, meta_file, indent=2)

                # add q-sylvan runs
                for w in workers:
                    exp_counter += 1
                    json_out = f"{output_dir}/json/{origin_file[:-5]}_qsylvan_{w}_{exp_counter}.json"
                    log      = f"{output_dir}/logs/{origin_file[:-5]}_qsylvan_{w}_{exp_counter}.log"
                    meta     = f"{output_dir}/meta/{origin_file[:-5]}_qsylvan_{w}_{exp_counter}.json"
                    f.write(Q_SYLVAN.format(args.timeout, origin_path, compare_path, w, cli_args, log, json_out))
                    with open(meta, 'w', encoding='utf-8') as meta_file:
                        json.dump({ 'circuit_type' : origin_file.split('_')[0],
                                    'circuit_U' : origin_file[:-5],
                                    'circuit_V' : os.path.basename(compare_path)[:-5],
                                    'exp_id' : exp_counter,
                                    'n_gates_U' : sum(qc_origin.count_ops().values()),
                                    'n_gates_V' : sum(qc_compare.count_ops().values()),
                                    'n_qubits' : qc_origin.num_qubits,
                                    'tool' : 'q-sylvan',
                                    'type' : os.path.basename(comp_dir),
                                    'workers' : w}, meta_file, indent=2)


def main():
    """
    Generate bash scripts which run benchmarks.
    """
    args = parser.parse_args()
    experiments_eqcheck(args)


if __name__ == '__main__':
    main()
