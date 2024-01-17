# Q-Sylvan parallel benchmarks


## Simulating individual QASM files

### Q-Sylvan

```shell
$ ./extern/q-sylvan/build/qasm/sim_qasm <circuit.qasm> [--count-nodes]
```

### MQT-DDSIM

```shell
$ ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_file <circuit.qasm> --shots 1 --ps
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
