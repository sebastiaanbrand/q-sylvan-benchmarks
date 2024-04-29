import os
import re
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
parser.add_argument('dir', help="Experiments directory (the one which is a date+time).")
parser.add_argument('--compare_vecs', action='store_true', default=False, help="Sanity check by comparing full state vectors (if present).")

def plots_dir(args):
    """
    Directory in which to put the plots.
    """
    return os.path.join(args.dir, 'plots')


def _get_termination_status(log_filepath : str):
    """
    Get the termination status of benchmark based on log.
    """
    with open(log_filepath) as f:
        text = f.read()
        if 'qsylvan' in log_filepath:
            if "Amplitude table full" in text:
                return 'WEIGHT_TABLE_FULL'
            elif "Unique table full" in text:
                return 'NODE_TABLE_FULL'
            elif "statistics" in text:
                return 'FINISHED'
            elif "timeout" in text:
                return 'TIMEOUT'
            else:
                return 'TODO'
        else:
            return 'TODO'


def _get_log_info(log_filepath : str, log_filename : str):
    """
    Get info from the log file.
    """
    stats = {}
    if 'qsylvan' in log_filename:
        stats['tool'] = 'q-sylvan'
        info = re.split('_qsylvan_|.log', log_filename)
        stats['benchmark'] = info[0]
        stats['workers'] = int(info[1])
    elif 'mqt' in log_filename:
        stats['tool'] = 'mqt'
        stats['benchmark'] = log_filename.split('_mqt')[0]
    stats['status'] = _get_termination_status(log_filepath)
    return stats


def load_json(exp_dir : str):
    """
    Load the data (and do some preprocessing).
    """
    df = pd.DataFrame()
    json_dir = os.path.join(exp_dir, 'json')
    for filename in sorted(os.listdir(json_dir)):
        filepath = os.path.join(json_dir, filename)
        if filename.endswith('.json') and os.path.getsize(filepath) > 0:
            with open(filepath, 'r') as f:
                data = json.load(f)
                stats = data['statistics']
                if (filename.endswith('mqt.json')):
                    stats['tool'] = 'mqt'
                else:
                    stats['tool'] = 'q-sylvan'
                stats['status'] = 'FINISHED'
                entry = pd.DataFrame(stats, index=[0])
                df = pd.concat([df, entry])

    return df[['benchmark', 'tool', 'status', 'simulation_time', 'workers', 'max_nodes', 'norm']]        


def load_logs(exp_dir : str, df : pd.DataFrame):
    """
    Add information from logs to dataframe.
    """
    log_dir = os.path.join(exp_dir, 'json') # output logs to separate dir?
    for filename in sorted(os.listdir(log_dir)):
        filepath = os.path.join(log_dir, filename)
        if filename.endswith('.log') and os.path.getsize(filepath) > 0:
            stats = _get_log_info(filepath, filename)
            if stats['status'] == 'TODO':
                continue
            elif stats['status'] == 'FINISHED':
                assert stats['benchmark'] in df['benchmark'].values
            else:
                entry = pd.DataFrame(stats, index=[0])
                df = pd.concat([df, entry])
    return df


def load_data(exp_dir : str):
    """
    Load the data (and do some preprocessing).
    """
    print(f"Loading data from {exp_dir}")
    df = load_json(exp_dir)
    df = load_logs(exp_dir, df)
    return df


def compare_vectors(exp_dir : str):
    """
    Compare state vectors in json files if present.
    """
    print("Comparing state vectors between both tools")
    json_dir = os.path.join(exp_dir, 'json')
    for filename in sorted(os.listdir(json_dir)):
        filepath = os.path.join(json_dir, filename)
        if filename.endswith('qsylvan_1.json') and os.path.getsize(filepath) > 0:
            vec_qsy = None
            vec_mqt = None
            with open(filepath, 'r') as f:
                data = json.load(f)
                if 'state_vector' in data:
                    vec_qsy = np.apply_along_axis(lambda args: [complex(*args)], 1, data['state_vector'])
                else:
                    print(f"No state vector in {filepath}, skipping")
                    continue
            mqt_file = filepath.replace('qsylvan_1', 'mqt')
            try:
                with open(mqt_file, 'r') as f:
                    data = json.load(f)
                    if 'state_vector' in data:
                        vec_mqt = np.apply_along_axis(lambda args: [complex(*args)], 1, data['state_vector'])
            except:
                print(f"Could not get json data from {mqt_file}, skipping")
            if not vec_qsy is None and not vec_mqt is None:
                # normalize global phase
                in_prod = np.dot(vec_qsy.conj().T, vec_mqt)[0,0]
                fidelity = (abs(in_prod))**2
                if abs(in_prod - 1.0) > 1e-3:
                    if fidelity < 0.999:
                        print(f"Warning: fidelity = {np.round(fidelity,4)} for {filename[:-15]}")
                    #else:
                    #    print(f"Note: different global phase for {filename[:-15]}")


def sanity_check(df : pd.DataFrame):
    """
    Do some basic sanity checks on the collected data.
    """
    issues = df.loc[(df['norm'] != 1.0) &
                    (df['tool'] == 'q-sylvan') &
                    (df['status'] == 'FINISHED')]
    if len(issues) > 0:
        print("Instances with issues:")
        print(issues)


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


