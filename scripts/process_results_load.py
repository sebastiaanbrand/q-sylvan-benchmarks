"""
Code for loading the results of experiments.
"""
import os
import re
import json
import pandas as pd


CIRCUIT_CATEGORY_FILE = os.path.join(os.path.dirname(__file__), 'circuit_categories.json')


def _get_termination_status(log_filepath : str):
    """
    Get the termination status of benchmark based on log.
    """
    with open(log_filepath, 'r', encoding='utf-8') as f:
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
            elif "Assertion" in text and "failed" in text:
                return "ERROR"
            else:
                print("    Could not get termination status from file:")
                print("    " + log_filepath)
        elif 'mqt' in log_filepath:
            pass
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
        stats['workers'] = 1
    stats['exp_id'] = re.findall(r'\d+', log_filename)[-1]
    stats['status'] = _get_termination_status(log_filepath)
    return stats


def _add_missing_fields(row : dict):
    """
    Add missing data fields (i.e. information which was added to later version
    of the code) to allow the plotting code to re-plot older data.
    """
    if 'reorder' not in row.keys():
        row['reorder'] = 2
    if 'wgt_inv_caching' not in row.keys():
        row['wgt_inv_caching'] = 1
    return row


def load_json(exp_dir : str, add_missing = False):
    """
    Load the data (and do some preprocessing).
    """
    df = pd.DataFrame()
    rows = []
    json_dir = os.path.join(exp_dir, 'json')
    for filename in sorted(os.listdir(json_dir)):
        filepath = os.path.join(json_dir, filename)
        if filename.endswith('.json') and os.path.getsize(filepath) > 0:
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    row = data['statistics']
                    if 'mqt' in filename:
                        row['tool'] = 'mqt'
                        row['workers'] = 1
                    elif 'qsylvan' in filename:
                        row['tool'] = 'q-sylvan'
                    row['exp_id'] = re.findall(r'\d+', filename)[-1]
                    row['status'] = 'FINISHED'
                    if add_missing:
                        row = _add_missing_fields(row)
                    rows.append(row)
            except json.decoder.JSONDecodeError:
                print(f"    Error getting json data from {filepath}, skipping")

    df = pd.DataFrame(rows)
    return df


def load_logs(exp_dir : str):
    """
    Add information from logs to dataframe.
    """
    new_rows = []
    log_dir = os.path.join(exp_dir, 'logs')
    for filename in sorted(os.listdir(log_dir)):
        filepath = os.path.join(log_dir, filename)
        if filename.endswith('.log') and os.path.getsize(filepath) > 0:
            row = _get_log_info(filepath, filename)
            if row['status'] == 'FINISHED':
                assert row['benchmark'] in df['benchmark'].values
            else:
                new_rows.append(row)
    return pd.DataFrame(new_rows)


def add_circuit_categories(df : pd.DataFrame):
    """
    Add column to the df in which every benchmark labeled with a category.
    """
    cat_info = {}
    with open(CIRCUIT_CATEGORY_FILE, 'r', encoding='utf-8') as f:
        cat_info = json.load(f)
    circuit_types = cat_info['circuit_types']
    use_cat = cat_info['use_category']
    df.insert(loc=1, column='category', value = 'N/A')
    for i, row in df.iterrows():
        circ_type = row['benchmark'].split('_')[0]
        if circ_type in circuit_types:
            df.at[i, 'category'] = circuit_types[circ_type][use_cat]
        else:
            df.at[i, 'category'] = circ_type
    return df
