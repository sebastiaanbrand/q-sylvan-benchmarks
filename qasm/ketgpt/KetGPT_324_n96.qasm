OPENQASM 2.0;
include "qelib1.inc";
qreg q[96];
creg c[78];
h q[1];
ry(-pi/4) q[0];
ry(-pi/3) q[2];
cx q[6],q[5];
cx q[5],q[4];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[2],q[1];
cx q[1],q[0];
h q[6];
h q[7];
cz q[6],q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
cz q[13],q[14];
h q[15];
h q[16];
cz q[15],q[16];
h q[17];
cz q[16],q[17];
h q[18];
h q[19];
h q[20];
h q[21];
h q[21];
cz q[20],q[21];
h q[22];
cz q[21],q[22];
h q[23];
cz q[22],q[23];
h q[21];
h q[22];
cz q[21],q[22];
h q[23];
h q[24];
h q[25];
h q[26];
h q[27];
h q[28];
h q[30];
h q[31];
h q[32];
h q[27];
h q[28];
h q[29];
h q[30];
cz q[29],q[30];
h q[31];
h q[32];
h q[32];
cz q[31],q[32];
h q[33];
h q[34];
u2(0,0) q[35];
h q[36];
h q[37];
h q[37];
h q[38];
cz q[37],q[38];
h q[39];
h q[40];
cz q[39],q[40];
h q[41];
h q[43];
u2(0,0) q[44];
h q[45];
h q[46];
h q[47];
h q[48];
u2(0,0) q[49];
h q[50];
u2(0,0) q[51];
u2(0,0) q[52];
u2(0,0) q[53];
h q[54];
u2(0,0) q[55];
h q[56];
u2(0,0) q[57];
u2(0,0) q[58];
h q[59];
u2(0,0) q[60];
h q[61];
h q[62];
u2(0,0) q[63];
h q[64];
h q[65];
h q[45];
h q[46];
h q[47];
h q[48];
u2(0,0) q[49];
h q[50];
u2(0,0) q[51];
u2(0,0) q[52];
u2(0,0) q[53];
h q[54];
h q[54];
u2(0,0) q[55];
h q[56];
h q[57];
h q[58];
h q[59];
u2(0,0) q[60];
h q[61];
h q[62];
cx q[1],q[0];
h q[61];
h q[71];
h q[69];
h q[70];
h q[71];
u2(0,0) q[72];
h q[70];
h q[71];
u2(0,0) q[72];
h q[73];
u2(0,0) q[74];
h q[62];
h q[56];
h q[26];
h q[27];
u2(0,0) q[28];
h q[29];
cz q[28],q[29];
h q[30];
cz q[29],q[30];
h q[31];
h q[32];
h q[33];
h q[34];
u2(0,0) q[35];