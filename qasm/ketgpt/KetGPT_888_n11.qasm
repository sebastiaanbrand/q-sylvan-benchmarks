OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
qreg psi[1];
creg meas[10];
creg c[10];
h q[0];
h q[1];
h q[1];
h q[2];
h q[3];
h q[4];
h q[4];
h q[5];
h q[6];
h q[6];
h q[7];
h q[8];
h q[9];
cz q[8],q[9];
h q[9];
cz q[8],q[9];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
cz q[8],q[9];
h q[9];
h q[9];
cz q[8],q[9];
h q[9];
cz q[8],q[9];
cz q[8],q[9];
x psi[0];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
h q[5];
u2(-pi,-pi) q[8];
h q[0];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
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
cp(-pi/4) q[2],q[0];
cp(-pi/2) q[2],q[1];
h q[2];
h q[3];
cz q[2],q[3];
h q[4];
x psi[0];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
h q[9];
cp(pi/2) q[9],q[8];
h q[8];
h q[9];
cz q[8],q[9];
u2(-pi,-pi) q[8];
cp(pi/2) q[5],q[4];
h q[4];
cp(-pi/4) q[5],q[3];
cp(-pi/2) q[5],q[4];
h q[5];
cp(-pi/4) q[5],q[3];
cp(-pi/2) q[5],q[4];
h q[5];
cz q[8],q[9];
x psi[0];
x psi[0];
x psi[0];
x psi[0];
cp(-pi/2) q[5],q[4];
h q[5];
cz q[4],q[5];
x psi[0];
cp(-pi/2) q[5],q[4];
h q[5];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
x psi[0];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
h q[5];
cp(-pi/4) q[5],q[3];
cp(-pi/2) q[5],q[4];
h q[5];
u2(0,0) q[9];
h q[1];
cp(-pi/4) q[2],q[0];
cp(-pi/2) q[2],q[1];
h q[2];
cp(pi/2) q[6],q[5];
h q[5];
cp(pi/4) q[2],q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
x psi[0];
h q[0];
cp(-pi/4) q[2],q[0];
cp(-pi/2) q[2],q[1];
h q[2];
cp(-pi/8) q[3],q[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
x psi[0];
cp(-pi/4) q[2],q[0];
cp(-pi/2) q[2],q[1];
h q[2];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
h q[1];
h q[2];
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
x psi[0];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
h q[1];
cp(-pi/4) q[2],q[0];
cp(-pi/2) q[2],q[1];
h q[2];
cp(-pi/8) q[3],q[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
h q[4];
x psi[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
x psi[0];
cp(pi/4) q[4],q[2];
cp(pi/2) q[3],q[2];
h q[2];
cp(-pi/8) q[3],q[0];
cp(-pi/4) q[3],q[1];
cp(-pi/2) q[3],q[2];
h q[3];
x psi[0];
cp(pi/4) q[4],q[2];
cp(pi/2) q[3],q[2];
h q[2];
h q[0];
cp(-pi/2) q[5],q[4];
h q[5];
h q[6];
h q[1];
x psi[0];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
x psi[0];
x psi[0];
x psi[0];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
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
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[0];
x psi[0];
x psi[0];
h q[0];
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
cz q[5],q[6];
h q[7];
cp(pi/8) q[9],q[6];
cp(pi/4) q[8],q[6];
cp(pi/2) q[7],q[6];
h q[6];
x psi[0];
h q[9];
cp(-pi/2) q[8],q[7];
