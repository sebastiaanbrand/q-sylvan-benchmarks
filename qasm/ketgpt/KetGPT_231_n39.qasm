OPENQASM 2.0;
include "qelib1.inc";
qreg q[28];
qreg psi[1];
qreg eval[10];
creg meas[28];
creg c[28];
h q[0];
h q[1];
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
h q[13];
h q[14];
h q[15];
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
h q[27];
h q[27];
h q[25];
h q[26];
h q[27];
cz q[26],q[27];
x psi[0];
h q[19];
cz q[18],q[19];
h q[24];
h q[25];
h q[26];
h q[27];
h q[25];
h q[26];
h q[27];
cz q[26],q[27];
h q[27];
cz q[26],q[27];
x psi[0];
x psi[0];
h q[22];
h q[23];
h q[24];
h q[25];
h q[26];
h q[27];
h q[27];
cp(-pi/2) q[1],q[0];
h q[1];
h q[23];
cz q[22],q[23];
h q[2];
cp(-pi/8) q[3],q[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
cp(-pi/16) q[4],q[0];
cp(-pi/8) q[4],q[1];
cp(-pi/4) q[4],q[2];
cp(-pi/2) q[4],q[3];
h q[4];
cp(-pi/8) q[5],q[2];
cp(-pi/4) q[5],q[3];
cp(-pi/2) q[5],q[4];
h q[5];
h q[4];
h q[5];
h q[14];
cp(-pi/8) q[3],q[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
cp(-pi/16) q[4],q[0];
cp(-pi/8) q[4],q[1];
cp(-pi/4) q[4],q[2];
cp(-pi/2) q[4],q[3];
h q[4];
h q[4];
cp(-pi/4) q[5],q[3];
cp(-pi/2) q[5],q[4];
h q[5];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cp(-pi/8) q[3],q[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
cz q[2],q[3];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
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
h q[4];
h q[5];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
h q[13];
cz q[12],q[13];
h q[14];
cz q[13],q[14];
h q[15];
h q[16];
cz q[15],q[16];
h q[17];
h q[18];
cz q[17],q[18];
h q[19];
h q[20];
cz q[19],q[20];
h q[21];
cz q[20],q[21];
h q[22];
h q[23];
h q[24];
h q[25];
h q[26];
h q[27];
cz q[26],q[27];
h q[23];
h q[27];
cz q[26],q[27];
x psi[0];
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
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cp(-pi/8) eval[6],eval[9];
cp(-pi/16) eval[5],eval[9];
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
cz q[12],q[13];
h q[14];
u2(0,0) q[15];
h q[16];
h q[17];
h q[18];
cz q[6],q[7];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
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
cz q[4],q[5];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
u2(-pi,-pi) q[24];
cp(-pi/8) q[15],q[12];
cp(-pi/4) q[15],q[13];
cp(-pi/2) q[15],q[14];
h q[15];
h q[16];
h q[17];
cp(-pi/16) eval[3],eval[7];
h q[27];
cz q[26],q[27];
h q[23];
u2(0,0) q[24];
u2(0,0) q[25];
h q[26];
h q[27];
h q[15];
h q[16];
h q[4];
h q[4];
h q[14];
h q[15];
h q[16];
cz q[15],q[16];
h q[17];
h q[18];
h q[6];
