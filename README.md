# Q-Sylvan benchmarks

## 1. Installation

1. Clone this repository including its submodules.
```shell
$ git clone --recurse-submodules git@github.com:sebastiaanbrand/q-sylvan-benchmarks.git
```

2. Install basic build tools.
```shell
$ sudo apt install build-essential cmake autoconf
```

3. Install dependencies for various tools.
```shell
$ sudo apt install libgmp-dev libmpfr-dev libmpc-dev zlib1g-dev
```

4. Install Python libraries (creating a virtual environment is optional but recommended).
```shell
$ python -m venv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
```

5. After installing the dependencies above, everything can be compiled with
```shell
$ ./compile_all.sh
```

6. The benchmark files can be obtained with 
```shell
$ ./get_qasm.sh
```
**TODO:** Host these elsewhere than on Surf (maybe just include in repo?)


## 2. Running + plotting benchmarks

Generate bash file with:
```shell
$ python scripts/generate_experiments.py qasm <dir_with_qasm_files> --name output_dir_name
```

Run everything:
```shell
$ bash experiments/output_dir_name/run_all.sh
```

Generating plots (also runs sanity checks on output):
```shell
$ python scripgs/process_results.py experiments/output_dir_name/
```
