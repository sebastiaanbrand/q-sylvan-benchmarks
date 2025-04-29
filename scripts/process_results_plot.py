"""
Code for generating plots from experiments.
"""
import os
import json
import itertools
from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import LogLocator


FORMATS = ['png', 'pdf']
COLORS = ['royalblue', 'darkorange', 'forestgreen', 'crimson']
MARKERS = ['^', 'o', 'd', 'o', 'o']
EQTAB_SELECTION = ['graphstate', 'grover-noancilla', 'qaoa', 'qnn', 'qft', 
                   'qpe-inexact', 'vqe', 'wstate']
NEQTAB_SELECTION = ['grover-noancilla', 'qaoa', 'qft', 'qnn', 'qpe-inexact',
                    'vqe', 'wstate']
ORDER = ['q-sylvan-alternating','q-sylvan-pauli','quokka-sharp','mqt-qcec-all']

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


def plot_scatter(args, outputname,
                 datas_x, datas_y, datas_labels,
                 label_x, label_y,
                 colors, legend_labels, diagonals,
                 x_scale='linear', y_scale='linear',
                 cosiness=1, markers=None):
    """
    Produce scatter plot.

    datas_x, datas_y, datas_labels should all have shape (i, j), where the first
    index is used to give different datapoints different colors.
    colors should have length i
    legend_labels should have length i or be None
    """
    markers = MARKERS if markers is None else markers
    assert len(datas_x) == len(datas_y)
    assert len(datas_x) == len(datas_labels)
    assert len(datas_x) <= len(colors)
    assert len(datas_x) <= len(markers)

    #plt.rcParams.update({'font.size': fontsize})
    fig, ax = plt.subplots()

    # plot the x and y data
    max_val = 0
    for data_x, data_y, col, mark in zip(datas_x, datas_y, colors, markers):
        max_val = max(max_val, np.amax([data_x, data_y]))
        fc_cols = np.array([col for _ in range(len(data_x))])
        fc_cols[data_x == args.timeoutt] = 'none'
        fc_cols[data_y == args.timeoutt] = 'none'
        ax.scatter(data_x, data_y, facecolors=fc_cols, edgecolors=col, s=11, marker=mark)

    # axis labels, legend, etc.
    ax.set_xlabel(label_x)
    ax.set_ylabel(label_y)
    ax.set_xscale(x_scale)
    ax.set_yscale(y_scale)
    if legend_labels is not None:
        ax.legend(legend_labels)
    if x_scale == 'log':
        #ax.set_xticks([10**x for x in range(-4, 4)])
        ax.xaxis.set_minor_locator(LogLocator(base=10, subs="auto", numticks=10))
    if y_scale == 'log':
        #ax.set_yticks([10**x for x in range(-4, 4)])
        ax.yaxis.set_minor_locator(LogLocator(base=10, subs="auto", numticks=10))

    # plot diagonal line
    if diagonals is not None:
        ax = _plot_diagonal_lines(ax, 0, max_val, at=diagonals)

    # squeeze/stretch
    w, h = fig.get_size_inches()
    fig.set_size_inches(w = w/cosiness, h = h/cosiness)
    fig.tight_layout()

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


def plot_tool_comparison(df : pd.DataFrame, fid_df : pd.DataFrame, args, w=1, scale='linear'):
    """
    Plot Q-Sylvan ('w' worker) vs MQT-DDSIM.
    """
    left  = df.loc[df['tool'] == 'mqt']
    right = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == w)]
    if left.empty:
        print("No MQT data, skipping plot")
        return

    joined = pd.merge(left, right, on='circuit', how='outer', suffixes=('_l','_r'))

    if fid_df is None:
        data_l = joined['simulation_time_l'].fillna(args.timeoutt)
        data_r = joined['simulation_time_r'].fillna(args.timeoutt)
        data_labels = [f"{n} ({s})" for n, s in zip(joined['circuit'],joined['status_r'])]

        w_label = f'1 worker' if w == 1 else f'{w} workers'
        plot_scatter(args, f'mqt_vs_qsylvan{w}_{scale}',
                    [data_l], [data_r], [data_labels],
                    'MQT-DDSIM time (s)', f'Q-Sylvan ({w_label}) time (s)',
                    ['royalblue'], None, [], markers=['o'],
                    x_scale=scale, y_scale=scale,
                    cosiness=1.6)
        return data_l, data_r, data_labels
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
            datas_l.append(fid['simulation_time_l'].fillna(args.timeoutt))
            datas_r.append(fid['simulation_time_r'].fillna(args.timeoutt))
            datas_labels.append(fid['circuit'])
            leg_names.append(leg_name)

        w_label = f'1 worker' if w == 1 else f'{w} workers'
        plot_scatter(args, f'mqt_vs_qsylvan{w}_{scale}_fid',
                     datas_l, datas_r, datas_labels,
                     'MQT-DDSIM time (s)', f'Q-Sylvan ({w_label}) time (s)',
                     COLORS, leg_names, [], 
                     x_scale=scale, y_scale=scale)


