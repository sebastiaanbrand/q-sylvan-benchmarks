// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// Qiskit version: 1.0.2

OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
creg meas[16];
h q[0];
h q[1];
cz q[0],q[1];
h q[2];
h q[3];
cz q[2],q[3];
h q[4];
h q[5];
cz q[4],q[5];
h q[6];
cz q[2],q[6];
h q[7];
cz q[0],q[7];
h q[8];
h q[9];
cz q[3],q[9];
cz q[8],q[9];
h q[10];
h q[11];
cz q[1],q[11];
cz q[10],q[11];
h q[12];
cz q[10],q[12];
h q[13];
cz q[5],q[13];
cz q[7],q[13];
h q[14];
cz q[4],q[14];
cz q[8],q[14];
h q[15];
cz q[6],q[15];
cz q[12],q[15];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];