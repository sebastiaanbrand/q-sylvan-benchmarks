import sys
from typing import Iterable
import pandas as pd
import matplotlib.pyplot as plt


def parse_arguments():
    """
    Parse cl args and put them into global args : str -> value
    """
    global args
    args = {}
    if len(sys.argv) < 2:
        print("no input_file (.csv) given")
        exit(1)
    else:
        args['input_file'] = sys.argv[1]
    return args


def load_data(input_file : str):
    """
    Load the data (and do some preprocessing)
    """
    print(f"loading data from {input_file}")
    df = pd.read_csv(input_file)
    df = df.rename(columns=lambda x: x.strip())

    return df


def plot_speedups(df : pd.DataFrame, alg_selection : Iterable, output_file : str,
                  norm_strat : int = 1, inv_cache : int = 1):
    """
    Plot cores vs speedup for different algs
    """
    df = df.loc[df['norm-strat'] == norm_strat]
    df = df.loc[df['inv-cache'] == inv_cache]

    fig, ax = plt.subplots()

    for algorithm, nqubits, color in alg_selection:
        data = df
        data = data.loc[data['algorithm'] == algorithm]
        data = data.loc[data['nqubits'] == nqubits]

        # single worker runtime
        w1_runtime = data.loc[data['workers'] == 1]['runtime']
        if (len(w1_runtime) > 1):
            print(f"no unique single worker runtime for {algorithm}-{nqubits}")
            exit(1)
        elif (len(w1_runtime) < 1):
            print(f"no single worker runtime for {algorithm}-{nqubits}")
            exit(1)
        w1_runtime = float(w1_runtime)

        xs = data['workers']
        ys = w1_runtime / data['runtime']
        ax.plot(xs, ys, label=f"{algorithm}-{nqubits}", color=color)
    
    # styling
    ax.plot([1,8], [1,1], linestyle='dashed', color='gray')
    ax.set_xlabel('cores')
    ax.set_ylabel('speedup')
    ax.set_xticks(df['workers'].unique())
    ax.legend()
    
    # save figure
    fig.savefig(output_file)
    fig.clf()



def plot_speedups_selection(df : pd.DataFrame):

    # plot some selection on grover
    alg_selection = [['grover', 10, 'tab:green'], 
                     ['grover', 20, 'tab:green'],
                     ['grover', 30, 'tab:green'],
                     ['shor', 11, 'tab:orange'],
                     ['shor', 13, 'tab:orange'],
                     ['shor', 15, 'tab:orange'],
                     ['supremacy-depth10', 20, 'tab:blue']]
    output_file = args['input_file'][:-8] + "_speedups.png"
    plot_speedups(df, alg_selection, output_file, inv_cache=0)


if __name__ == '__main__':
    args = parse_arguments()
    df = load_data(args['input_file'])
    plot_speedups_selection(df)
