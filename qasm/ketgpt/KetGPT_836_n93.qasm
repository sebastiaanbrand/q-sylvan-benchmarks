OPENQASM 2.0;
include "qelib1.inc";
qreg q[83];
qreg eval[10];
creg meas[83];
creg c[80];
h q[1];
ry(-pi/4) q[0];
h q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
h q[20];
h q[21];
h q[22];
h q[23];
h q[27];
h q[26];
h q[26];
h q[27];
h q[30];
cz q[29],q[30];
h q[31];
h q[32];
cz q[31],q[32];
h q[33];
h q[34];
h q[34];
h q[35];
h q[35];
cz q[34],q[35];
h q[36];
h q[37];
h q[37];
h q[38];
cz q[37],q[38];
h q[39];
h q[39];
h q[40];
h q[46];
h q[48];
h q[49];
h q[50];
h q[51];
h q[50];
h q[52];
h q[52];
h q[53];
h q[56];
h q[57];
h q[58];
h q[60];
h q[61];
h q[58];
h q[55];
h q[50];
u2(0,0) q[51];
u2(0,0) q[52];
u2(0,0) q[53];
h q[54];
u2(0,0) q[55];
h q[56];
u2(0,0) q[57];
h q[65];
h q[59];
u2(0,0) q[60];
h q[61];
h q[62];
u2(0,0) q[63];
h q[64];
h q[65];
h q[66];
u2(0,0) q[67];
u2(0,0) q[68];
h q[69];
h q[70];
h q[71];
u2(0,0) q[72];
h q[73];
u2(0,0) q[74];
u2(0,0) q[75];
h q[76];
u2(0,0) q[77];
u2(0,0) q[78];
h q[79];
u2(0,0) q[80];
h q[81];
h q[82];
h q[70];
h q[70];
h q[71];
u2(0,0) q[72];
h q[73];
h q[59];
u2(0,0) q[60];
h q[61];
h q[62];
u2(0,0) q[63];
h q[64];
h q[65];
h q[66];
u2(0,0) q[67];
u2(0,0) q[68];
h q[70];
h q[61];
h q[62];
u2(0,0) q[63];
h q[64];
h q[65];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cp(pi/32) q[9],q[4];
cp(pi/16) q[8],q[4];
cp(pi/8) q[7],q[4];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
cp(pi/64) q[9],q[3];
cp(pi/32) q[8],q[3];
cp(pi/16) q[7],q[3];
cp(pi/8) q[6],q[3];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
cz q[2],q[3];
h q[4];
cp(pi/64) q[9],q[3];
cp(pi/32) q[8],q[3];
cp(pi/16) q[7],q[3];
cp(pi/8) q[6],q[3];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
cx q[11],q[12];
cx q[10],q[11];
h q[51];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cp(pi/32) q[9],q[4];
cp(pi/16) q[8],q[4];
cp(pi/8) q[7],q[4];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
cp(pi/64) q[9],q[3];
cp(pi/32) q[8],q[3];
cp(pi/16) q[7],q[3];
cp(pi/8) q[6],q[3];
cp(pi/4) q[5],q[3];
h q[28];
cz q[27],q[28];
h q[29];
h q[70];
h q[71];
u2(0,0) q[72];
cp(-pi/16) eval[5],eval[9];
cp(-pi/32) eval[4],eval[9];
cp(-pi/64) eval[3],eval[9];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
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
cp(-pi/4) q[13],q[11];
cp(-pi/2) q[13],q[12];
h q[13];
cp(-pi/32) q[14],q[9];
cp(-pi/16) q[14],q[10];
cp(-pi/8) q[14],q[11];
cp(-pi/4) q[14],q[12];
cp(-pi/2) q[14],q[13];
h q[14];
cp(-pi/64) q[15],q[9];
cp(-pi/32) q[15],q[10];
cp(-pi/16) q[15],q[11];
cp(-pi/8) q[15],q[12];
cp(-pi/4) q[15],q[13];
cp(-pi/2) q[15],q[14];
h q[15];
h q[16];
h q[17];
h q[18];
h q[19];
cp(-pi/32) q[20],q[15];
cp(-pi/16) q[20],q[16];
cp(-pi/8) q[20],q[17];
cx q[52],q[53];
cx q[51],q[52];
cx q[50],q[51];
cx q[49],q[50];
cx q[48],q[49];
cx q[47],q[48];
cx q[46],q[47];
cx q[45],q[46];
cx q[44],q[45];
cx q[43],q[44];
cx q[42],q[43];
cx q[41],q[42];
cx q[40],q[41];
cx q[39],q[40];
cx q[38],q[39];
cx q[37],q[38];
cx q[36],q[37];