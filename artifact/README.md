# ATVA'25 Artifact: Q-Sylvan: A Parallel Decision Diagram Package for Quantum Computing

**Sebastiaan Brand and Alfons Laarman** - Leiden University

# Quickstart

## Requirements

The following software is required for running this artifact:

- [docker](https://docs.docker.com/get-docker/)

In the following we use `#` to indicate commands that are run inside the Docker container, and `$` to indicate commands that are run in the host shell.

## Setup Steps
- Install Docker as described at https://docs.docker.com/get-docker/.

- Download the artifact `atva24-artifact.zip `
  from https://zenodo.org/record/`<record>`

- Unzip the artifact:

  **Note:** This will unzip the artifact directory structure and files into the
  current working directory, including the compressed docker image
  `atva24-artifact-docker-image.tar.gz`.
  ```
  unzip atva24-artifact.zip
  ```

- Import the docker image from `atva24-artifact-docker-image.tar.gz`:

  sha256sum: `6bcf9be32cdee5d866e1ac405744f195a91a963001f627580cf530e44b79cc26`
  ```
  docker load --input atva24-artifact-docker-image.tar.gz
  ```
  This will import the docker image named `<image-name>`. This will take ~X
  minutes.

- Start a docker container:
  ```
  docker run -it <image-name>
  ```

  **Note** This will spin up a new docker container in which the following
  steps should be executed.

## Smoke Test Steps

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

# Available Bagde

The artifact was uploaded to Zenodo and is available at
https://zenodo.org/record/`<record>` (DOI: `xx.xxxx/zenodo.xxxxxxx`).

# Functional Badge

This section discusses the steps to reproduce the experimental results
shown in the paper.


## Artifact Directory Structure

**Comment** Example directory structure of the artifact. List all files in the
artifact and add a description for each one.

  - `Dockerfile`: The docker file to build the artifact image
  - `LICENSE`: Artifact license
  - `Readme.md`: This file
  - `paper.pdf`: An updated version of the submitted paper
  - Directory `dataset`
    - `dataset.tar.xz`: Archive containing all input files used for the
      evaluation
  - `<atva24-artifact-docker-image>.tar.gz`: The docker image to replicate the
    evaluation.
  - `logs/logs.tar.xz`: Archive containing all log files of the original
    evaluation runs from the paper.
  - `run-experiments.py`: Script to run evaluation
  - `tools/tools.tar.xz`: Archive containing all tools used in the evaluation
    evaluation. When unpacked it has the following structure:
    - `tool1`: Explain what tool1 is
    - ...

  - ...

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
Make sure to follow the setup steps to import the docker image before
continuing with this step.

```
docker run -it <image-name>
```

### 2. Execute Evaluation Runs

**Comment** List steps to replicate the evaluation runs in the paper.


### 3. Extract Numbers presented in the Paper

**Note**
To extract all benchmark results you can use 
```
$ docker cp qs-artifact:/artifact/q-sylvan-benchmarks/experiments/ .
```

#### 3.1 Extract Numbers for Figure 1

```
<command to generate Fig. 1>
```

**Output**
<details>
  <summary>Click to expand</summary>

```
Results for Figure 1.
```
</details>

#### 3.2 Generate Table 2

```
<command to generate Table 2>
```

**Output**
<details>
  <summary>Click to expand</summary>

```
Table 2.
```
</details>

# Reusable Badge

**Comment** This section should describe how to build the Docker image as well
as how to use the tool outside of the evaluation environment. If the tool has
a website and documentation it is also useful to include this in this section.

## Building the Docker Image

- Install Docker as described at https://docs.docker.com/get-docker/.

- The artifact contains all files to build the docker image from scratch as
  follows. In the base directory of the artifact execute the following command
  to generate the `atva24-artifact` Docker image.

  ```
  docker build -t atva2024-artifact .
  ```

- Use docker image as described in the "Functional Badge" section.

**Note**: The provided `Dockerfile` lists all dependencies required to set up
          the artifact without a Docker environment.

## Using our Tool without a Docker Environment

### Quickstart

#### Requirements
**Comment**: List requirements of the tool.


1. Instructions for downloading the tool
   ```
   ...
   ```

2. Instructions for setting up/building the tool
   ```
   ...
   ```

3. Instructions for running the tool on an example.
   ```
   ...
   ```
