"""
Code for writing some summary information from experiments.
"""
import os
import re
import json
from itertools import combinations
import pandas as pd
import numpy as np


def atoi(text : str):
    """
    Get int from string if it is a digit.
    """
    return int(text) if text.isdigit() else text


def natural_sorting(filename : str):
    """
    Used for sorting strings containing numbers in numerical way.
    """
    return [ atoi(c) for c in re.split(r'(\d+)', filename)]


def write_non_timeout_list(df : pd.DataFrame, args):
    """
    Write list of all circuits for which at least one tool/run finised.
    """
    all_circuits = df['circuit'].unique()
    non_timeouts =  df.loc[df['status'] == 'FINISHED', 'circuit'].unique()

    # compute time
    df.fillna({'simulation_time': args.timeoutt}, inplace=True)
    total_time = sum(df['simulation_time'])
    skip_time =  sum(df.loc[df['circuit'].isin(non_timeouts), 'simulation_time'])

    output_file = os.path.join(args.dir, 'non_timeout_circuits.txt')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("# All circuits for which at least one tool/run finished.\n")
        f.write(f"# Total: {len(non_timeouts)}/{len(all_circuits)}\n")
        f.write(f"# Original wall time: {round(total_time/3600,2)} hours\n")
        f.write(f"# Wall time for circuits below: {round(skip_time/3600,2)} hours\n")
        f.write("\n")
        for circuit in sorted(non_timeouts, key=natural_sorting):
            f.writelines(f"{circuit}.qasm\n")


def _write_statistics_summary(df : pd.DataFrame, file, args):
    """
    Write some summarized statistics.
    """
    file.write("Total finised:\n")
    for (tool, w), data  in df.groupby(by=['tool','workers']):
        finished = sum(data['status'] == 'FINISHED')
        percent = round(finished/len(data) * 100, 1)
        file.write(f"* {tool}_{w} : {finished}/{len(data)} ({percent}%)\n")
    
    # write % faster for all instances (>= cutoff sec for at least one tool)
    file.write("\nTool vs tool win % (excludes circuits where both timeout)\n")
    groups = [(t, w) for (t, w), _ in df.groupby(by=['tool','workers'])]
    for comb in combinations(groups, 2):
        # order such that q-sylvan is always t2
        if comb[0][0] == 'q-sylvan' and comb[1][0] != 'q-sylvan':
            (t2, w2), (t1, w1) = comb
        else:
            (t1, w1), (t2, w2) = comb
        d1 = df.loc[(df['tool'] == t1) & (df['workers'] == w1)]
        d2 = df.loc[(df['tool'] == t2) & (df['workers'] == w2)]
        joined = pd.merge(d1, d2, on='circuit', how='outer', suffixes=('_1','_2'))
        for cutoff in [0, 1, 10]:
            select = joined.loc[((joined['time_1'] >= cutoff) |
                                    (joined['time_2'] >= cutoff)) &
                                ((joined['time_1'] < args.timeoutt) |
                                    (joined['time_2'] < args.timeoutt))]
            if len(select) == 0:
                continue

            t2_faster = sum(select['time_2'] < select['time_1'])
            percent = round(t2_faster/len(select) * 100, 2)
            file.write(f"{t2}_{w2} < {t1}_{w1} on "\
                       f"{t2_faster}/{len(select)} ({percent}%)"\
                       f" of circuits with time >= {cutoff} s \n")


def write_statistics_summary_sim(df : pd.DataFrame, args):
    """
    Write some summarized statistics.
    """
    df = df.rename({'simulation_time' : 'time'}, axis='columns')
    df.fillna({'time': args.timeoutt}, inplace=True)
    output_file = os.path.join(args.dir, 'summary.txt')
    with open(output_file, 'w', encoding='utf-8') as f:
        _write_statistics_summary(df, f, args)


def write_statistics_summary_eqcheck(df : pd.DataFrame, args):
    """
    Write some summarized statistics for eqcheck results
    """
    df = df.rename({'circuit_V' : 'circuit',
                    'wall_time' : 'time'}, axis='columns')
    df.fillna({'time': args.timeoutt}, inplace=True)
    output_file = os.path.join(args.dir, 'summary.txt')
    with open(output_file, 'w', encoding='utf-8') as f:
        # equivalent circuits
        f.write("Equivalent circuits:\n")
        f.write("--------------------\n")
        d1 = df.loc[df['type'] == 'opt']
        _write_statistics_summary(d1, f, args)
        f.write("\n\n")

        # non-equivalent circuits
        f.write("Non-equivalent circuits:\n")
        f.write("------------------------\n")
        d2 = df.loc[df['type'] != 'opt']
        _write_statistics_summary(d2, f, args)


def _add_to_eqcheck_speedup_summary(df : pd.DataFrame, args):
    """
    For a single tool, and either opt or gm+flip circuits, add speedups ot summary.
    """
    merge_on = ['circuit_V']
    stats = ['workers','equivalent','status','wall_time']

    # Get unique numbers of workers
    workers = sorted(df['workers'].unique())
    assert workers[0] == 1
    if len(workers) == 1:
        return

    # Get single worker data
    data_1 = df.loc[df['workers'] == 1]
    
    # For each other number of workers, match with single worker
    summary = {}
    for w in workers[1:]:
        summary[int(w)] = {}
        data_w = df.loc[df['workers'] == w][merge_on + stats]
        joined = pd.merge(data_1, data_w, on=merge_on, how='inner', suffixes=('_1','_w'))
        # remove timeouts
        joined = joined.loc[joined['wall_time_1'].notnull() & joined['wall_time_w'].notnull()]
        # add speedups to summary
        speedups = joined['wall_time_1'] / joined['wall_time_w']
        for p in [90, 95, 99, 99.5]:
            summary[w][p] = np.percentile(speedups, p)
        summary[w]['total_time_reduction_factor'] = sum(joined['wall_time_1']) / sum(joined['wall_time_w'])
    
    return summary


def write_eqcheck_speedup_summary(df : pd.DataFrame, args):
    """
    For all tools, write speedup summary
    (separated between equiv (opt) and non-equiv (gm+flip))
    """
    summary = {}
    for tool in df['tool'].unique():
        summary[tool] = {}
        equiv = df.loc[(df['tool'] == tool) & (df['type'] == 'opt')]
        noneq = df.loc[(df['tool'] == tool) & ((df['type'] == 'gm') | (df['type'] == 'flip'))]
        summary[tool]['equiv'] = _add_to_eqcheck_speedup_summary(equiv, args)
        summary[tool]['non-equiv'] = _add_to_eqcheck_speedup_summary(noneq, args)
    
    # write summary of speedups
    with open(os.path.join(args.dir, 'speedups_summary.json'), 'w', encoding='utf-8') as f:
            json.dump(summary, f, indent=2)
