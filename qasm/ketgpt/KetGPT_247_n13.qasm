OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
qreg eval[5];
qreg psi[1];
creg c[7];
creg meas[7];
u2(0,0) q[0];
u2(0,0) q[1];
h q[2];
u2(0,0) q[3];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
u2(-pi,-pi) q[1];
h q[2];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
u2(-pi,-pi) q[6];
u2(0,0) q[6];
u2(-pi,-pi) q[5];
u2(-pi,-pi) q[5];
u2(-pi,-pi) q[0];
h q[0];
h q[0];
h q[1];
cz q[0],q[1];
cz q[0],q[1];
cz q[0],q[1];
h q[2];
cz q[2],q[3];
h q[4];
h q[3];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[3];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[6];
cx q[0],q[1];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[6];
u2(-pi,-pi) q[1];
u2(-pi,-pi) q[1];
u2(-pi,-pi) q[1];
u2(-pi,-pi) q[5];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
cz q[1],q[0];
ry(pi/4) q[0];
u2(-pi,-pi) q[5];
u2(-pi,-pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
u2(-pi,-pi) q[1];
cz q[1],q[0];
ry(pi/4) q[0];
cx q[4],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cz q[1],q[0];
ry(pi/4) q[0];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
h q[5];
h q[2];
h q[2];
h q[3];
cx q[0],q[1];
cx q[0],q[1];
cz q[1],q[5];
cx q[2],q[1];
cx q[1],q[0];
u2(0,0) q[1];
h q[2];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cz q[1],q[5];
cx q[0],q[1];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
h eval[1];
cx q[2],q[0];
h q[2];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[4];
h q[5];
cp(pi/4) q[2],q[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cp(pi/2) q[2],q[1];
h q[1];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
h q[4];
cp(-pi/4) eval[2],eval[4];
h q[2];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
h q[2];
h q[2];
h q[3];
cx q[0],q[1];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
h q[3];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[2];
h q[3];
u2(-pi,-pi) q[0];
ry(pi/3) q[2];
cz q[2],q[1];
u2(-pi,-pi) q[3];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
h q[6];
x psi[0];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
cx q[0],q[1];
u2(-pi,-pi) q[0];
cx q[1],q[2];
cx q[0],q[1];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
cx q[0],q[1];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
x psi[0];
cx q[1],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
cz q[4],q[5];
cx q[2],q[1];
cx q[1],q[0];
u2(-pi,-pi) q[0];
cp(pi/4) q[3],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[1];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cp(pi/4) q[2],q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cx q[1],q[2];
cx q[0],q[1];
h q[2];
u2(-pi,-pi) q[3];
cx q[0],q[1];
h q[2];
h q[3];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
h eval[1];
cp(-pi/2) eval[0],eval[1];
h eval[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cp(pi/2) q[3],q[2];
h q[2];
h q[3];
cz q[2],q[3];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
u2(0,0) q[3];
u2(-pi,-pi) q[5];
h q[1];
h q[2];
u2(-pi,-pi) q[0];
cp(-pi/2) q[2],q[1];
h q[2];
h q[3];
cz q[1],q[5];
h q[6];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[3];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
h q[4];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
h eval[1];
cp(-pi/2) eval[0],eval[1];
h eval[0];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
h q[4];
h q[5];
u2(-pi,-pi) q[0];
cz q[1],q[0];
ry(pi/4) q[0];
cx q[1],q[0];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
u2(-pi,-pi) q[0];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
h q[4];
h q[5];
h q[4];
u2(0,0) q[5];
h q[1];
h q[1];
cx q[0],q[3];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
h eval[1];
cp(-pi/2) eval[0],eval[1];
h eval[0];
cx q[0],q[1];
h q[2];
h q[3];
cx q[0],q[1];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
h eval[1];
cp(-pi/2) eval[0],eval[1];
h eval[0];
cx q[0],q[1];
cx q[0],q[1];
cx q[6],q[5];
cx q[5],q[4];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[4];
cz q[1],q[0];
ry(pi/4) q[0];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/4) eval[0],eval[2];
h eval[1];
cp(pi/2) q[3],q[2];
h q[2];
u2(-pi,-pi) q[3];
cx q[0],q[1];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
cp(pi/4) q[6],q[4];
cp(pi/2) q[5],q[4];
h q[4];
u2(0,0) q[5];
u2(0,0) q[6];
h q[4];
h q[4];
h q[4];
u2(0,0) q[5];
cx q[0],q[1];
cp(pi/4) q[5],q[3];
cp(pi/2) q[4],q[3];
h q[3];
cx q[6],q[5];
cx q[5],q[4];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[4];
h q[5];
cz q[4],q[5];
h q[6];
cx q[0],q[1];
cx q[0],q[1];
u2(-pi,-pi) q[0];
cx q[1],q[3];
cx q[0],q[1];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
h q[3];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
h q[6];
h eval[4];
cp(-pi/2) eval[3],eval[4];
cp(-pi/4) eval[2],eval[4];
x psi[0];
cx q[0],q[1];
cx q[4],q[3];
cx q[3],q[2];
cx q[2],q[1];
cx q[1],q[0];
cz q[1],q[0];
ry(pi/4) q[0];
h eval[0];
cx q[0],q[1];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
h q[5];
cz q[1],q[0];
ry(pi/4) q[0];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
h q[6];
cx q[0],q[1];
cx q[0],q[1];
cp(pi/2) q[6],q[5];
h q[5];
cx q[4],q[1];
cp(pi/2) q[1],q[0];
h q[0];
cp(pi/2) q[3],q[2];
h q[2];
u2(0,0) q[3];
cx q[2],q[1];
cx q[1],q[0];
cp(pi/2) q[3],q[2];
h q[2];
h q[2];
cp(pi/2) q[6],q[5];
h q[5];
cz q[4],q[5];
cp(pi/2) q[1],q[0];
h q[0];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
x psi[0];
h q[5];
x psi[0];
cp(pi/4) q[5],q[3];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
cx q[0],q[1];
cx q[1],q[2];
cx q[0],q[1];
h q[4];
h eval[0];
h eval[0];
x psi[0];
cp(pi/2) q[5],q[4];
h q[4];
cp(pi/2) q[6],q[5];
h q[5];
cx q[0],q[1];
h q[2];