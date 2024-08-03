"""
Code for generating plots from experiments.
"""
import os
import itertools
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


TIMEOUT_TIME = 600 # replaces NaN from timeout with this time in the plots
FORMATS = ['png', 'pdf']
COLORS = ['royalblue', 'darkorange', 'forestgreen', 'crimson']


def plots_dir(args):
    """
    Directory in which to put the plots.
    """
    return os.path.join(args.dir, 'plots')

def mkdir_plots(args):
    """
    Create plots subdirs if not exists.
    """
    Path(plots_dir(args)).mkdir(parents=True, exist_ok=True)
    for sub in (FORMATS + ['annotated']):
        subdir = os.path.join(plots_dir(args), sub)
        Path(subdir).mkdir(parents=True, exist_ok=True)

def tables_dir(args):
    """
    Directory in which to put the LaTeX tables.
    """
    return os.path.join(args.dir, 'tables')


def _plot_diagonal_lines(ax, min_val, max_val, at):
    """
    Adds a diagonal line x = y. Additionally, if e.g. at = [0.1, 10] plots
    diagonal lines at y = 0.1x and y = 10.
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
                 diagonals, x_scale, y_scale,
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
        fc_cols[data_x == TIMEOUT_TIME] = 'none'
        fc_cols[data_y == TIMEOUT_TIME] = 'none'
        ax.scatter(data_x, data_y, facecolors=fc_cols, edgecolors=col)

    # axis labels, legend, etc.
    ax.set_xlabel(label_x)
    ax.set_ylabel(label_y)
    ax.set_xscale(x_scale)
    ax.set_yscale(y_scale)
    if legend_labels is not None:
        ax.legend(legend_labels)

    # plot diagonal line
    if diagonals is not None:
        ax = _plot_diagonal_lines(ax, 0, max_val, at=diagonals)

    # save figure
    for _format in FORMATS:
        outputpath = os.path.join(plots_dir(args), _format, outputname)
        fig.savefig(f"{outputpath}.{_format}")

    # save version of the figure with labeled data points
    for data_x, data_y, data_labels in zip(datas_x, datas_y, datas_labels):
        for i, bench_name in enumerate(data_labels):
            ax.annotate(bench_name, (data_x[i], data_y[i]), fontsize=1.0, rotation=60)
    outputpath = os.path.join(plots_dir(args), 'annotated', outputname)
    fig.savefig(f"{outputpath}_annotated.pdf")
    fig.clf()


def plot_tool_comparison(df : pd.DataFrame, fid_df : pd.DataFrame, args):
    """
    Plot Q-Sylvan (single worker) vs MQT-DDSIM.
    """
    left  = df.loc[df['tool'] == 'mqt']
    right = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]
    if left.empty:
        print("No MQT data, skipping plot")
        return

    joined = pd.merge(left, right, on='circuit', how='outer', suffixes=('_l','_r'))

    if fid_df is None:
        data_l = joined['simulation_time_l'].fillna(TIMEOUT_TIME)
        data_r = joined['simulation_time_r'].fillna(TIMEOUT_TIME)
        data_labels = [f"{n} ({s})" for n, s in zip(joined['circuit'],joined['status_r'])]

        plot_scatter([data_l], [data_r], [data_labels],
                    [], 'linear', 'linear',
                    ['royalblue'], None,
                    'MQT-DDSIM time (s)', 'Q-Sylvan (1 worker) time (s)',
                    'mqt_vs_qsylvan', args)
    else:
        joined = pd.merge(joined, fid_df, on='circuit', how='left')
        joined['fidelity'] = joined['fidelity'].fillna(-1)
        fid_1    = joined.loc[(joined['fidelity'] > .999) & (joined['fidelity'] < 1.001)]
        fid_not1 = joined.loc[((joined['fidelity'] < .999) | (joined['fidelity'] > 1.001))
                                                          & (joined['fidelity'] >= 0.0)]
        fid_na   = joined.loc[(joined['fidelity'] < 0.0)]

        datas_l = []
        datas_r = []
        datas_labels = []
        leg_names = []
        for fid, leg_name in zip([fid_1, fid_not1, fid_na],
                                 ['fidelity $=$ 1', 'fidelity $\\neq$ 1', 'fidelity N/A']):
            if len(fid) == 0:
                continue
            fid = fid.reset_index()
            datas_l.append(fid['simulation_time_l'].fillna(TIMEOUT_TIME))
            datas_r.append(fid['simulation_time_r'].fillna(TIMEOUT_TIME))
            datas_labels.append(fid['circuit'])
            leg_names.append(leg_name)

        plot_scatter(datas_l, datas_r, datas_labels,
                    [], 'linear', 'linear',
                    ['royalblue', 'darkorange', 'orchid'],
                    leg_names,
                    'MQT-DDSIM time (s)', 'Q-Sylvan (1 worker) time (s)',
                    'mqt_vs_qsylvan_fid', args)


def plot_inv_cache_comparison(df : pd.DataFrame, args):
    """
    Plot nodecounts of inverse cache ON vs OFF.
    """
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    left  = df.loc[df['wgt_inv_caching'] == 0]
    right = df.loc[df['wgt_inv_caching'] == 1]
    if left.empty or right.empty:
        print("No inv caching data, skipping plot")
        return

    joined = pd.merge(left, right, on='circuit', how='inner', suffixes=('_l', '_r'))

    # plot max nodes
    data_l = joined['max_nodes_l']
    data_r = joined['max_nodes_r']
    data_labels = joined['circuit']
    plot_scatter([data_l], [data_r], [data_labels],
                 [], 'linear', 'linear',
                 ['royalblue'], None,
                 'max nodes inverse cache OFF', 'max nodes inverse cache ON',
                 'inv_caching_nodecount', args)

    # plot runtime
    data_l = joined['simulation_time_l']
    data_r = joined['simulation_time_r']
    data_labels = joined['circuit']
    plot_scatter([data_l], [data_r], [data_labels],
                 [], 'linear', 'linear',
                 ['royalblue'], None,
                 'runtime (s) inverse cache OFF', 'runtime (s) inverse cache ON',
                 'inv_caching_runtime', args)


def plot_norm_strat_comparison(df : pd.DataFrame, args, ns_names):
    """
    Plot max nodes for different norm strats.
    """
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    norm_strats = sorted(df['wgt_norm_strat'].unique())
    norm_strats = [int(s) for s in norm_strats if not np.isnan(s)]
    if len(norm_strats) == 1:
        print("No norm strat data, skipping plot")
        return

    for s1, s2 in itertools.combinations(norm_strats, 2):
        left  = df.loc[df['wgt_norm_strat'] == s1]
        right = df.loc[df['wgt_norm_strat'] == s2]

        joined = pd.merge(left, right, on='circuit', how='inner', suffixes=('_l', '_r'))

        # split into groups depending on if norm is 1
        joined_ok2 = joined.loc[(joined['norm_l'] == 1) & (joined['norm_r'] == 1)]
        joined_okl = joined.loc[(joined['norm_l'] == 1) & (joined['norm_r'] != 1)]
        joined_okr = joined.loc[(joined['norm_l'] != 1) & (joined['norm_r'] == 1)]
        joined_ok0 = joined.loc[(joined['norm_l'] != 1) & (joined['norm_r'] != 1)]
        norm_split = [joined_ok2, joined_okl, joined_okr, joined_ok0]
        norm_split_names = ['norm $=$ 1 (both)', f'norm $\\neq$ 1 ({ns_names[s2]})',
                            f'norm $\\neq$ 1 ({ns_names[s1]})', 'norm $\\neq$ 1 (both)']

        # plot max nodes (separate for each norm subset)
        datas_l = []
        datas_r = []
        datas_labels = []
        legend_names = []
        for subset, name in zip(norm_split, norm_split_names):
            if len(subset) > 0:
                subset = subset.reset_index()
                datas_l.append(subset['max_nodes_l'])
                datas_r.append(subset['max_nodes_r'])
                datas_labels.append(subset['circuit'])
                legend_names.append(name)
        plot_scatter(datas_l, datas_r, datas_labels,
                     [], 'linear', 'linear',
                     COLORS, legend_names,
                     f'max nodes norm strat {ns_names[s1]}',
                     f'max nodes norm strat {ns_names[s2]}',
                     f'norm_strat_nodecount_{ns_names[s1]}_vs_{ns_names[s2]}', args)

        # plot runtime (separate for each norm subset)
        # (labels and legend can be is already sset in previous loop)
        datas_l = []
        datas_r = []
        for subset, name in zip(norm_split, norm_split_names):
            if len(subset) > 0:
                subset = subset.reset_index()
                datas_l.append(subset['simulation_time_l'])
                datas_r.append(subset['simulation_time_r'])
        plot_scatter(datas_l, datas_r, datas_labels,
                     [], 'linear', 'linear',
                     COLORS, legend_names,
                     f'runtime (s) norm strat {ns_names[s1]}',
                     f'runtime (s) norm strat {ns_names[s2]}',
                     f'norm_strat_runtime_{ns_names[s1]}_vs_{ns_names[s2]}', args)


def plot_dd_size_vs_qubits(df : pd.DataFrame, args, ns_names):
    """
    Plot (log) DD-size vs the number of qubits.
    """
    df       = df.loc[df['status'] == 'FINISHED']
    mqt      = df.loc[df['tool'] == 'mqt']
    qsylvan  = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    data_selections = []
    data_selections.append((mqt, 'mqt'))

    # split qsylvan data on hyperparameters
    norm_strats = qsylvan['wgt_norm_strat'].unique()
    for ns in norm_strats:
        subset = qsylvan.loc[qsylvan['wgt_norm_strat'] == ns]
        data_selections.append((subset, f'qsylvan_{ns_names[ns]}'))

    # generate plot for each set of data selection
    for data, name in data_selections:
        if data.empty:
            continue

        # Group circuits by category for visualization
        categories = sorted(data['category'].unique(), key=lambda x:(x!='other', x))
        datas_x = []
        datas_y = []
        datas_labels = []
        for cat in categories:
            cat_data = data.loc[data['category'] == cat].reset_index()
            datas_x.append(cat_data['n_qubits'])
            datas_y.append(cat_data['max_nodes'])
            datas_labels.append(cat_data['circuit'])
        plot_scatter(datas_x, datas_y, datas_labels,
                    None, 'linear', 'log',
                    COLORS, categories,
                    '# qubits', 'max nodes', f'qubits_vs_nodes_{name}', args)


def plot_relative_speedups(df : pd.DataFrame, args):
    """
    For each circuit, plot multicore time / 1 core time.
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
        joined = pd.merge(data_1, data_w, on='circuit', how='outer', suffixes=('_1','_w'))
        joined[['status_1','status_w']] = joined[['status_1', 'status_w']].fillna('TIMEOUT')

        datas_x.append(joined['simulation_time_1'].fillna(TIMEOUT_TIME))
        datas_y.append(joined['simulation_time_w'].fillna(TIMEOUT_TIME))
        datas_labels.append([f"{n} ({s1},{sw})" for n, s1, sw in\
                       zip(joined['circuit'], joined['status_1'], joined['status_w'])])
    # Pass to plot scatter
    colors = ['grey', 'royalblue', 'darkorange', 'forestgreen', 'orchid'] # add more if needed
    legend_labels = [f"1v{int(w)} workers" for w in workers]
    diagonal_lines = [1/x for x in workers[1:]]
    for scaling in ['linear', 'log']:
        plot_scatter(datas_x, datas_y, datas_labels,
                    diagonal_lines, scaling, scaling,
                    colors[:len(workers)], legend_labels,
                    '1 worker time (s)', 'w workers time (s)',
                    f'multicore_scatter_{scaling}', args)


