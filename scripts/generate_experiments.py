import os
import sys
from datetime import datetime

output_file = "experiments/bench_{}.sh"
csv_output  = "experiments/bench_{}_res.csv"

run_grov = "timeout {} ./q-sylvan/build/examples/alg_run grover --qubits={} --norm-strat={} --it-ref={} --tol={} --workers={} --csv-output={}\n"
run_shor = "timeout {} ./q-sylvan/build/examples/alg_run shor --shor-N={} --norm-strat={} --it-ref={} --tol={} --workers={} --rseed={} --csv-output={}\n"
run_sup  = "timeout {} ./q-sylvan/build/examples/alg_run supremacy --qubits={} --depth={} --norm-strat={} --it-ref={} --tol={} --workers={} --rseed={} --csv-output={}\n"
run_qasm = "timeout {} ./q-sylvan/build/qasm/qsylvan_qasm {} --norm-strat={} --it-ref={} --workers={} --seed={} --csv-output={}\n"

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


def experiments_qasm():
    
    # configs to test
    timeout = '10m'
    norm_stat = ['largest']
    it_ref = [0,1]
    workers = [1,2,4,8]
    rseed = 42
    max_num = 50
    num = 0

    with open(output_file, 'a') as f:
        qasm_folder = 'qasm/circuits/MQTBench/'
        f.write("# MQTBench\n")
        for filename in os.listdir(qasm_folder):
            filepath = qasm_folder + filename
            if (num >= max_num):
                break
            for ns in norm_stat:
                for ir in it_ref:
                    for w in workers:    
                        f.write(run_qasm.format(timeout, filepath, ns, ir, w, rseed, csv_output))
            num += 1
        f.write("\n")


if __name__ == '__main__':
    init_output_file()

    if (len(sys.argv) >= 2 and sys.argv[1] == 'qasm'):
        experiments_qasm()
    elif (len(sys.argv) >= 2 and sys.argv[1] == 'grover'):
        experiments_grover()
    elif (len(sys.argv) >= 2 and sys.argv[1] == 'shor'):
        experiments_shor()
    elif (len(sys.argv) >= 2 and sys.argv[1] == 'supremacy'):
        experiments_supremacy()
    else:
        experiments_grover()
        experiments_shor()
        experiments_supremacy()

