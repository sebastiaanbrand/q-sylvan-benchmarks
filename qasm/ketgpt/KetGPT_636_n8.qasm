OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
qreg coin[1];
qreg node[2];
qreg anc[1];
qreg eval[2];
creg meas[2];
creg c[2];
h q[0];
h q[1];
cz q[0],q[1];
cz q[0],q[1];
cz q[0],q[1];
rccx coin[0],node[1],anc[0];
cx eval[0],q[0];
x coin[0];
h eval[1];
h eval[0];
h eval[0];
h eval[1];
h eval[1];
h eval[0];
h eval[0];
h eval[0];
h eval[0];
h eval[0];
h q[0];
h eval[0];
h eval[0];
h eval[0];
cz q[1],q[0];
h eval[0];
cz q[1],q[0];
h eval[0];
h eval[0];
h eval[0];
cx eval[0],q[0];
h eval[0];
h eval[0];
cz q[1],q[0];
cz q[1],q[0];
h eval[0];
h eval[0];
h eval[0];
h eval[0];
h q[0];
h eval[0];
h eval[0];
h q[0];
h q[1];