def plot_scatter(data_x_3d, data_y_3d, data_labels_3d,
                 colors, markers,
                 legend_labels, label_x, label_y,
                 outputname, args):
    """
    Produce scatter plot.

    - datas_x, datas_y, statuses, and data datas_labels should all
    have shape (i, j, k), where
        - the first index is used gives different markers.
        - the second index is used to gives different colors.
    - colors should be a 1d list of length j
    - markers should be a 1d list of length i
    - legend_labels should be a 1d list or be None
    """
    #assert len(datas_x) == len(datas_y)
    #assert len(datas_x) == len(datas_labels)
    #assert len(datas_x) == len(colors)

    fig, ax = plt.subplots()

    # plot the x and y data
    for data_x_2d, data_y_2d, marker in zip(data_x_3d, data_y_3d, markers):
        # TODO: base the shape of the points on the status
        for data_x, data_y, col in zip(data_x_2d, data_y_2d, colors):
            fc_cols = np.array([col for _ in range(len(data_x))])
            fc_cols[data_x == timeout_time] = 'none'
            fc_cols[data_y == timeout_time] = 'none'
            ax.scatter(data_x, data_y, marker=marker, facecolors=fc_cols, edgecolors=col)

    # axis labels, legend, etc.
    ax.set_xlabel(label_x)
    ax.set_ylabel(label_y)
    if legend_labels is not None:
        ax.legend(legend_labels)
    
    # plot diagonal line
    ax = _plot_diagonal_lines(ax, 0, timeout_time, at=[])
    
    # save figure
    outputpath = os.path.join(plots_dir(args), outputname)
    for _format in formats:
        fig.savefig(f"{outputpath}.{_format}")
    
    # save version of the figure with labeled data points
    for data_x_2d, data_y_2d, data_labels_2d in zip(data_x_3d, data_y_3d, data_labels_3d):
        for data_x, data_y, data_labels in zip(data_x_2d, data_y_2d, data_labels_2d):
            for i, bench_name in data_labels.items():
                ax.annotate(bench_name, (data_x[i], data_y[i]), fontsize=1.0, rotation=60)
    fig.savefig(f"{outputpath}_annotated.pdf")
    fig.clf()


def plot_tool_comparison(df : pd.DataFrame, args):
    """
    Plot Q-Sylvan (single worker) vs MQT-DDSIM
    """
    left = df.loc[df['tool'] == 'mqt']
    right = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    joined = pd.merge(left, right, on='benchmark', how='outer', suffixes=('_l','_r'))

    # group by q-sylvan termination status
    finished = joined.loc[(joined['status_r'] == 'FINISHED') | 
                          (joined['status_r'] == 'TIMEOUT')]
    tab_full = joined.loc[(joined['status_r'] == 'WEIGHT_TABLE_FULL') | 
                          (joined['status_r'] == 'NODE_TABLE_FULL')] # TODO: separate?
    data_l = []
    data_r = []
    data_labels = []
    for group in [finished, tab_full]:
        data_l.append([group['simulation_time_l'].fillna(timeout_time)])
        data_r.append([group['simulation_time_r'].fillna(timeout_time)])
        data_labels.append([group['benchmark']])

    plot_scatter(data_l, data_r, data_labels,
                 ['royalblue'], ['o', 's'], None,
                 'MQT-DDSIM time', 'Q-Sylvan (1 worker) time (s)',
                 'mqt_vs_qsylvan', args)


def plot_relative_speedups(df : pd.DataFrame, args):
    """
    For each benchmark, plot multicore time / 1 core time.
    """
    # Get only q-sylvan data
    data = df.loc[(df['tool'] == 'q-sylvan')]

    # Get unique numbers of workers
    workers = sorted(data['workers'].unique())
    assert workers[0] == 1

    # Get single worker data
    data_1 = data.loc[data['workers'] == 1]

    # For each other number of workers, match with single worker
    data_x = []
    data_y = []
    data_labels = []
    for w in workers:
        data_w = data.loc[data['workers'] == w]
        joined = pd.merge(data_1, data_w, on='benchmark', how='outer', suffixes=('_1','_w'))

        print(joined)
        exit()

        data_x.append(joined['simulation_time_1'].fillna(timeout_time))
        data_y.append(joined['simulation_time_w'].fillna(timeout_time))
        data_labels.append(joined['benchmark'])

    # Pass to plot scatter
    colors = ['grey', 'royalblue', 'darkorange', 'forestgreen', 'orchid'] # add more if needed
    legend_labels = [f"w = {int(w)} workers" for w in workers]
    plot_scatter([data_x], [data_y], [data_labels],
                 colors[:len(workers)], ['o'], legend_labels,
                 '1 worker time (s)', 'w workers time (s)',
                 'multicore_scatter', args)


def main():
    args = parser.parse_args()
    df = load_data(args.dir)

    sanity_check(df)
    if args.compare_vecs:
        compare_vectors(args.dir)
    
    Path(plots_dir(args)).mkdir(parents=True, exist_ok=True)
    print(f"Writing plots to {plots_dir(args)}")
    plot_tool_comparison(df, args)
    plot_relative_speedups(df, args)


if __name__ == '__main__':
    main()
