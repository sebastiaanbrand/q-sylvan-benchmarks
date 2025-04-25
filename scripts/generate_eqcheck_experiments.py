"""
Python script to generate bash scipts for QC equivalence checking benchmarks.
"""
import re
import os
import json
import argparse
from datetime import datetime
from pathlib import Path
from qiskit import qasm2


EXPERIMENTS_DIR = "experiments/"
Q_SYLVAN = "timeout {} ./tools/q-sylvan/build/examples/circuit_equivalence {} {} --workers {} {} 2> {} 1> {}\n"
QUOKKA_SHARP = "python tools/quokka-sharp/cli.py {} {} --workers {} 2> {} 1> {}\n"
MQT_QCEC = "timeout {} python tools/mqt_qcec.py {} {} --alg {} --workers {} 2> {} 1> {}\n"
SLI_QEC = "timeout {} ./tools/SliQEC/SliQEC --circuit1 {} --circuit2 {} 2> {} 1> {}\n"


parser = argparse.ArgumentParser()
parser.add_argument('qasm_dir', help="Path to dir with subdirs origin/, opt/ gm/, flip/")
parser.add_argument('--name', help="Name for experiments dir.")
parser.add_argument('--eqcheck_algs', choices=['alternating','pauli'], default=['alternating','pauli'], help="Which eqcheck alg for q-sylvan to use.")
parser.add_argument('--qcec_alg', choices=['alt','all'], default='all', help="Settings for mqt qcec.")
parser.add_argument('--tools', nargs='+', default=['q-sylvan','mqt', 'quokka'], help="Which tools to include (q-sylvan, mqt, quokka).")
parser.add_argument('--norm_strat', choices=['low','max','min','l2'], default='max', help="Norm strat to use for all runs.")
parser.add_argument('--wgt_tab_size', type=int, default=23, help="log2 of max edge weight table size.")
parser.add_argument('--node_tab_size', type=int, default=25, help="log2 of max node table size.")
parser.add_argument('--workers', nargs='+', default=[1], type=int, help="Run multicore benchmarks for given number of workers.")
parser.add_argument('--include_shift', action='store_true', default=False, help="Include shift 1e-4 and 1e-7 eqchecks.")
parser.add_argument('--timeout', action='store', default=300, help='Timeout time per benchmark in seconds')


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
    bash_file_all = os.path.join(output_dir, 'run_all.sh')
    bash_file_qsy = os.path.join(output_dir, 'run_qsylvan.sh')
    bash_file_quo = os.path.join(output_dir, 'run_quokkasharp.sh')
    bash_file_mqt = os.path.join(output_dir, 'run_mqt.sh')

    cli_args = ''
    cli_args += f' --norm-strat {args.norm_strat}'
    cli_args += f' --wgt-tab-size {args.wgt_tab_size}'
    cli_args += f' --node-tab-size {args.node_tab_size}'

    print(f"Writing to {output_dir}")
    origin_dir = os.path.join(args.qasm_dir, 'origin')
    with open(bash_file_all, 'w', encoding='utf-8') as f_all,\
         open(bash_file_qsy, 'w', encoding='utf-8') as f_qsy,\
         open(bash_file_quo, 'w', encoding='utf-8') as f_quo,\
         open(bash_file_mqt, 'w', encoding='utf-8') as f_mqt:
        f_all.write("#!/bin/bash\n\n# Circuit equivalence checking benchmarks\n")
        f_qsy.write("#!/bin/bash\n\n# Circuit equivalence checking benchmarks\n")
        f_quo.write("#!/bin/bash\n\n# Circuit equivalence checking benchmarks\n")
        f_mqt.write("#!/bin/bash\n\n# Circuit equivalence checking benchmarks\n")
        f_all.write(f"\n# Quokka-Sharp timeout\nexport TIMEOUT={args.timeout}\n")
        f_quo.write(f"\n# Quokka-Sharp timeout\nexport TIMEOUT={args.timeout}\n")

        # get qasm files
        origin_files = []
        for filename in sorted(os.listdir(origin_dir), key=natural_sorting):
            if filename.endswith('.qasm'):
                origin_files.append(filename)

        # write to bash script
        exp_counter = 0
        selection = [('opt','.opt.qasm'), ('gm','.gm.qasm'), ('flip', '.fp.qasm')]
        if args.include_shift:
            selection += [('shift4','.ps4.qasm'), ('shift7','.ps7.qasm')]
        for comp_dir, comp_ext in selection:
            f_all.write(f'\n# {comp_dir}\n')
            f_qsy.write(f'\n# {comp_dir}\n')
            f_quo.write(f'\n# {comp_dir}\n')

            comp_dir = os.path.join(args.qasm_dir, comp_dir)
            for origin_file in origin_files:
                origin_path  = os.path.join(origin_dir, origin_file)
                compare_path = os.path.join(comp_dir, origin_file) + comp_ext
                if not os.path.isfile(compare_path):
                    continue

                # get circuits for metadata
                qc_origin  = qasm2.load(origin_path, custom_instructions=qasm2.LEGACY_CUSTOM_INSTRUCTIONS)
                qc_compare = qasm2.load(compare_path, custom_instructions=qasm2.LEGACY_CUSTOM_INSTRUCTIONS)
                assert qc_origin.num_qubits == qc_compare.num_qubits

                for w in args.workers:
                    # quokka-sharp run
                    if 'quokka' in args.tools:
                        exp_counter += 1
                        json_out = f"{output_dir}/json/{origin_file[:-5]}_quokkasharp_{exp_counter}.json"
                        log      = f"{output_dir}/logs/{origin_file[:-5]}_quokkasharp_{exp_counter}.log"
                        meta     = f"{output_dir}/meta/{origin_file[:-5]}_quokkasharp_{exp_counter}.json"
                        f_all.write(QUOKKA_SHARP.format(origin_path, compare_path, w, log, json_out))
                        f_quo.write(QUOKKA_SHARP.format(origin_path, compare_path, w, log, json_out))
                        with open(meta, 'w', encoding='utf-8') as meta_file:
                            json.dump({ 'circuit_type' : origin_file.split('_')[0],
                                        'circuit_U' : origin_file[:-5],
                                        'circuit_V' : os.path.basename(compare_path)[:-5],
                                        'exp_id' : exp_counter,
                                        'n_gates_U' : sum(qc_origin.count_ops().values()),
                                        'n_gates_V' : sum(qc_compare.count_ops().values()),
                                        'n_qubits' : qc_origin.num_qubits,
                                        'tool' : 'quokka-sharp',
                                        'type' : os.path.basename(comp_dir),
                                        'workers' : w}, meta_file, indent=2)

                    # mqt qcec run
                    if 'mqt' in args.tools:
                        exp_counter += 1
                        json_out = f"{output_dir}/json/{origin_file[:-5]}_mqt_{exp_counter}.json"
                        log      = f"{output_dir}/logs/{origin_file[:-5]}_mqt_{exp_counter}.log"
                        meta     = f"{output_dir}/meta/{origin_file[:-5]}_mqt_{exp_counter}.json"
                        f_all.write(MQT_QCEC.format(args.timeout, origin_path, compare_path, args.qcec_alg, w, log, json_out))
                        f_mqt.write(MQT_QCEC.format(args.timeout, origin_path, compare_path, args.qcec_alg, w, log, json_out))
                        with open(meta, 'w', encoding='utf-8') as meta_file:
                            json.dump({ 'circuit_type' : origin_file.split('_')[0],
                                        'circuit_U' : origin_file[:-5],
                                        'circuit_V' : os.path.basename(compare_path)[:-5],
                                        'exp_id' : exp_counter,
                                        'n_gates_U' : sum(qc_origin.count_ops().values()),
                                        'n_gates_V' : sum(qc_compare.count_ops().values()),
                                        'n_qubits' : qc_origin.num_qubits,
                                        'tool' : f'mqt-qcec-{args.qcec_alg}',
                                        'type' : os.path.basename(comp_dir),
                                        'workers' : w}, meta_file, indent=2)

                    # q-sylvan run
                    if 'q-sylvan' in args.tools:
                        for alg in args.eqcheck_algs:
                            exp_counter += 1
                            json_out = f"{output_dir}/json/{origin_file[:-5]}_qsylvan_{exp_counter}.json"
                            log      = f"{output_dir}/logs/{origin_file[:-5]}_qsylvan_{exp_counter}.log"
                            meta     = f"{output_dir}/meta/{origin_file[:-5]}_qsylvan_{exp_counter}.json"
                            _cli_args = cli_args + f' --algorithm {alg}'
                            f_all.write(Q_SYLVAN.format(args.timeout, origin_path, compare_path,  w, _cli_args, log, json_out))
                            f_qsy.write(Q_SYLVAN.format(args.timeout, origin_path, compare_path, w, _cli_args, log, json_out))
                            with open(meta, 'w', encoding='utf-8') as meta_file:
                                json.dump({ 'circuit_type' : origin_file.split('_')[0],
                                            'circuit_U' : origin_file[:-5],
                                            'circuit_V' : os.path.basename(compare_path)[:-5],
                                            'exp_id' : exp_counter,
                                            'n_gates_U' : sum(qc_origin.count_ops().values()),
                                            'n_gates_V' : sum(qc_compare.count_ops().values()),
                                            'n_qubits' : qc_origin.num_qubits,
                                            'tool' : f'q-sylvan-{alg}',
                                            'type' : os.path.basename(comp_dir),
                                            'workers' : w}, meta_file, indent=2)

                    # sliqec run
                    if 'sliqec' in args.tools:
                        exp_counter += 1
                        json_out = f"{output_dir}/json/{origin_file[:-5]}_sliqec_{exp_counter}.json"
                        log      = f"{output_dir}/logs/{origin_file[:-5]}_sliqec_{exp_counter}.log"
                        meta     = f"{output_dir}/meta/{origin_file[:-5]}_sliqec_{exp_counter}.json"
                        f_all.write(SLI_QEC.format(args.timeout, origin_path, compare_path, log, json_out))
                        f_mqt.write(SLI_QEC.format(args.timeout, origin_path, compare_path, log, json_out))
                        with open(meta, 'w', encoding='utf-8') as meta_file:
                            json.dump({ 'circuit_type' : origin_file.split('_')[0],
                                        'circuit_U' : origin_file[:-5],
                                        'circuit_V' : os.path.basename(compare_path)[:-5],
                                        'exp_id' : exp_counter,
                                        'n_gates_U' : sum(qc_origin.count_ops().values()),
                                        'n_gates_V' : sum(qc_compare.count_ops().values()),
                                        'n_qubits' : qc_origin.num_qubits,
                                        'tool' : 'sli-qec',
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
