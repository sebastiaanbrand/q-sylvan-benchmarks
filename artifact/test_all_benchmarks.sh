#!/bin/bash


# Figure 1c (table data)
printf "Figure 1c (table data)\n"
python3 scripts/generate_sim_experiments.py qasm/test_sets/mqtbench_indep/ --name fig1c --max_qubits 30 --test_norm_strats
bash experiments/fig1c/run_qsylvan.sh
python3 scripts/process_results.py experiments/fig1c/


# Figure 2
printf "\n\nFigure 2\n"
python3 scripts/generate_sim_experiments.py qasm/test_sets/mqtbench_indep/ --name fig2a --max_qubits 50
bash experiments/fig2a/run_all.sh
python3 scripts/process_results.py experiments/fig2a/

python3 scripts/generate_sim_experiments.py qasm/test_sets/ketgpt/ --name fig2b
bash experiments/fig2b/run_all.sh
python3 scripts/process_results.py experiments/fig2b/


# Figure 2 including validation
printf "\n\nFigure 2 + validation\n"
python3 scripts/generate_sim_experiments.py qasm/test_sets/mqtbench_indep/ --name fig2a_val --max_qubits 20 --log_vector
bash experiments/fig2a_val/run_all.sh
python3 scripts/process_results.py experiments/fig2a_val/ --compare_vecs

python3 scripts/generate_sim_experiments.py qasm/test_sets/ketgpt/ --name fig2b_val --max_qubits 20 --log_vector
bash experiments/fig2b_val/run_all.sh
python3 scripts/process_results.py experiments/fig2b_val/ --compare_vecs


# Figure 3
printf "\n\nFigure 3\n"
python3 scripts/generate_sim_experiments.py qasm/test_sets/mqtbench_indep/ --name fig3_left --max_qubits 50 --workers 1 8 64
bash experiments/fig3_left/run_qsylvan.sh
python3 scripts/process_results.py experiments/fig3_left/

python3 scripts/generate_sim_experiments.py qasm/test_sets/ketgpt/ --name fig3_right --workers 1 8 64
bash experiments/fig3_right/run_qsylvan.sh
python3 scripts/process_results.py experiments/fig3_right/

# Table 1
printf "\n\nTable 1\n"
python3 scripts/generate_eqcheck_experiments.py qasm/test_sets/equivalence/ --name tab1 --workers 1 8
bash experiments/tab1/run_all.sh
python3 scripts/process_results.py experiments/tab1


# Table 2 (appendix)
printf "\n\nTable 2 (appendix)\n"
python3 scripts/generate_sim_experiments.py qasm/test_sets/mqtbench_ibm/ --name tab2 --nqubits 8 16 32 --tools q-sylvan mqt quasimodo
bash experiments/tab2/run_all.sh
python3 scripts/process_results.py experiments/tab2/


# Table 1 + 3,4,5,6 in appendix
printf "\n\nTable 3 + 4 + 5 + 6\n"
python3 scripts/generate_eqcheck_experiments.py qasm/test_sets/equivalence/ --name tabs_eqcheck
bash experiments/tabs_eqcheck/run_all.sh
python3 scripts/process_results.py experiments/tabs_eqcheck
