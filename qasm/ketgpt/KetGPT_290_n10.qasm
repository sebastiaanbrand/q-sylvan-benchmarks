OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
qreg eval[3];
qreg psi[1];
qreg node[3];
creg meas[3];
creg c[3];
h q[0];
u2(0,0) q[0];
h q[2];
cz q[0],q[1];
h q[2];
cz q[1],q[2];
cz q[1],q[2];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[2],q[1];
h q[1];
h q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cx q[0],q[1];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
h q[2];
u2(-pi,-pi) q[0];
cp(pi/2) q[1],q[0];
h q[0];
cx eval[1],q[0];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
u2(-pi,-pi) q[0];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
h q[0];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[2],q[1];
h q[1];
h q[0];
u2(-pi,-pi) q[0];
cp(pi/2) q[2],q[1];
h q[1];
cp(-pi/2) eval[0],eval[1];
h eval[0];
cp(-pi/2) eval[1],eval[2];
h q[0];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
h q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
h eval[0];
h q[0];
cz q[1],q[0];
h eval[0];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
h q[0];
h q[2];
cp(-pi/2) eval[0],eval[1];
h eval[0];
h eval[0];
h eval[0];
u2(-pi,-pi) q[0];
cz q[1],q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[2];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[2],q[1];
h q[1];
cp(-pi/2) eval[1],eval[2];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
h eval[0];
h q[2];
cp(pi/2) q[2],q[1];
h q[1];
h eval[0];
h eval[0];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
h q[2];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cp(-pi/2) eval[1],eval[2];
h q[2];
cp(pi/2) q[2],q[1];
h q[1];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cz q[1],q[0];
x psi[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cp(-pi/2) eval[0],eval[1];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
h eval[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
h eval[0];
u2(-pi,-pi) q[1];
cp(pi/2) q[2],q[1];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[0];
h q[1];
h q[2];
h eval[0];
cx q[1],q[0];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
cp(pi/2) q[2],q[1];
h q[1];
h eval[0];
cp(pi/2) q[2],q[1];
h q[1];
h eval[0];
u2(-pi,-pi) q[0];
h q[0];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
x node[2];
h eval[2];
cp(-pi/2) eval[1],eval[2];
u2(-pi,-pi) q[0];
cp(-pi/2) eval[1],eval[2];
u2(-pi,-pi) q[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(-pi/2) eval[1],eval[2];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cx q[1],q[0];
cz q[1],q[0];
h eval[0];
h eval[0];
cp(pi/2) q[2],q[1];
h q[1];
cz q[1],q[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[2],q[1];
h q[1];
cp(pi/2) q[2],q[1];
h q[1];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[0];
cp(pi/2) q[1],q[0];
h q[0];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[1];
u2(-pi,-pi) q[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[1],q[0];
h q[0];
cp(-pi/2) eval[1],eval[2];
cp(pi/2) q[1],q[0];
h q[0];
u2(-pi,-pi) q[0];
cp(pi/2) q[1],q[0];
h q[0];
h q[0];
h eval[0];
h q[0];
h eval[0];
cp(pi/2) q[1],q[0];
h q[0];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
u2(-pi,-pi) q[0];
u2(-pi,-pi) q[1];
cp(pi/2) q[2],q[1];
h q[1];
h q[2];
u2(-pi,-pi) q[0];
cz q[1],q[0];
u2(-pi,-pi) q[0];