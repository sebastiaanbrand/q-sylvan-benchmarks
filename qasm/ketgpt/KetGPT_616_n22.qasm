OPENQASM 2.0;
include "qelib1.inc";
qreg q[14];
qreg psi[1];
qreg eval[7];
creg meas[14];
u2(0,0) q[0];
h q[0];
h q[1];
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
cz q[12],q[13];
cz q[12],q[13];
cz q[12],q[13];
cz q[12],q[13];
h q[11];
cz q[10],q[11];
h q[12];
h q[13];
cz q[12],q[13];
h q[12];
h q[13];
cz q[12],q[13];
cx q[1],q[2];
cx q[0],q[1];
h q[13];
cz q[12],q[13];
cz q[12],q[13];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[2];
h q[3];
cz q[2],q[3];
h q[4];
u2(0,0) q[5];
h q[0];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cz q[10],q[11];
h q[12];
h q[13];
cz q[12],q[13];
cz q[12],q[13];
cp(-pi/4) q[9],q[7];
cp(-pi/8) q[10],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[8];
cz q[7],q[8];
h q[9];
cp(-pi/2) q[10],q[9];
h q[10];
cx q[9],q[8];
cx q[8],q[7];
cx q[7],q[6];
cx q[6],q[5];
cx q[5],q[4];
cx q[4],q[3];
cx q[3],q[2];
cp(-pi/4) q[9],q[7];
cp(-pi/8) q[10],q[7];
h q[12];
cz q[11],q[12];
h q[13];
cz q[12],q[13];
x psi[0];
cx q[1],q[3];
h q[13];
cz q[12],q[13];
cp(-pi/2) eval[5],eval[6];
cx q[1],q[2];
cx q[0],q[1];
cp(pi/8) q[6],q[3];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
