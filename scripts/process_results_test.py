"""
Code for sanity checking results of experiments.
"""
import os
import re
import numpy as np
import pandas as pd


def issues_file(args):
    """
    File to write instances with issues to.
    """
    return os.path.join(args.dir, 'issues.txt')


def _to_complex_vector(state_vector_json):
    """
    Obtain a 2^n x 1 complex vector from the 2^n x 2 data structure.
    """
    return np.apply_along_axis(lambda args: [complex(*args)], 1, state_vector_json)


def compare_vectors(args):
    """
    Compare state vectors in json files, and write all issue cases to file.
    """
    print("Comparing state vectors between both tools")
    json_dir = os.path.join(args.dir, 'json')
    regexp = re.compile(r'(.*)qsylvan(.*)json')
    fidelities = []
    fidelity_issues = []
    for filename in sorted(os.listdir(json_dir)):
        filepath = os.path.join(json_dir, filename)
        if regexp.search(filepath) and os.path.getsize(filepath) > 0:
            vec_qsy = None
            vec_mqt = None
            row = None
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                    if 'state_vector' in data:
                        vec_qsy = _to_complex_vector(data['state_vector'])
                    else:
                        print(f"No state vector in {filepath}, skipping")
                        continue
                    row = data['statistics']
                mqt_file = filepath.split('qsylvan')[0] + 'mqt.json'
                try:
                    with open(mqt_file, 'r', encoding='utf-8') as f:
                        data = json.load(f)
                        if 'state_vector' in data:
                            vec_mqt = _to_complex_vector(data['state_vector'])
                except:
                    print(f"    Could not get json data from {mqt_file}, skipping")
            except:
                print(f"    Could not get json data from {filepath}, skipping")

            if not vec_qsy is None and not vec_mqt is None:
                # normalize global phase
                in_prod = np.dot(vec_qsy.conj().T, vec_mqt)[0,0]
                fidelity = (abs(in_prod))**2
                row['fidelity'] = fidelity
                fidelities.append(row)
                if abs(in_prod - 1.0) > 1e-3:
                    if abs(fidelity - 1.0) > 1e-3:
                        fidelity_issues.append(row)
                    #else:
                    #    print(f"Note: different global phase for {filename[:-15]}")
    fid_df = pd.DataFrame(fidelities)
    if len(fidelity_issues) > 0:
        print(f"    {len(fidelity_issues)} instances where fidelity !~= 1.000")
        print(f"    Writing details to {issues_file(args)}")
        issues_df = pd.DataFrame(fidelity_issues)[['benchmark', 'n_qubits',
                    'simulation_time', 'workers', 'reorder', 'wgt_norm_strat',
                    'wgt_inv_caching', 'max_nodes', 'norm', 'fidelity']]
        with open(issues_file(args), 'a', encoding='utf-8') as f:
            f.write("Issues with fidelity:\n")
            f.write(issues_df.to_string())
            f.write("\n\n")
    return fid_df


def check_norms(df : pd.DataFrame, args, ns_names):
    """
    Check all (self reported) norms and write all cases where norm != 1.0.
    """
    print("Checking norms...", end='')
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['status'] == 'FINISHED')]
    issues = df.loc[(df['norm'] != 1.0)]
    if len(issues) > 0:
        print(f"\n    Out of {len(df)} finished q-sylvan runs:")
        print(f"    {len(issues)} instances where norm != 1.0")
        if len([x for x in df['wgt_norm_strat'].unique() if ~np.isnan(x)]) > 1:
            total_counts = df.groupby(df['wgt_norm_strat']).size()
            for norm_strat, count in total_counts.items():
                issue_count = (issues['wgt_norm_strat'] == norm_strat).sum()
                print(f"      - norm-{ns_names[norm_strat]}:\t{issue_count}/{count}"\
                      f"({round(issue_count/count*100)}%)")
        print(f"    Writing details to {issues_file(args)}")
        with open(issues_file(args), 'a', encoding='utf-8') as f:
            f.write("Issues with norm:\n")
            f.write(issues.to_string())
            f.write("\n\n\n")
    else:
        print(" all OK")


def check_circuit_equivalence(df : pd.DataFrame, args):
    """
    Check if circuits which are (not) equivalent are found as such.
    """
    print("Checking circuit equivalence results...", end='')
    df = df.loc[(df['status'] == 'FINISHED')]
    false_negatives = []
    false_positives = []
    for index, row in df.iterrows():
        if row['circuit_V'].endswith('opt'): # should be equivalent
            if row['equivalent'] != 1:
                false_negatives.append(row)
        else:
            if row['equivalent'] == 1:       # should not be equivalent
                false_positives.append(row)
    incorrect = pd.DataFrame(false_negatives + false_positives)
    if len(incorrect) > 0:
        print(f"\n    Out of {len(df)} finished circuit equivalence checks:")
        print(f"    {len(false_negatives)} false negatives")
        print(f"    {len(false_positives)} false positives")
        print(f"    Writing details to {issues_file(args)}")
        with open(issues_file(args), 'a', encoding='utf-8') as f:
            f.write("Incorrect equivalence results:\n")
            f.write(incorrect.to_string())
            f.write("\n\n\n")
    else:
        print(" all OK")


def check_termination_errors(df : pd.DataFrame, args):
    """
    Add all non-terminated instances to file.
    """
    print(f"Writing instances with termination issues to {issues_file(args)}")
    keep = ['benchmark', 'circuit_U', 'tool', 'exp_id', 'status']
    columns = list(df.columns.values)
    df = df[list(set(columns) & set(keep))]
    df = df.loc[(df['tool'] == 'q-sylvan') & (df['status'] != 'FINISHED') & (df['status'] != 'TIMEOUT')]
    if len(df) > 0:
        with open(issues_file(args), 'a', encoding='utf-8') as f:
            f.write("Instances with termination other than FINISHED/TIMEOUT:\n")
            f.write(df.to_string())
            f.write("\n\n\n")
