"""
Python script to generate plots given a directory with benchmark results.
"""
import os
import argparse
from abc import abstractmethod
from pathlib import Path
import pipeline_load as pl_load
import pipeline_test as pl_test
import pipeline_plot as pl_plot


NS_NAMES = { 0 : 'low', 1 : 'max', 2 : 'min', 3 : 'l2'}


parser = argparse.ArgumentParser()
parser.add_argument('dir', help="Experiments directory (the one which is a date+time).")
parser.add_argument('--compare_vecs', action='store_true', default=False, help="Sanity check by comparing full state vectors (if present).")
parser.add_argument('--type', choices=['sim','eqcheck'], default='sim', help="Which type of experiments to generate plots for.")


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
    def get(args):
        run_script = os.path.join(args.dir, 'run_all.sh')
        with open(run_script, 'r', encoding='utf-8') as f:
            text = f.read()
            if "Circuit equivalence checking benchmarks" in text:
                return EqCheckPlotPipeline(args)
            else:
                return SimPlotPipeline(args)


class SimPlotPipeline(PlotPipeline):

    def __init__(self, args):
        super().__init__(args)

    def load_data(self):
        """
        Load the data (and do some preprocessing).
        """
        print(f"Loading data from {self.args.dir}")
        self.df = pl_load.load_json(self.args.dir, True)
        self.df = pl_load.load_logs(self.args.dir, self.df)
        self.df = pl_load.add_circuit_categories(self.df)

    def sanity_checks(self):
        """
        Check norms (+ fidelity of vectors if given) and write to file.
        """
        open(pl_test.issues_file(self.args), 'w', encoding='utf-8')
        pl_test.check_norms(self.df, self.args, NS_NAMES)
        self.fid_df = None
        if self.args.compare_vecs:
            self.fid_df = pl_test.compare_vectors(args)

    def plot_all(self):
        """
        Renerate all relevant simulation plots.
        """
        Path(pl_plot.plots_dir(self.args)).mkdir(parents=True, exist_ok=True)
        print(f"Writing plots to {pl_plot.plots_dir(self.args)}")
        pl_plot.plot_tool_comparison(self.df, self.fid_df, self.args)
        pl_plot.plot_dd_size_vs_qubits(self.df, self.args, NS_NAMES)
        pl_plot.plot_relative_speedups(self.df, self.args)
        pl_plot.plot_norm_strat_comparison(self.df, self.args, NS_NAMES)
        pl_plot.plot_inv_cache_comparison(self.df, self.args)


class EqCheckPlotPipeline(PlotPipeline):

    def load_data(self):
        """
        Load the data (and do some preprocessing).
        """
        print(f"Loading data from {self.args.dir}")
        self.df = pl_load.load_json(self.args.dir)
        print("TODO: add data from logs?")

    def sanity_checks(self):
        print("TODO: sanity checks")
        pass
    
    def plot_all(self):
        print("TODO: plots")
        pass


def main():
    """
    Load data + sanity checks + generate plots.
    """
    args = parser.parse_args()
    pipeline = PlotPipeline.get(args)
    pipeline.load_data()  
    pipeline.sanity_checks()
    pipeline.plot_all()


if __name__ == '__main__':
    main()
