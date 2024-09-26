"""
Simple wrapper to use MQT QCEC from command line since all benchmarks are run
using bash scripts.
"""
import os
import json
import argparse
from mqt import qcec


parser = argparse.ArgumentParser()
parser.add_argument('qasmfile1', help="Path to .qasm file.")
parser.add_argument('qasmfile2', help="Path to .qasm file.")
parser.add_argument('--alg', choices=['alt', 'con', 'sim', 'zx', 'all'], default='all')
parser.add_argument('--workers', type=int, default=1, help="Number of parallel processes.")


def set_algorithms(args):
    """
    Return tuple of Bools (run_alt, run_con, run_sim, run_zx)
    """
    return (args.alg in ('alt', 'all'),
            args.alg in ('con', 'all'),
            args.alg in ('sim', 'all'),
            args.alg in ('zx',  'all'))


def equivalence_check(args):
    """
    Run circuit equivalence checking using MQT QCEC on given circuits.
    """
    run_alt, run_con, run_sim, run_zx = set_algorithms(args)
    res = qcec.verify(args.qasmfile1, args.qasmfile2,
                      run_alternating_checker=run_alt,
                      run_construction_checker=run_con,
                      run_simulation_checker=run_sim,
                      run_zx_checker=run_zx,
                      nthreads=args.workers)

    # write stats as JSON
    stats = {}
    stats['circuit_U'] = os.path.basename(args.qasmfile1)[:-5]
    stats['circuit_V'] = os.path.basename(args.qasmfile2)[:-5]
    stats['equivalent'] = str(res.equivalence)
    stats['wall_time'] = res.check_time
    stats['workers'] = res.configuration.execution.nthreads
    json_data = {'statistics' : stats}
    print(json.dumps(json_data, indent=2))


def main():
    """
    Parse arguments and run.
    """
    args = parser.parse_args()
    equivalence_check(args)


if __name__ == '__main__':
    main()
