OPENQASM 2.0;
include "qelib1.inc";
qreg q[15];
qreg eval[1];
creg meas[15];
creg c[15];
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
h q[14];
u2(-pi,-pi) q[12];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[12];
u2(-pi,-pi) q[0];
h q[14];
u2(-pi,-pi) q[12];
u2(-pi,-pi) q[12];
u2(-pi,-pi) q[12];
h q[14];
u2(-pi,-pi) q[6];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[0];
h q[14];
cx q[1],q[2];
cx q[0],q[1];
h q[2];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[3];
h eval[0];
u2(-pi,-pi) q[0];
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
h q[13];
h q[14];
cz q[13],q[14];
h q[11];
cp(-pi/8) q[12],q[9];
cp(-pi/4) q[12],q[10];
cp(-pi/2) q[12],q[11];
h q[12];
h q[13];
h q[14];
cx q[1],q[2];
cx q[0],q[1];
h q[2];
h q[3];
h q[4];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[0];
cz q[1],q[0];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[1],q[2];
cx q[0],q[1];