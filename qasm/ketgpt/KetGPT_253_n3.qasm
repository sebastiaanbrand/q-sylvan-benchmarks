OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
creg meas[3];
u2(0,0) q[0];
u2(0,0) q[0];
u2(0,0) q[1];
h q[2];
u2(0,0) q[1];
h q[2];
u2(-pi,-pi) q[1];
cx q[2],q[1];
cx q[1],q[0];
h q[2];
u2(-pi,-pi) q[1];
h q[0];
h q[2];
h q[2];
h q[2];
h q[0];
h q[1];
cx q[2],q[1];
cx q[1],q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
h q[0];
h q[0];
h q[1];
cx q[1],q[0];
u2(-pi,-pi) q[1];
u2(0,0) q[0];
cp(-pi/2) q[1],q[0];
h q[1];
u2(-pi,-pi) q[0];
cp(-pi/2) q[1],q[0];
h q[1];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cx q[0],q[1];
h q[0];
h q[1];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];