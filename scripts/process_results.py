"""
Python script to generate plots given a directory with benchmark results.
"""
import os
import argparse
from abc import abstractmethod
from pathlib import Path
import pandas as pd
import process_results_load as pr_load
import process_results_info as pr_info
import process_results_test as pr_test
import process_results_plot as pr_plot


NS_NAMES = { 0 : 'low', 1 : 'max', 2 : 'min', 3 : 'L2'}


parser = argparse.ArgumentParser()
parser.add_argument('dir', help="Experiments directory (the one which is a date+time).")
parser.add_argument('--compare_vecs', action='store_true', default=False, help="Sanity check by comparing full state vectors (if present).")
parser.add_argument('--timeoutt', default=600, help="Timeout time, used for plotting instanced which didn't finish.")


class PlotPipeline:
    """
    Abstract class to bring some structure to the processing of different types
    of results (sim or eqcheck).
    """

    def __init__(self, args):
        self.args = args
        self.df = None

    @abstractmethod
    def load_data(self):
        """ Load the data (and do some preprocessing). """

    @abstractmethod
    def write_info(self):
        """ Write some summary information. """

    @abstractmethod
    def sanity_checks(self):
        """ Some sanity checks on experimental results. """

    @abstractmethod
    def plot_all(self):
        """ Renerate all relevant plots/tables."""

    @staticmethod
    def get_PlotPipeline(args):
        """ Choose between processing sim or eqcheck results. """
        run_script = os.path.join(args.dir, 'run_all.sh')
        with open(run_script, 'r', encoding='utf-8') as f:
            text = f.read()
            if "Circuit equivalence checking benchmarks" in text:
                return EqCheckPlotPipeline(args)
            else:
                return SimPlotPipeline(args)


class SimPlotPipeline(PlotPipeline):
    """
    Process results from circuit simulation experiments.
    """

    res_cols = ['exp_id', 'applied_gates', 'final_nodes', 'max_nodes', 'norm',
                'reorder', 'seed', 'simulation_time', 'tolerance', 
                'wgt_inv_caching', 'wgt_norm_strat', 'status']

    def __init__(self, args):
        super().__init__(args)
        self.fid_df = None

    def load_data(self):
        """
        Load the data (and do some preprocessing).
        """
        print(f"Loading data from {self.args.dir}")
        self.df = pr_load.load_meta(self.args.dir)
        self.df.set_index('exp_id', inplace=True)
        results = pr_load.load_json(self.args.dir)[self.res_cols]
        results.set_index('exp_id', inplace=True)
        self.df = pd.merge(self.df, results, on='exp_id', how='left')
        logs_df = pr_load.load_logs(self.args.dir)
        logs_df.set_index('exp_id', inplace=True)
        self.df.update(logs_df, overwrite=False)
        self.df = pr_load.add_circuit_categories(self.df)
        self.df['status'] = self.df['status'].fillna('TIMEOUT')

    def write_info(self):
        """
        Write some summary information.
        """
        pr_info.write_statistics_summary_sim(self.df, self.args)
        pr_info.write_non_timeout_list(self.df, self.args)

    def sanity_checks(self):
        """
        Check norms (+ fidelity of vectors if given) and write to file.
        """
        open(pr_test.issues_file(self.args), 'w', encoding='utf-8')
        pr_test.check_norms(self.df, self.args, NS_NAMES)
        if self.args.compare_vecs:
            self.fid_df = pr_test.compare_vectors(self.args)
        pr_test.check_termination_errors(self.df, self.args)

    def plot_all(self):
        """
        Renerate all relevant simulation plots.
        """
        print(f"Writing plots to {pr_plot.plots_dir(self.args)}")
        pr_plot.mkdir_plots(self.args)
        pr_plot.plot_tool_comparison_workers(self.df, self.fid_df, self.args)
        pr_plot.plot_dd_size_vs_qubits(self.df, self.args, NS_NAMES)
        pr_plot.plot_multicore_scatter(self.df, self.args)
        pr_plot.plot_multicore_scatter_sharing(self.df, self.args)
        pr_plot.plot_norm_strat_comparison(self.df, self.args, NS_NAMES)
        pr_plot.plot_inv_cache_comparison(self.df, self.args)
        pr_plot.plot_qubit_reorder_comparison(self.df, self.args)
        print(f"Writing tables to {pr_plot.tables_dir(self.args)}")
        Path(pr_plot.tables_dir(self.args)).mkdir(parents=True, exist_ok=True)
        pr_plot.latex_table_simulation(self.df, self.args)


class EqCheckPlotPipeline(PlotPipeline):
    """
    Process results from circuit equivalence checking experiments.
    """

    res_cols = ['exp_id', 'status', 'equivalent', 'wall_time']

    def load_data(self):
        """
        Load the data (and do some preprocessing).
        """
        print(f"Loading data from {self.args.dir}")
        self.df = pr_load.load_meta(self.args.dir)
        self.df.set_index('exp_id', inplace=True)
        results = pr_load.load_json(self.args.dir)[self.res_cols]
        results.set_index('exp_id', inplace=True)
        self.df = pd.merge(self.df, results, on='exp_id', how='left')
        logs_df = pr_load.load_logs(self.args.dir)[['exp_id', 'status']]
        logs_df.set_index('exp_id', inplace=True)
        self.df.update(logs_df)
        self.df.loc[~(self.df['wall_time'].isna()), 'status'] = 'FINISHED'
        self.df['status'] = self.df['status'].fillna('TIMEOUT')
        self.df.loc[(self.df['equivalent'] == 0), 'equivalent'] = 'not_equivalent'
        self.df.loc[(self.df['equivalent'] == 1), 'equivalent'] = 'equivalent'
        self.df.loc[(self.df['equivalent'] == 'equivalent_up_to_global_phase'), 'equivalent'] = 'equivalent'

    def write_info(self):
        """
        Write some useful summary information.
        """
        pr_info.write_statistics_summary_eqcheck(self.df, self.args)

    def sanity_checks(self):
        """
        Check termination issues + correctness of circuit equivalence
        """
        open(pr_test.issues_file(self.args), 'w', encoding='utf-8')
        pr_test.check_circuit_equivalence(self.df, self.args)
        pr_test.check_termination_errors(self.df, self.args)

    def plot_all(self):
        """
        Create plots and LaTeX tables.
        """
        print(f"Writing tables to {pr_plot.tables_dir(self.args)}")
        Path(pr_plot.tables_dir(self.args)).mkdir(parents=True, exist_ok=True)
        pr_plot.latex_table_equivalent(self.df, self.args)
        pr_plot.latex_table_non_equivalent(self.df, self.args)


def main():
    """
    Load data + sanity checks + generate plots.
    """
    args = parser.parse_args()
    pipeline = PlotPipeline.get_PlotPipeline(args)
    pipeline.load_data()
    pipeline.write_info()
    pipeline.sanity_checks()
    pipeline.plot_all()


if __name__ == '__main__':
    main()
