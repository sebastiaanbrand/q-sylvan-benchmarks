# Q-Sylvan parallel benchmarks


## Running mtq-ddsim algorithms

Adding `--ps` outputs JSON info.

* TODO: pipe to file and have Python script to get relevant info from all produced JSON files.

### Grover
```shell
$ ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_grover 20 --shot 1 --ps
```

* NOTE: looking at `mtq-core/src/algorithms/Grover.cpp`, their Grover implementation also implements the oracle naively/simply with an n-qubit CZ.
* NOTE: Grover is run with a random oracle, should also do this in the Q-Sylvan benchmarks


### Using QASM

* NOTE: this is probably the way to go to make sure the same circuit is simulated in both cases.

```shell
$ ./extern/mqt-ddsim/build/apps/ddsim_simple --simulate_file <circuit.qasm> --shots 1 --ps
```
