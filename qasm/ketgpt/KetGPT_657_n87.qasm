OPENQASM 2.0;
include "qelib1.inc";
qreg q[87];
creg meas[67];
ry(-pi/4) q[0];
ry(-pi/3) q[2];
h q[43];
h q[10];
cx q[9],q[8];
cx q[8],q[7];
cx q[7],q[6];
cx q[6],q[5];
cx q[5],q[4];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[13];
cx q[1],q[0];
