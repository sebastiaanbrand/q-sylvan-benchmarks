"""
Code for writing some summary information from experiments.
"""
import os
import re
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
