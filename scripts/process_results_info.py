"""
Code for writing some summary information from experiments.
"""
import os
import re
from itertools import combinations
import pandas as pd


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


def write_statistics_summary(df : pd.DataFrame, args):
    """
    Write some summarized statistics.
    """
    output_file = os.path.join(args.dir, 'summary.txt')
    with open(output_file, 'w', encoding='utf-8') as f:

        f.write("Total finised:\n")
        for (tool, w), data  in df.groupby(by=['tool','workers']):
            finished = data['status'].value_counts()['FINISHED']
            percent = round(finished/len(data) * 100, 1)
            f.write(f"* {tool}_{w} : {finished}/{len(data)} ({percent}%)\n")
        
        # write % faster for all instances (>= cutoff sec for at least one tool)
        f.write("\nNumber of instances faster\n")
        groups = [(t, w) for (t, w), _ in df.groupby(by=['tool','workers'])]
        for comb in combinations(groups, 2):
            (t1, w1), (t2, w2) = comb
            d1 = df.loc[(df['tool'] == t1) & (df['workers'] == w1)]
            d2 = df.loc[(df['tool'] == t2) & (df['workers'] == w2)]
            joined = pd.merge(d1, d2, on='circuit', how='outer', suffixes=('_1','_2'))
            for cutoff in [0, 1, 10]:
                select = joined.loc[(joined['simulation_time_1'] >= cutoff) |
                                    (joined['simulation_time_2'] >= cutoff)]

                t2_faster = sum(select['simulation_time_2'] < select['simulation_time_1'])
                percent = round(t2_faster/len(select) * 100, 2)
                f.write(f"{t2}_{w2} < {t1}_{w1} on "\
                        f"{t2_faster}/{len(select)} ({percent}%)"\
                        f" of circuits with time >= {cutoff} s \n")
