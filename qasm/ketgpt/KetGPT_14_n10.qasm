OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
creg meas[10];
h q[0];
ry(-pi/4) q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
h q[7];
h q[8];
h q[9];
cz q[8],q[9];
h q[9];
cz q[8],q[9];
cz q[8],q[9];
u2(-pi,-pi) q[8];
h q[9];
cz q[8],q[9];
cz q[8],q[9];
cz q[8],q[9];
cz q[8],q[9];
cz q[8],q[9];
u2(-pi,-pi) q[3];
cz q[8],q[9];
h q[1];
cz q[0],q[1];
h q[2];
cp(pi/4) q[3],q[1];
u2(-pi,-pi) q[3];
cz q[2],q[3];
h q[4];
h q[9];
cp(pi/2) q[9],q[8];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[8],q[9];
