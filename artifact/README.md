# ATVA'25 Artifact: Q-Sylvan: A Parallel Decision Diagram Package for Quantum Computing

**Sebastiaan Brand and Alfons Laarman** - Leiden University



# Quickstart

## Requirements

Special hardware requirements:

- To replicate the 64 core parallel results (Fig. 3) a machine with 64 cores is required.
- At least 16 GB of RAM is required for most benchmarks.

The following software is required for running this artifact:

- [Docker](https://docs.docker.com/get-docker/)

In the following we use `#` to indicate commands that are run inside the Docker container, and `$` to indicate commands that are run in the host shell.

## Setup Steps
- Install Docker as described at https://docs.docker.com/get-docker/.

- Download the artifact `q-sylvan-atva25-artifact.zip` from http://doi.org/10.5281/zenodo.15303902

- Unzip the artifact:

  **Note:** This will unzip the artifact directory structure and files into the
  current working directory, including the compressed docker image
  `atva24-artifact-docker-image.tar.gz`.
  ```
  $ unzip q-sylvan-atva25-artifact.zip
  $ cd q-sylvan-atva25-artifact
  ```

- Import the Docker image from `atva24-artifact-docker-image.tar.gz`:

  sha256sum: `<todo>`
  ```
  $ docker load < q-sylvan-atva25-artifact-img.tar
  ```
  This will import the docker image named `q-sylvan-atva25-artifact-img`. This will take ~1
  minute.

- Start a Docker container from the image:
  ```
  $ docker run --name q-sylvan-atva25-artifact -it q-sylvan-atva25-artifact-img
  ```

- The container can be exited with
  ```
  # exit
  ```

- The container can be re-entered with
  ```
  $ docker start q-sylvan-atva25-artifact
  $ docker exec -it q-sylvan-atva25-artifact bash
  ```
  **Note** This will spin up a Docker container in which the following steps should be executed.




## Smoke Test Steps

The container should start in the `/artifact/q-sylvan-benchmarks/` directory. If not, the directory can be entered with
```
# cd /artifact/q-sylvan-benchmarks/
``` 

A small subset of benchmarks can be run with
```
# source .venv/bin/activate
# bash artifact/test_all_benchmarks.sh
```


**Output of Smoke Test Execution**
<details>
  <summary>Click to expand</summary>

```
Figure 1c (table data)
Writing to experiments/fig1c
Loading data from experiments/fig1c/
Checking norms...
    Out of 36 finished q-sylvan runs:
    1 instances where norm != 1.0
      - norm-low:       0/9(0%)
      - norm-max:       0/9(0%)
      - norm-min:       1/9(11%)
      - norm-L2:        0/9(0%)
    Writing details to experiments/fig1c/issues.txt
Writing instances with termination issues to experiments/fig1c/issues.txt
Writing plots to experiments/fig1c/plots
No concurrent data, skipping plot
No concurrent data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig1c/tables
No Quasimodo data, skipping table.


Figure 2
Writing to experiments/fig2a
Loading data from experiments/fig2a/
Checking norms... all OK
Writing instances with termination issues to experiments/fig2a/issues.txt
Writing plots to experiments/fig2a/plots
No concurrent data, skipping plot
No concurrent data, skipping plot
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig2a/tables
No Quasimodo data, skipping table.
Writing to experiments/fig5b
Loading data from experiments/fig5b/
Checking norms... all OK
Writing instances with termination issues to experiments/fig5b/issues.txt
Writing plots to experiments/fig5b/plots
No concurrent data, skipping plot
No concurrent data, skipping plot
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig5b/tables
No Quasimodo data, skipping table.


Figure 2 + validation
Writing to experiments/fig2a_val
Loading data from experiments/fig2a_val/
Checking norms... all OK
Comparing state vectors between both tools...
    Fidelity of all 9 checked vectors ~= 1.000.
Writing instances with termination issues to experiments/fig2a_val/issues.txt
Writing plots to experiments/fig2a_val/plots
No concurrent data, skipping plot
No concurrent data, skipping plot
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig2a_val/tables
No Quasimodo data, skipping table.
Writing to experiments/fig2b_val
Loading data from experiments/fig2b_val/
Checking norms... all OK
Comparing state vectors between both tools...
    Fidelity of all 2 checked vectors ~= 1.000.
Writing instances with termination issues to experiments/fig2b_val/issues.txt
Writing plots to experiments/fig2b_val/plots
No concurrent data, skipping plot
No concurrent data, skipping plot
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig2b_val/tables
No Quasimodo data, skipping table.


Figure 3
Writing to experiments/fig3_left
Loading data from experiments/fig3_left/
Checking norms... all OK
Writing instances with termination issues to experiments/fig3_left/issues.txt
Writing plots to experiments/fig3_left/plots
/artifact/q-sylvan-benchmarks/scripts/process_results_plot.py:101: UserWarning: Data has no positive values, and therefore cannot be log-scaled.
  ax.set_yscale(y_scale)
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig3_left/tables
No Quasimodo data, skipping table.
Writing to experiments/fig3_right
Loading data from experiments/fig3_right/
Checking norms... all OK
Writing instances with termination issues to experiments/fig3_right/issues.txt
Writing plots to experiments/fig3_right/plots
/artifact/q-sylvan-benchmarks/scripts/process_results_plot.py:101: UserWarning: Data has no positive values, and therefore cannot be log-scaled.
  ax.set_yscale(y_scale)
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/fig3_right/tables
No Quasimodo data, skipping table.


Table 2 (appendix)
Writing to experiments/tab2
Loading data from experiments/tab2/
Checking norms... all OK
Writing instances with termination issues to experiments/tab2/issues.txt
Writing plots to experiments/tab2/plots
No concurrent data, skipping plot
No concurrent data, skipping plot
No norm strat data, skipping plot
No inv caching data, skipping plot
No reorder data, skipping plot
Writing tables to experiments/tab2/tables


Table 1 + 3 + 4 + 5 + 6
Writing to experiments/tabs_eqcheck
Loading data from experiments/tabs_eqcheck
Checking circuit equivalence results... all OK
Writing instances with termination issues to experiments/tabs_eqcheck/issues.txt
Writing tables to experiments/tabs_eqcheck/tables
```
</details>


The following sections are intended for the full review phase.

---

# Available Badge

The artifact was uploaded to Zenodo and is available at http://doi.org/10.5281/zenodo.15303902.

# Functional Badge

This section discusses the steps to reproduce the experimental results
shown in the paper.


## Artifact Directory Structure

**Comment** Example directory structure of the artifact. List all files in the
artifact and add a description for each one.

  - `Dockerfile`: The Docker file to build the artifact image
  - `LICENSE`: Artifact license
  - `README.md`: This file
  - `paper.pdf`: An updated version of the submitted paper
  - `<todo>.tar.gz`: The Docker image to replicate the
    evaluation, which includes:
    - The repository https://github.com/sebastiaanbrand/q-sylvan-benchmarks
    - All prerequisites pre-installed.

## Steps to Replicate the Experimental Results

**Comment**
Describe experimental setup including the used resource limits and the used
hardware.
If the full set of experiments will not finish within **four hours** of
runtime, prepare a representative subset that will finish within **two hours**.
In this case, also **include the instructions for running the full experimental
evaluation**.

### 1. Start the Docker Container

**Note**
Make sure to follow the setup steps to import the Docker image and create a container before
continuing with this step (see "Quickstart").

```
$ docker start q-sylvan-atva25-artifact
$ docker exec -it q-sylvan-atva25-artifact bash
```


### 2. Execute Evaluation Runs

The container should start in the `/artifact/q-sylvan-benchmarks/` directory. If not, the directory can be entered with
```
# cd /artifact/q-sylvan-benchmarks/
``` 

The full benchmarks can be run with
```
# source .venv/bin/activate
# bash artifact/run_all_benchmarks.sh
```
This both runs the benchmarks and generates the plots.
Because the paper evaluates multiple tools over a large set of benchmarks, the total wall time of these benchmarks is 1~2 weeks.


### 3. Extract Numbers presented in the Paper

To extract all benchmark results and plots you can use 
```
$ docker cp qs-artifact:/artifact/q-sylvan-benchmarks/experiments/ .
```

The figures can be found in:
- Fig. 1c:
  - The values in the table in Fig. 1c are displayed in the terminal.
- Fig. 2: The plots can be found in
  - `experiments/fig5a/plots/png/mqt_vs_qsylvan1_log.png` (Fig. 2a)
  - `experiments/fig5b/plots/png/mqt_vs_qsylvan1_log.png` (Fig. 2b)
- Fig. 2 validation up to 20 qubits:
  - If both tools agree on the state vectors, the following is written to the terminal: `Fidelity of all # checked vectors ~= 1.000.` If there are issues with the state vectors they are written to `issues.txt` in the `fig2a/fig2b` directory.
- Fig. 3: The table data + plots can be found in
  - `experiments/fig3_left/speedups_summary.json` (table data Fig. 3a)
  - `experiments/fig3_right/speedups_summary.json` (table data Fig. 3a)
  - `experiments/fig2a/qubits_vs_nodes_qsylvan_max.png` (Fig 3b (re-uses data from Fig.2))
  - `experiments/fig2b/qubits_vs_nodes_qsylvan_max.png` (Fig 3c (re-uses data from Fig.2))
  - `experiments/fig3_left/multicore8_scatter_log.png` (Fig. 3d)
  - `experiments/fig3_right/multicore8_scatter_log.png` (Fig. 3e)
  - `experiments/fig3_left/multicore64_scatter_log.png` (Fig. 3f)
  - `experiments/fig3_right/multicore64_scatter_log.png` (Fig. 3g)
- Table 1
  - `experiments/tabs_eqcheck/summary.txt`
- Table 2 (Appendix)
  - `experiments/tab1/tables/simulation_time.tex`
- Table 3 + 4 (Appendix)
  - `experiments/tabs_eqcheck/tables/eqcheck_equiv_table_full.tex`
- Table 5 + 6 (Appendix)
  - `experiments/tabs_eqcheck/tables/eqcheck_nonequiv_table_full.tex`


# Reusable Badge

## Building the Docker Image

- Install Docker as described at https://docs.docker.com/get-docker/.

- The artifact contains all files to build the docker image from scratch as
  follows. In the base directory of the artifact execute the following command
  to generate the `q-sylvan-atva25-artifact-img` Docker image. This will take 5~10 minutes.

  ```
  $ docker build -t q-sylvan-atva25-artifact-img .
  $ docker image save q-sylvan-atva25-artifact-img:latest > q-sylvan-atva25-artifact-img.tar
  ```

- Use docker image as described in the "Functional Badge" section.

**Note**: The provided `Dockerfile` lists all dependencies required to set up
          the artifact without a Docker environment.

## Using our Tool without a Docker Environment

Instructions on how to use the tool without using the provided Docker image can be found in the README on the Q-Sylvan repository page at https://github.com/sebastiaanbrand/q-sylvan.
