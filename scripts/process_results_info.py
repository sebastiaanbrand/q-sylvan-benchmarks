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
    df = df.loc[df['status'] == 'FINISHED', 'circuit'].unique()

    output_file = os.path.join(args.dir, 'non_timeout_circuits.txt')
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("# All circuits for which at least one tool/tun finished.\n")
        f.write(f"# Total: {len(df)}\n\n")
        for circuit in sorted(df, key=natural_sorting):
            f.writelines(f"{circuit}.qasm\n")
