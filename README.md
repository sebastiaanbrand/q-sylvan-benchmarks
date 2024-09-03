# Q-Sylvan parallel benchmarks

## 1. Installation

Basic build tools + specific dependencies.
```shell
$ sudo apt install build-essential cmake autoconf
$ sudo apt install libgmp-dev libmpfr-dev libmpc-dev zlib
```

Python libraries (creating a virtual environment is optional but recommended).
```shell
$ python -m venv .venv
$ source .venv/bin/activate
$ pip install -r requirements.txt
```

After installing the dependencies above, everything should compile with
```
$ ./compile_all.sh
```


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


## Benchmark sets
* [MQT Bench](https://www.cda.cit.tum.de/mqtbench/)
* [KetGPT](https://www.kaggle.com/datasets/boranapak/ketgpt-data)
* TODO: script for downloading qasm files automatically
