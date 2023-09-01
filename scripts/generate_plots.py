import os
import sys
import json
import argparse
from typing import Iterable
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

timeout_time = 600 # replaces NaN from timeout with this time in the plots
formats = ['png']


parser = argparse.ArgumentParser()
parser.add_argument('folder')


def plots_folder(args):
    """
    Folder to put the plots.
    """
    return os.path.join(args.folder, 'plots')


def load_data(folder : str):
    """
    Load the data (and do some preprocessing)
    """
    print(f"loading data from {folder}")
    df = pd.DataFrame()
    for filename in sorted(os.listdir(folder)):
        filepath = os.path.join(folder, filename)
        if filename.endswith('.json') and os.path.getsize(filepath) > 0:
            with open(filepath, 'r') as f:
                data = json.load(f)['statistics']

                # TODO: remove after updating json
                if data['benchmark'].endswith('.qasm'):
                    data['benchmark'] = data['benchmark'][:-5]
                # / remove

                if (filename.endswith('mqt.json')):
                    data['tool'] = 'mqt'
                else:
                    data['tool'] = 'q-sylvan'
                new_df = pd.DataFrame(data, index=[0])
                df = pd.concat([df, new_df])

    return df[['benchmark', 'tool', 'simulation_time', 'workers', 'max_nodes']]


def _plot_diagonal_lines(ax, min_val, max_val, at=[0.1, 10]):
    """
    Add diagonal lines to ax
    """
    
    # bit of margin for vizualization
    #ax.set_xlim([min_val-0.15*min_val, max_val+0.15*max_val])
    #ax.set_ylim([min_val-0.15*min_val, max_val+0.15*max_val])

    # diagonal lines
    ax.plot([min_val, max_val], [min_val, max_val], ls="--", c="gray")
    for k in at:
        ax.plot([min_val, max_val], [min_val*k, max_val*k], ls=":", c="#767676")

    return ax


def plot_scatter(data_x, data_y, data_labels, label_x, label_y, filename, args):
    """
    Produce scatter plot of data_x vs data_y
    """
    fig, ax = plt.subplots()

    col = 'royalblue'
    fc_cols = np.array([col for _ in range(len(data_x))])
    fc_cols[data_x == timeout_time] = 'none'
    fc_cols[data_y == timeout_time] = 'none'

    # plot the data + diagonal line
    ax = _plot_diagonal_lines(ax, 0, timeout_time, at=[])
    ax.scatter(data_x, data_y, facecolors=fc_cols, edgecolors=col)

    # axis labels, etc.
    ax.set_xlabel(label_x)
    ax.set_ylabel(label_y)
    
    # save figure
    outputpath = os.path.join(plots_folder(args), 'mqt_vs_qsylvan')
    for _format in formats:
        fig.savefig(f"{outputpath}.{_format}")
    
    # save version of the figure with labeled data points
    for i, bench_name in enumerate(data_labels):
        ax.annotate(bench_name, (data_x[i], data_y[i]), fontsize=1.0, rotation=60)
    fig.savefig(f"{outputpath}_annotated.pdf")
    fig.clf()


def plot_tool_comparison(df : pd.DataFrame, args):
    """
    Plot Q-Sylvan vs MQT-DDSIM
    """
    left = df.loc[df['tool'] == 'mqt']
    right = df.loc[df['tool'] == 'q-sylvan']

    joined = pd.merge(left, right, on='benchmark', how='outer', suffixes=('_l','_r'))
    print(joined)

    data_l = joined['simulation_time_l'].fillna(timeout_time)
    data_r = joined['simulation_time_r'].fillna(timeout_time)
    data_labels = joined['benchmark']

    plot_scatter(data_l, data_r, data_labels, 
                'MQT-DDSIM time', 'Q-Sylvan time (s)',
                'mqt_vs_qsylvan', args)


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
    args = parser.parse_args()
    df = load_data(args.folder)
    
    Path(plots_folder(args)).mkdir(parents=True, exist_ok=True)
    plot_tool_comparison(df, args)
