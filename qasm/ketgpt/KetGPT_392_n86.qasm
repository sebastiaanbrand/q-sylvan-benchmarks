OPENQASM 2.0;
include "qelib1.inc";
qreg q[72];
qreg eval[14];
creg meas[72];
creg c[18];
ry(-pi/4) q[0];
ry(-pi/4) q[0];
ry(-pi/3) q[2];
cx q[43],q[42];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];
h q[16];
h q[17];
h q[18];
h q[19];
h q[20];
h q[21];
h q[22];
h q[23];
h q[24];
h q[25];
h q[26];
h q[27];
h q[28];
h q[29];
h q[30];
h q[31];
h q[32];
h q[33];
h q[34];
h q[35];
h q[36];
h q[37];
h q[38];
h q[38];
h q[37];
h q[30];
cz q[29],q[30];
h q[31];
h q[32];
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
h q[43];
u2(0,0) q[44];
h q[45];
h q[45];
h q[46];
h q[43];
u2(0,0) q[44];
h q[45];
h q[46];
h q[47];
h q[48];
h q[51];
h q[48];
h q[49];
h q[50];
u2(0,0) q[51];
h q[41];
h q[42];
h q[47];
h q[48];
h q[14];
cz q[13],q[14];
h q[15];
u2(-pi,-pi) q[3];
cz q[27],q[26];
h q[50];
u2(0,0) q[51];
u2(0,0) q[52];
cp(-pi/8) eval[10],eval[13];
h eval[12];
cz q[25],q[24];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
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
cz q[15],q[16];
h q[17];
cx q[59],q[60];
cx q[58],q[59];
cx q[57],q[58];
cx q[56],q[57];
cx q[55],q[56];
cx q[54],q[55];
cx q[53],q[54];
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
cx q[35],q[36];
cx q[34],q[35];
cx q[33],q[34];
cx q[32],q[33];
cx q[31],q[32];
cx q[30],q[31];
cx q[29],q[30];
cx q[28],q[29];
cx q[27],q[28];
cx q[26],q[27];
cx q[25],q[26];
cx q[24],q[25];
cx q[23],q[24];
cx q[22],q[23];
cx q[21],q[22];
cx q[20],q[21];
cx q[19],q[20];
cx q[18],q[19];
cx q[17],q[18];
cx q[16],q[17];
cx q[15],q[16];
cx q[14],q[15];
cx q[13],q[14];
cx q[12],q[13];
cx q[11],q[12];
cx q[10],q[11];
h q[2];
h q[3];
cp(-pi/4) eval[4],eval[6];
cp(-pi/8) eval[3],eval[6];
cp(-pi/16) eval[2],eval[6];
cp(-pi/32) eval[1],eval[6];
cp(-pi/64) eval[0],eval[6];
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
cz q[13],q[14];
h q[15];
h q[16];
cz q[15],q[16];
h q[17];