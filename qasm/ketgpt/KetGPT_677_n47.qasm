OPENQASM 2.0;
include "qelib1.inc";
qreg q[47];
u2(0,0) q[0];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[3];
h q[7];
h q[8];
h q[9];
cz q[8],q[9];
h q[10];
h q[11];
h q[13];
h q[14];
h q[15];
cz q[14],q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
cz q[19],q[20];
h q[21];
h q[22];
h q[23];
h q[24];
h q[25];
h q[26];
h q[27];
h q[29];
h q[30];
u2(0,0) q[31];
h q[32];
h q[33];
h q[34];
u2(0,0) q[35];
u2(0,0) q[36];
h q[37];
u2(0,0) q[38];
u2(0,0) q[39];
u2(0,0) q[40];
u2(0,0) q[41];
u2(0,0) q[42];
h q[43];
u2(0,0) q[44];
h q[45];
h q[46];
h q[46];
h q[27];
h q[28];
cz q[27],q[28];
h q[29];
h q[30];
h q[31];
h q[32];
cz q[31],q[32];
h q[33];
h q[34];
h q[35];
h q[36];
h q[37];
h q[38];
h q[39];
h q[40];
h q[41];
h q[42];
h q[46];