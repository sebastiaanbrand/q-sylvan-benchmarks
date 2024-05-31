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
        parts = re.split('_|.log', log_filename)
        stats['benchmark'] = '_'.join(parts[:parts.index('qsylvan')])
        stats['workers'] = int(parts[parts.index('qsylvan')+1])
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
    rows = []
    json_dir = os.path.join(exp_dir, 'json')
    for filename in sorted(os.listdir(json_dir)):
        filepath = os.path.join(json_dir, filename)
        if filename.endswith('.json') and os.path.getsize(filepath) > 0:
            with open(filepath, 'r') as f:
                data = json.load(f)
                row = data['statistics']
                if (filename.endswith('mqt.json')):
                    row['tool'] = 'mqt'
                    row['workers'] = 1
                else:
                    row['tool'] = 'q-sylvan'
                row['status'] = 'FINISHED'
                rows.append(row)

    df = pd.DataFrame(rows)
    return df[['benchmark', 'n_qubits', 'tool', 'status', 'simulation_time', 
               'workers', 'wgt_inv_caching', 'max_nodes', 'norm']]        


def load_logs(exp_dir : str, df : pd.DataFrame):
    """
    Add information from logs to dataframe.
    """
    new_rows = []
    log_dir = os.path.join(exp_dir, 'json') # output logs to separate dir?
    for filename in sorted(os.listdir(log_dir)):
        filepath = os.path.join(log_dir, filename)
        if filename.endswith('.log') and os.path.getsize(filepath) > 0:
            row = _get_log_info(filepath, filename)
            if row['status'] == 'TODO':
                continue
            elif row['status'] == 'FINISHED':
                assert row['benchmark'] in df['benchmark'].values
            else:
                new_rows.append(row)
    df = pd.concat([df, pd.DataFrame(new_rows)], ignore_index=True)
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


def plot_scatter(datas_x, datas_y, datas_labels, 
                 plot_diagonal, x_scale, y_scale,
                 colors, legend_labels, 
                 label_x, label_y, outputname, args):
    """
    Produce scatter plot.

    datas_x, datas_y, datas_labels should all have shape (i, j), where the first
    index is used to give different datapoints different colors.
    colors should have length i
    legend_labels should have length i or be None
    """
    assert len(datas_x) == len(datas_y)
    assert len(datas_x) == len(datas_labels)
    assert len(datas_x) <= len(colors)

    fig, ax = plt.subplots()

    # plot the x and y data
    max_val = 0
    for data_x, data_y, col in zip(datas_x, datas_y, colors):
        max_val = max(max_val, np.amax([data_x, data_y]))
        fc_cols = np.array([col for _ in range(len(data_x))])
        fc_cols[data_x == timeout_time] = 'none'
        fc_cols[data_y == timeout_time] = 'none'
        ax.scatter(data_x, data_y, facecolors=fc_cols, edgecolors=col)

    # axis labels, legend, etc.
    ax.set_xlabel(label_x)
    ax.set_ylabel(label_y)
    ax.set_xscale(x_scale)
    ax.set_yscale(y_scale)
    if legend_labels is not None:
        ax.legend(legend_labels)
    
    # plot diagonal line
    if plot_diagonal:
        ax = _plot_diagonal_lines(ax, 0, max_val, at=[])
    
    # save figure
    outputpath = os.path.join(plots_dir(args), outputname)
    for _format in formats:
        fig.savefig(f"{outputpath}.{_format}")
    
    # save version of the figure with labeled data points
    for data_x, data_y, data_labels in zip(datas_x, datas_y, datas_labels):
        for i, bench_name in enumerate(data_labels):
            ax.annotate(bench_name, (data_x[i], data_y[i]), fontsize=1.0, rotation=60)
    fig.savefig(f"{outputpath}_annotated.pdf")
    fig.clf()


