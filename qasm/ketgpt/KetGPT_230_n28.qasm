OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
qreg eval[8];
creg c[20];
creg meas[20];
u2(0,0) q[0];
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
h q[19];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[0];
h q[19];
h q[2];
u2(-pi,-pi) q[3];
h q[18];
h q[19];
cz q[18],q[19];
h q[19];
h q[19];
h q[10];
cp(-pi/4) q[11],q[9];
h q[10];
h q[2];
u2(-pi,-pi) q[3];
h q[10];
cx q[9],q[8];
h q[16];
h q[17];
h q[18];
h q[19];
u2(-pi,-pi) q[3];
h q[4];
u2(0,0) q[5];
u2(-pi,-pi) q[15];
h q[19];
u2(-pi,-pi) q[15];
h q[18];
h q[19];
cz q[18],q[19];
h q[4];
u2(0,0) q[5];
h q[7];
cp(pi/8) q[9],q[6];
h q[13];
h q[14];
h q[15];
cz q[14],q[15];
h q[16];
h q[17];
h q[18];
h q[19];
u2(-pi,-pi) q[15];
u2(-pi,-pi) q[15];
u2(-pi,-pi) q[1];
h q[18];
h q[19];
cz q[18],q[19];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[8];
h q[18];
h q[19];
h q[19];
cz q[18],q[19];
h q[19];
h q[19];
h q[19];
h q[19];
h q[16];
u2(-pi,-pi) q[9];
h q[18];
cp(pi/8) q[11],q[8];
cp(pi/4) q[10],q[8];
h q[7];
cp(pi/8) q[9],q[6];
h q[13];
h q[13];
u2(-pi,-pi) q[9];
h q[19];
h q[19];
cp(-pi/2) q[12],q[11];
h q[12];
cp(-pi/16) q[13],q[9];
cp(-pi/8) q[13],q[10];
cp(-pi/4) q[13],q[11];
cp(-pi/2) q[13],q[12];
h q[13];
cz q[12],q[13];
h q[19];
u2(-pi,-pi) q[9];
u2(-pi,-pi) q[9];
cp(-pi/16) eval[3],eval[7];
cz q[2],q[5];
cp(-pi/8) q[18],q[15];
cp(-pi/4) q[18],q[16];
cp(-pi/2) q[18],q[17];
cz q[16],q[17];
h q[18];
cz q[17],q[18];
h q[4];
u2(0,0) q[5];
h q[16];
h q[17];
cz q[16],q[17];
h q[18];
cz q[17],q[18];
h q[19];
cz q[18],q[19];
u2(-pi,-pi) q[9];
h q[19];
h q[8];
h q[16];
h q[17];
cz q[16],q[17];
h q[18];
cz q[17],q[18];
h q[19];
cz q[18],q[19];
cx q[2],q[1];
cx q[1],q[0];
cp(-pi/8) q[6],q[3];
cp(-pi/4) q[6],q[4];
cp(-pi/2) q[6],q[5];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cp(-pi/16) q[11],q[7];
cp(-pi/2) q[9],q[8];
cp(-pi/4) q[10],q[8];
cp(-pi/8) q[11],q[8];
cp(-pi/16) q[12],q[8];
h q[18];
h q[19];
h q[12];
cp(-pi/16) q[13],q[9];
cp(-pi/8) q[13],q[10];
cp(-pi/4) q[13],q[11];
cp(-pi/2) q[13],q[12];
h q[13];
h q[14];
u2(0,0) q[15];
h q[16];
h q[19];
h q[19];
cz q[18],q[19];
h q[2];
cx q[1],q[0];
cp(-pi/8) q[6],q[3];
cp(-pi/4) q[6],q[4];
cp(-pi/2) q[6],q[5];
h q[6];
cp(pi/16) q[9],q[5];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
cx q[8],q[7];
cx q[7],q[6];
cx q[6],q[5];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[11];
h q[12];
cp(-pi/16) q[13],q[9];
cp(-pi/8) q[13],q[10];
cp(-pi/4) q[13],q[11];
cp(-pi/2) q[13],q[12];
h q[13];
cp(pi/4) q[15],q[13];
cp(pi/2) q[14],q[13];
h q[13];
u2(-pi,-pi) q[9];