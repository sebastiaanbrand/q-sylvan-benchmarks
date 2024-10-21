# TACAS 2025 Artifact

## 1. Installation

1. Install basic build tools. (build-essential and cmake are already installed maybe autoconf as well, **TODO:** check)
```shell
$ sudo dpkg -i dependencies/autoconf_2.71-2_all_amd64.deb
```

2. Install dependencies for various tools. (On an ARM CPU, replace `amd64` with `arm64` in the follow commands.)
```shell
$ sudo dpkg -i dependencies/libgmp-dev_6.2.1+dfsg-3ubuntu1_amd64.deb
$ sudo dpkg -i dependencies/libmpfr-dev_4.1.0-3build3_amd64.deb
$ sudo dpkg -i dependencies/libmpc-dev_1.2.1-2build1_amd64.deb
$ sudo dpkg -i dependencies/zlib1g-dev_1.2.11.dfsg-2ubuntu9_amd64.deb
```
Alternatively, with an internet connection they can be installed using
```shell
$ sudo apt install libgmp-dev libmpfr-dev libmpc-dev zlib1g-dev
```

3. ~~Install Python libraries (creating a virtual environment is optional but recommended).~~
The required Python packages have been preinstalled in the included virtual environment. It can be activated using
```shell
$ source .venv/bin/activate
```
**TODO** preinstall on VM w/ pip in virtual env. Include that virtual env in artifact.


4. After installing the dependencies above, everything can be compiled with
```shell
$ ./compile_all.sh
```

5. ~~The benchmark files can be obtained with `./get_qasm.sh`~~.
The benchmark files are included in the Artifact submission, in the `qasm/` directory.



## 2. Running + plotting benchmarks

In the following we specify how each plot can be reproduced.

**TODO:** something about estimated runtimes for full benchmarks

To quickly test the code on a small subset of benchmarks, replace `qasm/` in the following commands with `qasm_testset/`.

**TODO:** make `qasm_testset/`

The data used for the plots in the paper is also included (except for the validation of Figure 5, due to its large size) in `experiments_paper_data/`.

**TODO:** include `experiments_paper_data/`



### Figure 3c + 4
```shell
$ python scripts/generate_sim_experiments.py qasm/mqtbench_indep/ --name fig3_4 --max_qubits 30 --test_norm_strats
$ bash experiments/fig3_4/run_qsylvan.sh
$ python scripts/process_results.py experiments/fig3_4/
```
The values in the table in Fig. 3c are displayed in the terminal. The plots can be found at `experiments/fig3_4/plots/png/norm_strat_nodecount_max_vs_L2.png` (Fig. 4a) and `experiments/fig3_4/plots/png/norm_strat_runtime_max_vs_L2.png` (Fig. 4b).



### Figure 5
```shell
$ python scripts/generate_sim_experiments.py qasm/mqtbench_indep/ --name fig5a --min_qubits 10 --max_qubits 50
$ bash experiments/fig5a/run_all.sh
$ python scripts/process_results.py experiments/fig5a/

$ python scripts/generate_sim_experiments.py qasm/ketgpt/ --name fig5b
$ bash experiments/fig5b/run_all.sh
$ python scripts/process_results.py experiments/fig5b/
```
The plots can be found at `experiments/fig5a/mqt_vs_qsylvan1_log.png` (Fig. 5a) and `experiments/fig5b/mqt_vs_qsylvan1_log.png` (Fig. 5b).



###  Figure 5 including validation
As mentioned in the caption of Figure 5, the full state vectors have been checked up to 20 qubits. Note that this generates ~5 GB of log files.
```shell
$ python scripts/generate_sim_experiments.py qasm/mqtbench_indep/ --name fig5a_val --min_qubits 10 --max_qubits 50 --log_vector
$ bash experiments/fig5a_val/run_all.sh
$ python scripts/process_results.py experiments/fig5a_val/ --compare_vectors

$ python scripts/generate_sim_experiments.py qasm/ketgpt/ --name fig5b_val
$ bash experiments/fig5b_val/run_all.sh
$ python scripts/process_results.py experiments/fig5b_val/ --compare_vectors
```
If both tools agree on the state vectors, the following is written to the terminal: `Fidelity of all # checked vectors ~= 1.000.` If there are issues with the state vectors they are written to `issues.txt` in the `fig5a`/`fig5b` directory.



### Table 1
```shell
$ python scripts/generate_sim_experiments.py qasm/mqtbench_ibm/ --name tab1 --nqubits 8 16 32 --tools q-sylvan mqt quasimodo
$ bash experiments/tab1/run_all.sh
$ python scripts/process_results.py experiments/tab1/
```
The resulting table can be found at `experiments/tab1/tables/simulation_time.tex`

Side note: since Quasimodo does not support the full Open QASM 2.0 gate set, we run the benchmark comparison with Quasimodo on a transpiled version (`qasm/`) of the MQT Bench set.


### Figure 6
```shell
$ python scripts/generate_sim_experiments.py qasm/mqtbench_indep/ --name fig6_left --min_qubits 10 --max_qubits 50 --workers 1 8 64
$ bash experiments/fig6_left/run_qsylvan.sh
$ python scripts/process_results.py experiments/fig6_left/

$ python scripts/generate_sim_experiments.py qasm/ketgpt/ --name fig6_right --workers 1 8 64
$ bash experiments/fig6_right/run_qsylvan.sh
$ python scripts/process_results.py experiments/fig6_right/
```
The resulting figures can be found at
* `experiments/fig6_left/multicore8_scatter_log.png` (Fig. 6d)
* `experiments/fig6_right/multicore8_scatter_log.png` (Fig. 6e)
* `experiments/fig6_left/multicore64_scatter_log.png` (Fig. 6f)
* `experiments/fig6_right/multicore64_scatter_log.png` (Fig. 6g)

The values in the table in Fig 6a can be found in
* `experiments/fig6_left/speedups_summary.json`
* `experiments/fig6_right/speedups_summary.json`

For parallel benchmarks the node counting is disabled. Instead Fig 6b and Fig 6c can be obtained from:
* `experiments/fig5a/qubits_vs_nodes_qsylvan_max.png` (Fig 6b)
* `experiments/fig5b/qubits_vs_nodes_qsylvan_max.png` (Fig 6c)



### Table 2 + 3 (+ 4,5,6 in appendix)
For these tables, the code is not set up to automatically run and process both the "alternating" and the "Pauli" algorithms in Q-Sylvan. These were run separately and manually combined in a single table. The separate tables can still be automatically generated.
```shell
TODO
```
**TODO:** add plots location