def plot_tool_comparison_workers(df : pd.DataFrame, fid_df : pd.DataFrame, args):
    """
    Plot Q-Sylvan ('w' worker) vs MQT-DDSIM, for all 'w'.
    """
    workers = sorted(df['workers'].unique())
    for scale in ['linear', 'log']:
        datas_l = []
        datas_r = []
        datas_labels = []
        for w in workers:
            data_l, data_r, data_labels = plot_tool_comparison(df, fid_df, args, w, scale)
            datas_l.append(data_l)
            datas_r.append(data_r)
            datas_labels.append(datas_labels)
        plot_scatter(args, f'mqt_vs_qsylvan_{"_".join(str(w) for w in workers)}_{scale}',
                    datas_l, datas_r, datas_labels,
                    'MQT-DDSIM (single core) time (s)', 'Q-Sylvan (multi core) time (s)',
                    COLORS, [f'{w} workers' for w in workers], [],
                    x_scale=scale, y_scale=scale)


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
    plot_scatter(args, 'inv_caching_nodecount',
                 [data_l], [data_r], [data_labels],
                 'max nodes inverse cache OFF', 'max nodes inverse cache ON',
                 ['royalblue'], None, [])

    # plot runtime
    data_l = joined['simulation_time_l']
    data_r = joined['simulation_time_r']
    data_labels = joined['circuit']
    plot_scatter(args, 'inv_caching_runtime',
                 [data_l], [data_r], [data_labels],
                 'runtime (s) inverse cache OFF', 'runtime (s) inverse cache ON',
                 ['royalblue'], None, [])


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
        if len(legend_names) == 1 and legend_names[0] == 'norm $=$ 1 (both)':
            legend_names = None
        plot_scatter(args, f'norm_strat_nodecount_{ns_names[s1]}_vs_{ns_names[s2]}',
                     datas_l, datas_r, datas_labels,
                     f'peak # of nodes norm-{ns_names[s1]}',
                     f'peak # of nodes norm-{ns_names[s2]}',
                     COLORS, legend_names, [],
                     x_scale='log', y_scale='log',
                     cosiness=1.7)

        # plot runtime (separate for each norm subset)
        # (labels and legend can be is already sset in previous loop)
        datas_l = []
        datas_r = []
        for subset, name in zip(norm_split, norm_split_names):
            if len(subset) > 0:
                subset = subset.reset_index()
                datas_l.append(subset['simulation_time_l'])
                datas_r.append(subset['simulation_time_r'])
        plot_scatter(args, f'norm_strat_runtime_{ns_names[s1]}_vs_{ns_names[s2]}',
                     datas_l, datas_r, datas_labels,
                     f'runtime (s) norm-{ns_names[s1]}',
                     f'runtime (s) norm-{ns_names[s2]}',
                     COLORS, legend_names, [],
                     x_scale='linear', y_scale='linear',
                     cosiness=1.7)


def plot_qubit_reorder_comparison(df : pd.DataFrame, args):
    """
    Plot effect of reordering qubits before simulation.
    """
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]

    reorder_strats = sorted(df['reorder'].unique())
    reorder_strats = [int(s) for s in reorder_strats if not np.isnan(s)]
    if len(reorder_strats) == 1:
        print("No reorder data, skipping plot")
        return

    # compare reorder strategies against each other
    for r1, r2 in itertools.combinations(reorder_strats, 2):
        left  = df.loc[df['reorder'] == r1]
        right = df.loc[df['reorder'] == r2]
        joined = pd.merge(left, right, on='circuit', how='outer', suffixes=('_l', '_r'))

        # plot runtime
        data_l = joined['simulation_time_l'].fillna(args.timeoutt)
        data_r = joined['simulation_time_r'].fillna(args.timeoutt)
        data_labels = joined['circuit']
        plot_scatter(args, f'reorder_runtime_{r1}_{r2}',
                     [data_l], [data_r], [data_labels],
                     f'runtime (s) reorder={r1}', f'runtime (s) reorder={r2}',
                     COLORS, None, [])


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
        plot_scatter(args, f'qubits_vs_nodes_{name}',
                     datas_x, datas_y, datas_labels,
                    '# qubits', 'max nodes',
                    COLORS, categories, None,
                    y_scale='log', cosiness=1.5)


