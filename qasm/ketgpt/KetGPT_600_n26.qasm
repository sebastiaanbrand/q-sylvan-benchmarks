OPENQASM 2.0;
include "qelib1.inc";
qreg q[26];
creg c[14];
ry(-pi/4) q[0];
ry(-pi/3) q[2];
h q[2];
u2(0,0) q[3];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
h q[7];
u2(0,0) q[8];
u2(0,0) q[9];
h q[10];
u2(0,0) q[11];
u2(0,0) q[12];
h q[13];
h q[14];
u2(0,0) q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
u2(0,0) q[21];
h q[20];
u2(0,0) q[21];
h q[22];
h q[23];
h q[19];
h q[20];
u2(0,0) q[21];
h q[22];
h q[23];
h q[24];
h q[2];
h q[3];
h q[22];
h q[23];
cz q[22],q[23];
h q[24];
cz q[23],q[24];
h q[25];
cz q[24],q[25];