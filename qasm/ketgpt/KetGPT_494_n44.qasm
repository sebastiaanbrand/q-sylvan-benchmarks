OPENQASM 2.0;
include "qelib1.inc";
qreg q[44];
ry(-pi/4) q[0];
u2(0,0) q[0];
u2(0,0) q[1];
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
h q[22];
h q[23];
u2(0,0) q[24];
u2(0,0) q[25];
h q[26];
h q[27];
u2(0,0) q[28];
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
cp(-pi/32) q[20],q[15];
h q[2];
u2(0,0) q[3];
h q[4];
h q[37];
u2(0,0) q[38];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[10];
cp(-pi/4) q[11],q[9];
cp(-pi/2) q[11],q[10];
h q[11];
cp(-pi/8) q[12],q[9];
cp(-pi/4) q[12],q[10];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[14];
h q[15];
h q[16];
h q[17];
h q[18];
cz q[17],q[18];
h q[20];
h q[21];
h q[22];
h q[23];
cz q[22],q[23];
h q[24];
h q[25];
h q[26];
h q[27];
cz q[26],q[27];
h q[28];
cz q[27],q[28];
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
h q[23];
u2(0,0) q[24];
u2(0,0) q[25];
h q[26];
h q[27];
u2(0,0) q[28];
h q[29];
h q[30];
u2(0,0) q[31];
h q[32];
h q[33];
h q[34];
u2(0,0) q[35];
h q[4];
h q[37];
u2(0,0) q[38];
u2(0,0) q[39];
h q[43];
h q[43];
h q[31];
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
h q[27];
cz q[26],q[27];