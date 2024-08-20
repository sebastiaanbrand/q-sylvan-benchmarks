"""
Simple wrapper to use MQT QCEC from command line since all benchmarks are run
using bash scripts.
"""
import os
import time
import json
import argparse
from mqt import qcec


parser = argparse.ArgumentParser()
parser.add_argument('qasmfile1', help="Path to .qasm file.")
parser.add_argument('qasmfile2', help="Path to .qasm file.")
parser.add_argument('--timeout', type=int, default=600, help="Timeout (in seconds).")
parser.add_argument('--workers', type=int, default=1, help="Number of parallel processes.")


def equivalence_check(args):
    """
    Run circuit equivalence checking using MQT QCEC on given circuits.
    """
    res = qcec.verify(args.qasmfile1, args.qasmfile2, timeout=args.timeout,
                                                      nthreads=args.workers)

    # write stats as JSON
    stats = {}
    stats['circuit_U'] = os.path.basename(args.qasmfile1)[:-5]
    stats['circuit_V'] = os.path.basename(args.qasmfile2)[:-5]
    stats['equivalent'] = 1 if res == "equivalent" else 0
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
