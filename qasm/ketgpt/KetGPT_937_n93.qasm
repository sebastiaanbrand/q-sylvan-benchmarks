OPENQASM 2.0;
include "qelib1.inc";
qreg q[93];
creg meas[91];
h q[0];
h q[1];
cz q[0],q[1];
cz q[0],q[1];
h q[2];
h q[3];
cz q[2],q[3];
h q[4];
h q[5];
cz q[4],q[5];
h q[6];
h q[7];
cz q[6],q[7];
h q[8];
h q[9];
cz q[8],q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[13];
h q[14];
cz q[13],q[14];
h q[15];
h q[23];
h q[15];
h q[16];
h q[16];
h q[17];
cz q[16],q[17];
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
h q[27];
h q[28];
h q[29];
h q[29];
h q[30];
h q[30];
h q[31];
h q[32];
h q[33];
h q[34];
h q[35];
h q[36];
h q[37];
h q[38];
cz q[37],q[38];
h q[39];
h q[39];
h q[45];
h q[32];
h q[33];
h q[34];
h q[35];
h q[36];
h q[37];
h q[38];
cz q[37],q[38];
h q[39];
h q[40];
h q[47];
h q[48];
h q[45];
h q[46];
h q[47];
h q[48];
h q[48];
h q[46];
h q[47];
h q[48];
cx q[65],q[66];
cx q[64],q[65];
cx q[63],q[64];
cx q[62],q[63];
cx q[61],q[62];
cx q[60],q[61];
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