def plot_multicore_scatter(df : pd.DataFrame, args, scaling='log'):
    """
    Plot 1 vs [w1, w2, ..] together (colored by workers)
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
    for w in workers[1:]:
        data_w = data.loc[data['workers'] == w]
        joined = pd.merge(data_1, data_w, on='circuit', how='outer', suffixes=('_1','_w'))
        joined[['status_1','status_w']] = joined[['status_1', 'status_w']].fillna('TIMEOUT')

        datas_x.append(joined['simulation_time_1'].fillna(args.timeoutt))
        datas_y.append(joined['simulation_time_w'].fillna(args.timeoutt))
        datas_labels.append([f"{n} ({s1},{sw})" for n, s1, sw in\
                       zip(joined['circuit'], joined['status_1'], joined['status_w'])])
    # Pass to plot scatter
    legend_labels = [f"1v{int(w)} workers" for w in workers[1:]]
    diagonal_lines = [1/x for x in workers[1:]]
    plot_scatter(args, f'multicore{"_".join(str(w) for w in workers[1:])}_scatter_{scaling}',
                    datas_x, datas_y, datas_labels,
                    '1 worker time (s)', 'multi-workers time (s)',
                    COLORS, legend_labels, diagonal_lines,
                    x_scale=scaling, y_scale=scaling,
                    cosiness=1.6)


def plot_multicore_scatter_sharing(df : pd.DataFrame, args, scaling='log'):
    """
    Plot 1 vs w separately (colored by amount of sharing)
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
    summary = {} # also gather produce some summary
    for w in workers[1:]:
        summary[int(w)] = {}
        data_w = data.loc[data['workers'] == w]
        joined = pd.merge(data_1, data_w, on='circuit', how='outer', suffixes=('_1','_w'))
        joined[['status_1','status_w']] = joined[['status_1', 'status_w']].fillna('TIMEOUT')

        # Group circuits by category for visualization
        datas_x = []
        datas_y = []
        datas_labels = []
        categories = sorted(data['category'].unique())
        if categories[-1].endswith('unknown'):
            categories = categories[:-1]
        for cat in categories:
            summary[w][cat] = {}
            cat_data = joined.loc[(joined['category_1'] == cat) | (joined['category_w'] == cat)].reset_index()
            datas_x.append(cat_data['simulation_time_1'])
            datas_y.append(cat_data['simulation_time_w'])
            datas_labels.append(cat_data['circuit'])
            speedups = datas_x[-1] / datas_y[-1]
            for p in [90, 95, 99, 99.5]:
                summary[w][cat][p] = np.percentile(speedups, p)
            summary[w]['total_time_reduction_factor'] = sum(joined['simulation_time_1']) / sum(joined['simulation_time_w'])

        # write summary of speedups
        with open(os.path.join(args.dir, 'speedups_summary.json'), 'w', encoding='utf-8') as f:
             json.dump(summary, f, indent=2)

        # plot 1 vs w separately (colored by amount of sharing)
        plot_scatter(args, f'multicore{w}_scatter_{scaling}',
                    datas_x, datas_y, datas_labels,
                    '1 worker time (s)', f'{w} workers time (s)',
                    COLORS, categories, diagonals=[1/w],
                    x_scale=scaling, y_scale=scaling,
                    cosiness=1.6)


