"""
Simple wrapper to use Quokka Sharp from command line since all the benchmarks
are run using bash scripts.
"""
import argparse
import quokka_sharp as qk


parser = argparse.ArgumentParser()
parser.add_argument('qasmfile1', help="Path to .qasm file.")
parser.add_argument('qasmfile2', help="Path to .qasm file.")
parser.add_argument('--gpmc_path', default="tools/quokka-sharp/GPMC/bin/gpmc", help="Path to gpmc executable.")


def equivalence_check(args):
    """
    Run circuit equivalence checking using Quokka Sharp on given circuits.
    """
    circuit1 = qk.encoding.QASMparser(args.qasmfile1, True)
    circuit2 = qk.encoding.QASMparser(args.qasmfile2, True)
    circuit2.dagger()
    circuit1.append(circuit2)
    cnf = qk.encoding.QASM2CNF(circuit1)
    res = qk.CheckEquivalence(args.gpmc_path, cnf)


def main():
    """
    Parse arguments and run.
    """
    args = parser.parse_args()
    equivalence_check(args)


if __name__ == '__main__':
    main()
