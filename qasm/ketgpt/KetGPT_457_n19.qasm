OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
qreg eval[8];
qreg psi[1];
creg c[10];
creg meas[10];
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
h q[7];
u2(0,0) q[8];
u2(0,0) q[9];
u2(-pi,-pi) q[0];
cp(pi/8) q[7],q[4];
u2(-pi,-pi) q[1];
u2(-pi,-pi) q[1];
h q[9];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[3];
h q[7];
h q[2];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[5];
u2(-pi,-pi) q[8];
u2(-pi,-pi) q[5];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[8];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[4];
u2(0,0) q[5];
u2(-pi,-pi) q[8];
u2(-pi,-pi) q[9];
u2(-pi,-pi) q[9];
u2(-pi,-pi) q[8];
h q[4];
u2(0,0) q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[3];
cp(-pi/8) eval[1],eval[4];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[4];
u2(-pi,-pi) q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
h q[7];
cz q[6],q[7];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cz q[6],q[7];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[0];
h q[4];
h q[4];
h q[5];
cz q[4],q[5];
u2(-pi,-pi) q[8];
u2(-pi,-pi) q[8];
cx q[2],q[1];
cx q[1],q[0];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[2];
h q[2];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[1],q[2];
cx q[0],q[1];
u2(-pi,-pi) q[8];
cx q[1],q[2];
cx q[0],q[1];
u2(-pi,-pi) q[0];
ry(pi/3) q[2];
cz q[2],q[1];
h q[9];
cz q[8],q[9];
cz q[8],q[9];
u2(-pi,-pi) q[8];
u2(-pi,-pi) q[8];
cp(-pi/4) eval[1],eval[3];
cp(-pi/8) eval[0],eval[3];
h eval[2];
cx q[2],q[1];
cx q[1],q[0];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cx q[0],q[1];
u2(-pi,-pi) q[0];
cp(pi/8) q[7],q[4];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
h q[5];
h q[6];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
h q[2];
h q[3];
u2(-pi,-pi) q[8];
h q[2];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[1];
h q[0];
h q[1];
u2(-pi,-pi) q[8];
cx q[1],q[2];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[0];
cx q[2],q[1];
cx q[1],q[0];
cx q[1],q[2];
cx q[0],q[1];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
h q[4];
cp(pi/8) q[7],q[4];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
u2(-pi,-pi) q[3];
h eval[7];
cp(-pi/2) eval[6],eval[7];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[3];
cp(-pi/8) eval[1],eval[4];
h q[2];
u2(0,0) q[3];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
cp(-pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[4];
h q[1];
h q[2];
cz q[7],q[6];
h q[4];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cx q[2],q[1];
cx q[1],q[0];
h q[4];
u2(0,0) q[3];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[4];
cx q[0],q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cp(-pi/2) eval[2],eval[3];
cp(-pi/4) eval[1],eval[3];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[1],q[2];
cx q[0],q[1];
cz q[7],q[6];
h q[2];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[4];
h q[1];
cz q[0],q[1];
h q[2];
cp(pi/2) q[6],q[5];
h q[5];
h q[2];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[1],q[2];
cx q[0],q[1];
u2(-pi,-pi) q[6];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[2];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[1];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cz q[5],q[6];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
x psi[0];
x psi[0];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cp(pi/8) q[4],q[1];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[5];
u2(0,0) q[9];
cp(pi/2) q[5],q[4];
h q[4];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
x psi[0];
h q[4];
cp(pi/8) q[8],q[5];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
x psi[0];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cz q[5],q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cp(-pi/2) eval[0],eval[1];
h eval[0];
h q[1];
h q[1];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
h q[5];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
h q[8];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
x psi[0];
cp(pi/4) q[4],q[2];
cp(pi/2) q[3],q[2];
h q[2];
cp(pi/2) q[5],q[4];
h q[4];
cx eval[7],q[0];
h q[4];
cp(pi/2) q[2],q[1];
h q[1];
h q[1];
h q[2];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cz q[5],q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h eval[7];
cp(-pi/2) eval[6],eval[7];
cp(-pi/4) eval[5],eval[7];
cp(-pi/8) eval[4],eval[7];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cp(pi/2) q[6],q[5];
h q[5];
h q[1];
h q[1];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cp(pi/4) q[7],q[5];
cp(pi/2) q[6],q[5];
h q[5];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
cz q[5],q[6];
h q[8];
cp(pi/4) q[9],q[7];
cp(pi/2) q[8],q[7];
h q[7];