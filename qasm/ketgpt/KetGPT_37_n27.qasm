OPENQASM 2.0;
include "qelib1.inc";
qreg q[17];
qreg eval[10];
creg meas[17];
creg c[17];
ry(-pi/4) q[0];
u2(2.0,-pi) q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(0,0) q[11];
cx q[1],q[2];
cx q[0],q[1];
cz q[6],q[5];
u2(-pi,-pi) q[6];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
h q[5];
cp(-pi/4) eval[7],eval[9];
cp(-pi/8) eval[6],eval[9];
cp(-pi/16) eval[5],eval[9];
h q[14];
h q[14];
h q[15];
cz q[14],q[15];
h q[16];
h q[16];
cz q[15],q[16];
h q[10];
cp(-pi/4) q[11],q[9];
cp(-pi/2) q[11],q[10];
h q[11];
cp(-pi/8) q[12],q[9];
cp(-pi/4) q[12],q[10];
cp(-pi/2) q[12],q[11];
h q[12];
cp(-pi/16) q[13],q[9];
cp(-pi/8) q[13],q[10];