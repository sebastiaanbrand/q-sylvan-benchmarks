Benchmark QASM file generation with Classiq

## Requirements

* https://docs.classiq.io/latest/getting-started/python-sdk/
* https://pysathq.github.io/installation/ (only used for loading DIMACS CNF files)

```shell
python -m venv .venv
source .ven/bin/activate
pip install -r requirements.txt
```

Only needed once per device:
```shell
$ python
>>> import classiq
>>> classiq.authenticate()
```
