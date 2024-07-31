"""
Simple wrapper to use Quokka Sharp from command line since all the benchmarks
are run using bash scripts.
"""
import os
import time
import json
import argparse
import quokka_sharp.quokka_sharp as qk


parser = argparse.ArgumentParser()
parser.add_argument('qasmfile1', help="Path to .qasm file.")
parser.add_argument('qasmfile2', help="Path to .qasm file.")
parser.add_argument('--gpmc_path', default="todo", help="Path to gpmc executable.")
parser.add_argument('--workers', type=int, default=16, help="Number of parallel processes.")


def equivalence_check(args):
    """
    Run circuit equivalence checking using Quokka Sharp on given circuits.
    """
    circuit1 = qk.encoding.QASMparser(args.qasmfile1, True)
    circuit2 = qk.encoding.QASMparser(args.qasmfile2, True)

    t_start = time.time()
    circuit2.dagger()
    circuit1.append(circuit2)
    cnf = qk.encoding.QASM2CNF(circuit1)
    res = qk.CheckEquivalence(args.gpmc_path + " -mode=1", cnf, N=args.workers)
    t_end = time.time()

    # write stats as JSON
    stats = {}
    stats['circuit_U'] = os.path.basename(args.qasmfile1)[:-5]
    stats['circuit_V'] = os.path.basename(args.qasmfile2)[:-5]
    stats['equivalent'] = 1 if res else 0
    stats['wall_time'] = t_end - t_start
    stats['workers'] = args.workers
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