def latex_table_simulation(df : pd.DataFrame, args):
    """
    Write a LaTeX table with the simulation time results.
    """
    # select data
    d1 = df.loc[(df['tool'] == 'q-sylvan') & (df['workers'] == 1)]
    d2 = df.loc[(df['tool'] == 'mqt') & (df['workers'] == 1)]
    d3 = df.loc[(df['tool'] == 'quasimodo') & (df['workers'] == 1)]

    if len(d3) == 0:
        print("No Quasimodo data, skipping table.")
        return

    # merge d1, d2, d3
    suffixes = ['_1', '_2', '_3']
    merge_on = ['circuit']
    meta_data = ['circuit_type','n_qubits']
    stats = ['status','simulation_time']
    d1 = d1[merge_on + meta_data + stats].rename(columns=dict([(x,f'{x}_1') for x in stats]))
    d2 = d2[merge_on + stats].rename(columns=dict([(x,f'{x}_2') for x in stats]))
    d3 = d3[merge_on + stats].rename(columns=dict([(x,f'{x}_3') for x in stats]))
    df = pd.merge(d1, d2, on=merge_on, how='outer')
    df = pd.merge(df, d3, on=merge_on, how='outer')
    df['min_time'] = df[[f'simulation_time{suff}' for suff in suffixes]].min(axis=1)
    df['min_tool'] = df[[f'simulation_time{suff}' for suff in suffixes]].idxmin(axis=1)
    df.loc[(df['min_time'] == args.timeoutt), 'min_tool'] = 'all timeout'

    # style runtime column
    for suff in ['_1','_2','_3']:
        df = df.astype({f'simulation_time{suff}' : str})
        df.loc[:,f'simulation_time{suff}'] = df[f'simulation_time{suff}'].apply(lambda x : f'{float(x):.2f}')
        df.loc[(df[f'status{suff}'] == 'TIMEOUT'), f'simulation_time{suff}'] = f'> {args.timeoutt}'
        df.loc[(df[f'status{suff}'] == 'NODE_TABLE_FULL'), f'simulation_time{suff}'] = '-'
        df.loc[(df[f'status{suff}'] == 'WEIGHT_TABLE_FULL'), f'simulation_time{suff}'] = '-'
        df.loc[(df['min_tool'] == f'simulation_time{suff}'), f'simulation_time{suff}'] =\
                df[f'simulation_time{suff}'].apply(lambda x : f'\\textbf{{{x}}}')

    # styling of table
    df = df.sort_values(['circuit_type', 'n_qubits'])
    df = df[meta_data + ['simulation_time_1', 'simulation_time_2', 'simulation_time_3']]
    df = df.rename(columns={'circuit_type' : 'Algorithm', 'n_qubits' : '$n$',
                            'simulation_time_1' : 'Q-Sylvan (EVDD)', 
                            'simulation_time_2' : 'MQT DDSIM (EVDD)',
                            'simulation_time_3' : 'Quasimodo (CLFOBDD)'})
    styler = df.style
    styler.hide(axis='index')
    styler.set_table_styles([
        {'selector': 'toprule', 'props': ':hline;'},
        {'selector': 'midrule', 'props': ':hline;'},
        {'selector': 'bottomrule', 'props': ':hline;'},
    ], overwrite=True)

    # write to file
    output_file = os.path.join(tables_dir(args), 'simulation_time.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format='lr||rrr'))


def latex_table_equivalent(df : pd.DataFrame, args, highlight=True):
    """
    Write LaTeX table like Table 4 in https://arxiv.org/pdf/2403.18813.
    """
    merge_on = ['circuit_U']
    meta_data = ['circuit_type','n_qubits','n_gates_U','n_gates_V']
    stats = ['equivalent','status','wall_time']
    tools = sorted(df['tool'].unique(), key=lambda x: ORDER.index(x))

    # select data (grouped by tool)
    dfs = []
    for i, tool in enumerate(tools):
        dtool = df.loc[(df['type'] == 'opt') & (df['tool'] == tool) & (df['workers'] == 1)]
        if (i == 0):
            dtool = dtool[merge_on + meta_data + stats].rename(columns=dict([(x,f'{x}_{i}') for x in stats]))
        else:
            dtool = dtool[merge_on + stats].rename(columns=dict([(x,f'{x}_{i}') for x in stats]))
        dfs.append(dtool)

    # merge results for tools into one table
    if len(dfs) == 1:
        merged = dfs[0]
    elif len(dfs) >= 2:
        merged = pd.merge(dfs[0], dfs[1], on=merge_on, how='outer')
        for i in range(2, len(dfs)):
            merged = pd.merge(merged, dfs[i], on=merge_on, how='outer')
    df = merged
    suffixes = [f"_{i}" for i in range(len(tools))]

    # add fastest tool column
    for suff in suffixes:
        df[f'wall_time{suff}'] = df[f'wall_time{suff}'].fillna(value=args.timeoutt)
    df['min_time'] = df[[f'wall_time{suff}' for suff in suffixes]].min(axis=1)
    df['min_tool'] = df[[f'wall_time{suff}' for suff in suffixes]].idxmin(axis=1)
    df.loc[(df['min_time'] == args.timeoutt), 'min_tool'] = 'all timeout'

    # style runtime column
    for suff in suffixes:
        df = df.astype({f'wall_time{suff}' : str})
        df.loc[:,f'wall_time{suff}'] = df[f'wall_time{suff}'].apply(lambda x : f'{float(x):.2f}')
        df.loc[(df[f'status{suff}'] == 'TIMEOUT'), f'wall_time{suff}'] = f'> {args.timeoutt}'
        df.loc[(df[f'status{suff}'] == 'NODE_TABLE_FULL'), f'wall_time{suff}'] = '-'
        df.loc[(df[f'status{suff}'] == 'WEIGHT_TABLE_FULL'), f'wall_time{suff}'] = '-'
        df.loc[(df[f'equivalent{suff}'] == 'not_equivalent'), f'wall_time{suff}'] = '$\\times$'
        df.loc[(df[f'wall_time{suff}'] == 'nan'), f'wall_time{suff}'] = ''
        if highlight:
            df.loc[(df['min_tool'] == f'wall_time{suff}'), f'wall_time{suff}'] =\
                    df[f'wall_time{suff}'].apply(lambda x : f'\\textbf{{{x}}}')

    # styling of table
    df = df.sort_values(['circuit_type', 'n_qubits'])
    df = df[meta_data + [f'wall_time{suff}' for suff in suffixes]]
    
    name_map = {'circuit_type' : 'Algorithm', 'n_qubits' : '$n$',
                'n_gates_U' : '$|G|$', 'n_gates_V' : '$|G\'|$'}
    for i in range(len(tools)):
        name_map[f'wall_time_{i}'] = tools[i]
    df = df.rename(columns=name_map)
    styler = df.style
    styler.hide(axis='index')
    styler.set_table_styles([
        {'selector': 'toprule', 'props': ':hline;'},
        {'selector': 'midrule', 'props': ':hline;'},
        {'selector': 'bottomrule', 'props': ':hline;'},
    ], overwrite=True)
    column_format = 'l||rrr||'+'r'*len(tools)

    # write full table
    output_file = os.path.join(tables_dir(args), 'eqcheck_equiv_table_full.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format=column_format))

    # write selection
    algorithms = df['Algorithm'].copy()
    df['Algorithm'] = algorithms.apply(lambda x : x if x in EQTAB_SELECTION else f'%{x}')
    output_file = os.path.join(tables_dir(args), 'eqcheck_equiv_table_selection.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format=column_format))

    # write inverse of selection
    df['Algorithm'] = algorithms.apply(lambda x : f'%{x}' if x in EQTAB_SELECTION else x)
    output_file = os.path.join(tables_dir(args), 'eqcheck_equiv_table_rest.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format=column_format))


def latex_table_non_equivalent(df : pd.DataFrame, args, highlight=True):
    """
    Write LaTeX table like Table 5 in https://arxiv.org/pdf/2403.18813.
    """
    merge_on = ['circuit_U']
    meta_data = ['circuit_type','n_qubits','n_gates_U','n_gates_V','type']
    stats = ['equivalent','status','wall_time']
    tools = sorted(df['tool'].unique(), key=lambda x: ORDER.index(x))

    # select data + combine corresponding gm and flip into single rows)
    dfs = []
    for tool in tools:
        dtool = df.loc[(df['tool'] == tool) & (df['workers'] == 1)]
        dtool = dtool[merge_on + meta_data + stats]
        gm   = dtool.loc[(df['type'] == 'gm')].drop('type', axis=1)
        flip = dtool.loc[(df['type'] == 'flip')].drop('type', axis=1)
        dtool = gm.merge(flip[merge_on + stats], 
                        on=merge_on, how='outer',
                        suffixes=('_gm', '_flip'))
        dtool['n_gates_V'] = dtool['n_gates_V'] + 1
        dfs.append(dtool)
    # update stats, metadata columns
    stats = [y for x in stats for y in (f'{x}_gm',f'{x}_flip')] # oh python
    meta_data.remove('type')

    # update columns so that they don't conflict when merging
    dfs[0] = dfs[0][merge_on + meta_data + stats].rename(columns=dict([(x,f'{x}_0') for x in stats]))
    for i in range(1, len(dfs)):
        dfs[i] = dfs[i][merge_on + stats].rename(columns=dict([(x,f'{x}_{i}') for x in stats]))
    suffixes = [f"_{i}" for i in range(len(tools))]

    # merge results for tools into one table
    if len(dfs) == 1:
        merged = dfs[0][merge_on + meta_data + stats]
    elif len(dfs) > 2:
        d0 = dfs[0]
        merged = pd.merge(dfs[0], dfs[1], on=merge_on, how='outer')
        for i in range(2, len(dfs)):
            merged = pd.merge(merged, dfs[i], on=merge_on, how='outer')
    df = merged

    # add fastest tool column
    for suff_type in ['_gm', '_flip']:
        for suff_tool in suffixes:
            suff = suff_type + suff_tool
            df[f'wall_time{suff}'] = df[f'wall_time{suff}'].fillna(value=args.timeoutt)
        df[f'min_time{suff_type}'] = df[[f'wall_time{suff_type}{_s}' for _s in suffixes]].min(axis=1)
        df[f'min_tool{suff_type}'] = df[[f'wall_time{suff_type}{_s}' for _s in suffixes]].idxmin(axis=1)
        df.loc[(df[f'min_time{suff_type}'] == args.timeoutt), f'min_tool{suff_type}'] = 'all timeout'

    # style runtime columns
    for suff_type in ['_gm', '_flip']:
        for suff_tool in suffixes:
            suff = suff_type + suff_tool
            df = df.astype({f'wall_time{suff}' : str})
            df.loc[:,f'wall_time{suff}'] = df[f'wall_time{suff}'].apply(lambda x : f'{float(x):.2f}')
            df.loc[(df[f'status{suff}'] == 'TIMEOUT'), f'wall_time{suff}'] = f'> {args.timeoutt}'
            df.loc[(df[f'status{suff}'] == 'NODE_TABLE_FULL'), f'wall_time{suff}'] = '-'
            df.loc[(df[f'status{suff}'] == 'WEIGHT_TABLE_FULL'), f'wall_time{suff}'] = '-'
            df.loc[(df[f'equivalent{suff}'] == 'equivalent'), f'wall_time{suff}'] = '$\\times$'
            df.loc[(df[f'wall_time{suff}'] == 'nan'), f'wall_time{suff}'] = ''
            if highlight:
                df.loc[(df[f'min_tool{suff_type}'] == f'wall_time{suff}'), f'wall_time{suff}'] =\
                    df[f'wall_time{suff}'].apply(lambda x : f'\\textbf{{{x}}}')

    # styling of table
    df = df.sort_values(['circuit_type', 'n_qubits'])
    df = df[['circuit_type', 'n_qubits', 'n_gates_U', 'n_gates_V'] +
            [f'wall_time_gm{suff}' for suff in suffixes] +
            [f'wall_time_flip{suff}' for suff in suffixes]]
    name_map = {'circuit_type' : 'Algorithm', 'n_qubits' : '$n$',
                'n_gates_U' : '$|G|$', 'n_gates_V' : '$|G\'|$'}
    for i in range(len(tools)):
        name_map[f'wall_time_gm_{i}'] = tools[i] + " (gm)"
        name_map[f'wall_time_flip_{i}'] = tools[i] + " (flip)"
    df = df.rename(columns=name_map)
    styler = df.style
    styler.hide(axis='index')
    styler.set_table_styles([
        {'selector': 'toprule', 'props': ':hline;'},
        {'selector': 'midrule', 'props': ':hline;'},
        {'selector': 'bottomrule', 'props': ':hline;'},
    ], overwrite=True)
    column_format = 'l||rrr||'+'r'*len(tools)+'||'+'r'*len(tools)

    # write full table
    output_file = os.path.join(tables_dir(args), 'eqcheck_nonequiv_table_full.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format=column_format))

    # write selection
    algorithms = df['Algorithm'].copy()
    df['Algorithm'] = algorithms.apply(lambda x : x if x in NEQTAB_SELECTION else f'%{x}')
    output_file = os.path.join(tables_dir(args), 'eqcheck_nonequiv_table_selection.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format=column_format))
    
    # write inverse of selection
    df['Algorithm'] = algorithms.apply(lambda x : f'%{x}' if x in NEQTAB_SELECTION else x)
    output_file = os.path.join(tables_dir(args), 'eqcheck_nonequiv_table_rest.tex')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(styler.to_latex(column_format=column_format))
