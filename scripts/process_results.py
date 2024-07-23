"""
Python script to generate plots given a directory with benchmark results.
"""
import os
import argparse
from abc import abstractmethod
from pathlib import Path
import pandas as pd
import process_results_load as pr_load
import process_results_test as pr_test
import process_results_plot as pr_plot


NS_NAMES = { 0 : 'low', 1 : 'max', 2 : 'min', 3 : 'l2'}


parser = argparse.ArgumentParser()
parser.add_argument('dir', help="Experiments directory (the one which is a date+time).")
parser.add_argument('--compare_vecs', action='store_true', default=False, help="Sanity check by comparing full state vectors (if present).")


class PlotPipeline:

    def __init__(self, args):
        self.args = args
    
    @abstractmethod
    def load_data():
        pass

    @abstractmethod
    def sanity_checks():
        pass

    @abstractmethod
    def plot_all():
        pass

    @staticmethod
    def get_PlotPipeline(args):
        run_script = os.path.join(args.dir, 'run_all.sh')
        with open(run_script, 'r', encoding='utf-8') as f:
            text = f.read()
            if "Circuit equivalence checking benchmarks" in text:
                return EqCheckPlotPipeline(args)
            else:
                return SimPlotPipeline(args)


class SimPlotPipeline(PlotPipeline):

    unused_columns = ['approximation_runs', 'distinct_results', 
                      'final_fidelity', 'seed', 'shots','single_shots']

    def __init__(self, args):
        super().__init__(args)

    def load_data(self):
        """
        Load the data (and do some preprocessing).
        """
        print(f"Loading data from {self.args.dir}")
        self.df = pr_load.load_json(self.args.dir, True)
        self.df = self.df.drop(self.unused_columns, axis=1)
        logs_df = pr_load.load_logs(self.args.dir)
        self.df = pd.concat([self.df, logs_df], ignore_index=True)
        self.df = pr_load.add_circuit_categories(self.df)

    def sanity_checks(self):
        """
        Check norms (+ fidelity of vectors if given) and write to file.
        """
        open(pr_test.issues_file(self.args), 'w', encoding='utf-8')
        pr_test.check_norms(self.df, self.args, NS_NAMES)
        self.fid_df = None
        if self.args.compare_vecs:
            self.fid_df = pr_test.compare_vectors(args)
        pr_test.check_termination_errors(self.df, self.args)

    def plot_all(self):
        """
        Renerate all relevant simulation plots.
        """
        Path(pr_plot.plots_dir(self.args)).mkdir(parents=True, exist_ok=True)
        print(f"Writing plots to {pr_plot.plots_dir(self.args)}")
        pr_plot.plot_tool_comparison(self.df, self.fid_df, self.args)
        pr_plot.plot_dd_size_vs_qubits(self.df, self.args, NS_NAMES)
        pr_plot.plot_relative_speedups(self.df, self.args)
        pr_plot.plot_norm_strat_comparison(self.df, self.args, NS_NAMES)
        pr_plot.plot_inv_cache_comparison(self.df, self.args)


class EqCheckPlotPipeline(PlotPipeline):

    unused_columns = ['max_nodes_U', 'max_nodes_V', 'time_cpu', 'tolerance', 
                      'wgt_norm_strat']

    def load_data(self):
        """
        Load the data (and do some preprocessing).
        """
        print(f"Loading data from {self.args.dir}")
        self.df = pr_load.load_json(self.args.dir)
        self.df = self.df.drop(self.unused_columns, axis=1)
        logs_df = pr_load.load_logs(self.args.dir)
        logs_df = logs_df.rename(columns={'benchmark' : 'circuit_U'})
        self.df = pd.concat([self.df, logs_df], ignore_index=True)

    def sanity_checks(self):
        """
        Check termination issues + correctness of circuit equivalence
        """
        print("TODO: check correctness of circuit (in)equivalence")
        open(pr_test.issues_file(self.args), 'w', encoding='utf-8')
        pr_test.check_termination_errors(self.df, self.args)
        pass
    
    def plot_all(self):
        print("TODO: plots")
        pass


def main():
    """
    Load data + sanity checks + generate plots.
    """
    args = parser.parse_args()
    pipeline = PlotPipeline.get_PlotPipeline(args)
    pipeline.load_data()
    pipeline.sanity_checks()
    pipeline.plot_all()


if __name__ == '__main__':
    main()
