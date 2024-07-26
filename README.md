# Q-Sylvan parallel benchmarks


## Simulating individual QASM files

### Q-Sylvan

`--state-vector` adds the complete state vector to the JSON output.

```shell
$ ./tools/q-sylvan/build/qasm/run_qasm_on_qmdd <circuit.qasm> [--count-nodes]
```

### MQT-DDSIM

`--ps` outputs stats, `--pv` outputs the state vector, `--pm` prints the measurement result

```shell
$ ./tools/mqt-ddsim/build/apps/ddsim_simple --simulate_file <circuit.qasm> --shots 1 --ps
```

## Running + plotting benchmarks

Generate bash file with:
```shell
$ python scripts/generate_experiments.py qasm --qasm_dir <dir_with_qasm_files>
```

Run with either:
```shell
$ bash experiments/<exp_id>/run_qsylvan.sh
$ bash experiments/<exp_id>/run_mqt.sh
$ bash experiments/<exp_id>/run_all.sh
```

Plot:
```shell
$ python scripgs/generate_plots.py experiments/<exp_id>/
```


## Benchmark sets

* https://www.cda.cit.tum.de/mqtbench/
* https://github.com/pnnl/QASMBench