def plot_tool_comparison(df : pd.DataFrame, args):
    """
    Plot Q-Sylvan (single worker) vs MQT-DDSIM.
    """
    left  = df.loc[df['tool'] == 'mqt']
    right = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]
    if left.empty:
        print("No MQT data, skipping plot")
        return

    joined = pd.merge(left, right, on='benchmark', how='outer', suffixes=('_l','_r'))

    data_l = joined['simulation_time_l'].fillna(timeout_time)
    data_r = joined['simulation_time_r'].fillna(timeout_time)
    data_labels = [f"{n} ({s})" for n, s in zip(joined['benchmark'],joined['status_r'])]

    plot_scatter([data_l], [data_r], [data_labels],
                 True, 'linear', 'linear',
                 ['royalblue'], None,
                 'MQT-DDSIM time (s)', 'Q-Sylvan (1 worker) time (s)',
                 'mqt_vs_qsylvan', args)


def plot_inv_cache_comparison(df : pd.DataFrame, args):
    """
    Plot nodecounts of inverse cache ON vs OFF.
    """
    # TODO: include non-terminated benchmarks
    # (maybe have experiment generation write JSON files with settings)
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    left  = df.loc[df['wgt_inv_caching'] == 0]
    right = df.loc[df['wgt_inv_caching'] == 1]
    if left.empty or right.empty:
        print("No inv caching data, skipping plot")
        return

    joined = pd.merge(left, right, on='benchmark', how='inner', suffixes=('_l', '_r'))

    data_l = joined['max_nodes_l']
    data_r = joined['max_nodes_r']
    data_labels = joined['benchmark']

    plot_scatter([data_l], [data_r], [data_labels],
                 True, 'linear', 'linear',
                 ['royalblue'], None,
                 'Max nodecount inverse cache OFF', 'Max nodecount inverse cache ON',
                 'inv_caching_nodecount', args)


def plot_dd_size_vs_qubits(df : pd.DataFrame, args):
    """
    Plot (log) DD-size vs the number of qubits.
    """
    df = df.loc[df['status'] == 'FINISHED']

    mqt      = df.loc[df['tool'] == 'mqt']
    qsylvan  = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]
    mqt      = mqt.reset_index()
    qsylvan  = qsylvan.reset_index()

    datas_x = []
    datas_y = []
    datas_labels = []
    for tool in [qsylvan, mqt]:
        if tool.empty:
            continue
        datas_x.append(tool['n_qubits'])
        datas_y.append(tool['max_nodes'])
        datas_labels.append(tool['benchmark'])
    
    legend_labels = ['q-sylvan', 'mqt']
    plot_scatter(datas_x, datas_y, datas_labels, 
                 False, 'linear', 'log',
                 ['royalblue', 'darkorange'], legend_labels,
                 '# qubits', 'max nodes', 'qubits_vs_nodes', args)


def plot_relative_speedups(df : pd.DataFrame, args):
    """
    For each benchmark, plot multicore time / 1 core time.
    """
    # Get only q-sylvan data
    data = df.loc[(df['tool'] == 'q-sylvan')]

    # Get unique numbers of workers
    workers = sorted(data['workers'].unique())
    assert workers[0] == 1
    if len(workers) == 1:
        print("No concurrent data, skipping plot")
        return

    # Get single worker data
    data_1 = data.loc[data['workers'] == 1]

    # For each other number of workers, match with single worker
    datas_x = []
    datas_y = []
    datas_labels = []
    for w in workers:
        data_w = data.loc[data['workers'] == w]
        joined = pd.merge(data_1, data_w, on='benchmark', how='outer', suffixes=('_1','_w'))
        joined[['status_1','status_w']] = joined[['status_1', 'status_w']].fillna('TIMEOUT')

        datas_x.append(joined['simulation_time_1'].fillna(timeout_time))
        datas_y.append(joined['simulation_time_w'].fillna(timeout_time))
        datas_labels.append([f"{n} ({s1},{sw})" for n, s1, sw in\
                       zip(joined['benchmark'], joined['status_1'], joined['status_w'])])
    # Pass to plot scatter
    colors = ['grey', 'royalblue', 'darkorange', 'forestgreen', 'orchid'] # add more if needed
    legend_labels = [f"1v{int(w)} workers" for w in workers]
    plot_scatter(datas_x, datas_y, datas_labels,
                 True, 'linear', 'linear',
                 colors[:len(workers)], legend_labels,
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
    plot_dd_size_vs_qubits(df, args)
    plot_relative_speedups(df, args)
    plot_inv_cache_comparison(df, args)


if __name__ == '__main__':
    main()