def latex_table_equivalent(df : pd.DataFrame, args):
    """
    Write LaTeX table like Table 4 in https://arxiv.org/pdf/2403.18813.
    """
    # select data
    df = df.loc[(df['type'] == 'opt') & (df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    # style runtime column
    df = df.astype({'wall_time' : str})
    df.loc[:,'wall_time'] = df['wall_time'].apply(lambda x : '{:.2f}'.format(float(x)))
    df.loc[(df['status'] == 'TIMEOUT'), 'wall_time'] = f'> {TIMEOUT_TIME}'
    df.loc[(df['status'] == 'NODE_TABLE_FULL'), 'wall_time'] = '-'
    df.loc[(df['status'] == 'WEIGHT_TABLE_FULL'), 'wall_time'] = '-'

    # styling of table
    df = df.sort_values(['circuit_type', 'n_qubits'])
    df = df[['circuit_type', 'n_qubits', 'n_gates_U', 'n_gates_V', 'wall_time']]
    df = df.rename(columns={'circuit_type' : 'Algorithm', 'n_qubits' : '$n$',
                            'n_gates_U' : '$|G|$', 'n_gates_V' : '$|G\'|$',
                            'wall_time' : 'time (s)'})
    styler = df.style
    styler.hide(axis='index')
    styler.set_table_styles([
        {'selector': 'toprule', 'props': ':hline;'},
        {'selector': 'midrule', 'props': ':hline;'},
        {'selector': 'bottomrule', 'props': ':hline;'},
    ], overwrite=True)

    # write to file
    output_file = os.path.join(tables_dir(args), 'eqcheck_equiv_table.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format='l||rrr||r'))


def latex_table_non_equivalent(df : pd.DataFrame, args):
    """
    Write LaTeX table like Table 5 in https://arxiv.org/pdf/2403.18813.
    """
    # select data
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]
    df = df[['circuit_type', 'circuit_U', 'n_qubits', 'n_gates_U', 'n_gates_V', 'type', 'wall_time', 'status']]
    gm   = df.loc[(df['type'] == 'gm')].drop('type', axis=1)
    flip = df.loc[(df['type'] == 'flip')].drop('type', axis=1)
    df = gm.merge(flip[['circuit_U', 'wall_time', 'status']], 
                     on='circuit_U', how='outer',
                     suffixes=('_gm', '_flip')).drop('circuit_U', axis=1)
    df['n_gates_V'] = df['n_gates_V'] + 1
    
    # style runtime columns
    for suff in ['_gm', '_flip']:
        df = df.astype({f'wall_time{suff}' : str})
        df.loc[:,f'wall_time{suff}'] = df[f'wall_time{suff}'].apply(lambda x : '{:.2f}'.format(float(x)))
        df.loc[(df[f'status{suff}'] == 'TIMEOUT'), f'wall_time{suff}'] = f'> {TIMEOUT_TIME}'
        df.loc[(df[f'status{suff}'] == 'NODE_TABLE_FULL'), f'wall_time{suff}'] = '-'
        df.loc[(df[f'status{suff}'] == 'WEIGHT_TABLE_FULL'), f'wall_time{suff}'] = '-'
    
    # styling of table
    df = df.sort_values(['circuit_type', 'n_qubits'])
    df = df[['circuit_type', 'n_qubits', 'n_gates_U', 'n_gates_V',
             'wall_time_gm', 'wall_time_flip']]
    df = df.rename(columns={'circuit_type' : 'Algorithm', 'n_qubits' : '$n$',
                            'n_gates_U' : '$|G|$', 'n_gates_V' : '$|G\'|$',
                            'wall_time_gm' : '1 gate missing', 
                            'wall_time_flip' : 'flipped'})
    styler = df.style
    styler.hide(axis='index')
    styler.set_table_styles([
        {'selector': 'toprule', 'props': ':hline;'},
        {'selector': 'midrule', 'props': ':hline;'},
        {'selector': 'bottomrule', 'props': ':hline;'},
    ], overwrite=True)
    
    # write to file
    output_file = os.path.join(tables_dir(args), 'eqcheck_nonequiv_table.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format='l||rrr||rr'))
