OPENQASM 2.0;
include "qelib1.inc";
qreg q[37];
ry(-pi/4) q[0];
ry(-pi/4) q[0];
ry(-pi/3) q[2];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];
h q[16];
h q[17];
h q[22];
h q[23];
h q[23];
h q[26];
h q[26];
h q[27];
h q[27];
u2(0,0) q[28];
h q[29];
h q[30];
h q[29];
h q[30];
u2(0,0) q[31];
h q[32];
h q[33];
h q[34];
u2(0,0) q[35];
h q[34];
h q[35];