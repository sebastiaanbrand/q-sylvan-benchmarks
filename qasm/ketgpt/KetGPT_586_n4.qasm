OPENQASM 2.0;
include "qelib1.inc";
qreg q[4];
creg c[4];
creg meas[4];
h q[0];
h q[1];
h q[2];
h q[3];
cz q[2],q[3];
h q[0];
h q[1];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
u2(-pi,-pi) q[1];
cp(-pi/2) q[2],q[1];
h q[2];
h q[3];
u2(-pi,-pi) q[0];
cx q[3],q[2];
cx q[2],q[1];