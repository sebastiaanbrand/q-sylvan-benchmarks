// Used Gate Set: ['rz', 'sx', 'x', 'cx', 'measure']
OPENQASM 2.0;
include "qelib1.inc";
qreg q[15];
qreg psi[1];
rz(pi/2) q[0];
rx(0.5*pi) q[0];
rz(pi/2) q[0];
rz(pi/2) q[1];
rx(0.5*pi) q[1];
rz(pi/2) q[1];
rz(pi/2) q[2];
rx(0.5*pi) q[2];
rz(pi/2) q[2];
rz(pi/2) q[3];
rx(0.5*pi) q[3];
rz(pi/2) q[3];
rz(pi/2) q[4];
rx(0.5*pi) q[4];
rz(pi/2) q[4];
rz(pi/2) q[5];
rx(0.5*pi) q[5];
rz(pi/2) q[5];
rz(pi/2) q[6];
rx(0.5*pi) q[6];
rz(pi/2) q[6];
rz(pi/2) q[7];
rx(0.5*pi) q[7];
rz(pi/2) q[7];
rz(pi/2) q[8];
rx(0.5*pi) q[8];
rz(pi/2) q[8];
rz(pi/2) q[9];
rx(0.5*pi) q[9];
rz(pi/2) q[9];
rz(pi/2) q[10];
rx(0.5*pi) q[10];
rz(pi/2) q[10];
rz(pi/2) q[11];
rx(0.5*pi) q[11];
rz(pi/2) q[11];
rz(pi/2) q[12];
rx(0.5*pi) q[12];
rz(pi/2) q[12];
rz(pi/2) q[13];
rx(0.5*pi) q[13];
rz(pi/2) q[13];
rz(pi/2) q[14];
rx(0.5*pi) q[14];
rz(pi/2) q[14];
x psi[0];
rz(-1.346499573466243) psi[0];
cx psi[0],q[0];
rz(1.346499573466243) q[0];
cx psi[0],q[0];
rz(0.4485935066573072) psi[0];
cx psi[0],q[1];
rz(-1.346499573466243) q[0];
rz(-0.4485935066573072) q[1];
cx psi[0],q[1];
rz(0.8971870133146144) psi[0];
cx psi[0],q[2];
rz(0.4485935066573072) q[1];
rz(-0.8971870133146144) q[2];
cx psi[0],q[2];
rz(-1.3472186269605644) psi[0];
cx psi[0],q[3];
rz(0.8971870133146144) q[2];
rz(1.3472186269605644) q[3];
cx psi[0],q[3];
rz(0.4471553996686644) psi[0];
cx psi[0],q[4];
rz(-1.3472186269605644) q[3];
rz(-0.4471553996686644) q[4];
cx psi[0],q[4];
rz(0.8943107993373288) psi[0];
cx psi[0],q[5];
rz(0.4471553996686644) q[4];
rz(-0.8943107993373288) q[5];
cx psi[0],q[5];
rz(-1.3529710549151355) psi[0];
cx psi[0],q[6];
rz(0.8943107993373288) q[5];
rz(1.3529710549151355) q[6];
cx psi[0],q[6];
rz(0.4356505437595221) psi[0];
cx psi[0],q[7];
rz(-1.3529710549151355) q[6];
rz(-0.4356505437595221) q[7];
cx psi[0],q[7];
rz(0.8713010875190442) psi[0];
cx psi[0],q[8];
rz(0.4356505437595221) q[7];
rz(-pi/256) q[7];
rz(-0.8713010875190442) q[8];
cx psi[0],q[8];
rz(-1.3989904785517047) psi[0];
cx psi[0],q[9];
rz(0.8713010875190442) q[8];
cx q[6],q[8];
cx q[8],q[6];
cx q[6],q[8];
rz(-pi/128) q[6];
rz(-pi/512) q[8];
rz(1.3989904785517047) q[9];
cx psi[0],q[9];
rz(0.3436116964863836) psi[0];
cx psi[0],q[10];
rz(-0.3436116964863836) q[10];
cx psi[0],q[10];
rz(0.6872233929727672) psi[0];
cx psi[0],q[11];
rz(0.3436116964863836) q[10];
rz(-0.6872233929727672) q[11];
cx psi[0],q[11];
rz(7*pi/16) psi[0];
cx psi[0],q[12];
rz(0.6872233929727672) q[11];
rz(-7*pi/16) q[12];
cx psi[0],q[12];
rz(-pi/8) psi[0];
cx psi[0],q[13];
rz(7*pi/16) q[12];
rz(pi/8) q[13];
cx psi[0],q[13];
rz(-pi/4) psi[0];
cx psi[0],q[14];
rz(-pi/8) q[13];
cx q[1],q[13];
cx q[13],q[1];
cx q[1],q[13];
rz(-pi/4) q[1];
rz(-pi/16384) q[13];
rz(pi/4) q[14];
cx psi[0],q[14];
rz(-pi/4) q[14];
cx q[0],q[14];
cx q[14],q[0];
cx q[0],q[14];
rz(pi/2) q[0];
rx(0.5*pi) q[0];
rz(pi/2) q[0];
cx q[1],q[0];
rz(pi/4) q[0];
cx q[1],q[0];
rz(-pi/4) q[0];
rz(pi/2) q[1];
rx(0.5*pi) q[1];
rz(pi/2) q[1];
rz(-pi/32768) q[14];
cx q[2],q[12];
cx q[12],q[2];
cx q[2],q[12];
rz(-pi/8192) q[12];
rz(-pi/8) q[2];
cx q[2],q[0];
rz(pi/8) q[0];
cx q[2],q[0];
rz(-pi/8) q[0];
rz(-pi/4) q[2];
cx q[2],q[1];
rz(pi/4) q[1];
cx q[2],q[1];
rz(-pi/4) q[1];
rz(pi/2) q[2];
rx(0.5*pi) q[2];
rz(pi/2) q[2];
cx q[3],q[11];
cx q[11],q[3];
cx q[3],q[11];
rz(-pi/4096) q[11];
rz(-pi/16) q[3];
cx q[3],q[0];
rz(pi/16) q[0];
cx q[3],q[0];
rz(-pi/16) q[0];
rz(-pi/8) q[3];
cx q[3],q[1];
rz(pi/8) q[1];
cx q[3],q[1];
rz(-pi/8) q[1];
rz(-pi/4) q[3];
cx q[3],q[2];
rz(pi/4) q[2];
cx q[3],q[2];
rz(-pi/4) q[2];
rz(pi/2) q[3];
rx(0.5*pi) q[3];
rz(pi/2) q[3];
cx q[4],q[10];
cx q[10],q[4];
cx q[4],q[10];
rz(-pi/2048) q[10];
rz(-pi/32) q[4];
cx q[4],q[0];
rz(pi/32) q[0];
cx q[4],q[0];
rz(-pi/32) q[0];
rz(-pi/16) q[4];
cx q[4],q[1];
rz(pi/16) q[1];
cx q[4],q[1];
rz(-pi/16) q[1];
rz(-pi/8) q[4];
cx q[4],q[2];
rz(pi/8) q[2];
cx q[4],q[2];
rz(-pi/8) q[2];
rz(-pi/4) q[4];
cx q[4],q[3];
rz(pi/4) q[3];
cx q[4],q[3];
rz(-pi/4) q[3];
rz(pi/2) q[4];
rx(0.5*pi) q[4];
rz(pi/2) q[4];
rz(-1.3989904785517047) q[9];
cx q[5],q[9];
cx q[9],q[5];
cx q[5],q[9];
rz(-pi/64) q[5];
cx q[5],q[0];
rz(pi/64) q[0];
cx q[5],q[0];
rz(-pi/64) q[0];
rz(-pi/32) q[5];
cx q[5],q[1];
rz(pi/32) q[1];
cx q[5],q[1];
rz(-pi/32) q[1];
rz(-pi/16) q[5];
cx q[5],q[2];
rz(pi/16) q[2];
cx q[5],q[2];
rz(-pi/16) q[2];
rz(-pi/8) q[5];
cx q[5],q[3];
rz(pi/8) q[3];
cx q[5],q[3];
rz(-pi/8) q[3];
rz(-pi/4) q[5];
cx q[5],q[4];
rz(pi/4) q[4];
cx q[5],q[4];
rz(-pi/4) q[4];
rz(pi/2) q[5];
rx(0.5*pi) q[5];
rz(pi/2) q[5];
cx q[6],q[0];
rz(pi/128) q[0];
cx q[6],q[0];
rz(-pi/128) q[0];
rz(-pi/64) q[6];
cx q[6],q[1];
rz(pi/64) q[1];
cx q[6],q[1];
rz(-pi/64) q[1];
rz(-pi/32) q[6];
cx q[6],q[2];
rz(pi/32) q[2];
cx q[6],q[2];
rz(-pi/32) q[2];
rz(-pi/16) q[6];
cx q[6],q[3];
rz(pi/16) q[3];
cx q[6],q[3];
rz(-pi/16) q[3];
rz(-pi/8) q[6];
cx q[6],q[4];
rz(pi/8) q[4];
cx q[6],q[4];
rz(-pi/8) q[4];
rz(-pi/4) q[6];
cx q[6],q[5];
rz(pi/4) q[5];
cx q[6],q[5];
rz(-pi/4) q[5];
rz(pi/2) q[6];
rx(0.5*pi) q[6];
rz(pi/2) q[6];
cx q[7],q[0];
rz(pi/256) q[0];
cx q[7],q[0];
rz(-pi/256) q[0];
rz(-pi/128) q[7];
cx q[7],q[1];
rz(pi/128) q[1];
cx q[7],q[1];
rz(-pi/128) q[1];
rz(-pi/64) q[7];
cx q[7],q[2];
rz(pi/64) q[2];
cx q[7],q[2];
rz(-pi/64) q[2];
rz(-pi/32) q[7];
cx q[7],q[3];
rz(pi/32) q[3];
cx q[7],q[3];
rz(-pi/32) q[3];
rz(-pi/16) q[7];
cx q[7],q[4];
rz(pi/16) q[4];
cx q[7],q[4];
rz(-pi/16) q[4];
rz(-pi/8) q[7];
cx q[7],q[5];
rz(pi/8) q[5];
cx q[7],q[5];
rz(-pi/8) q[5];
rz(-pi/4) q[7];
cx q[7],q[6];
rz(pi/4) q[6];
cx q[7],q[6];
rz(-pi/4) q[6];
rz(pi/2) q[7];
rx(0.5*pi) q[7];
rz(pi/2) q[7];
cx q[8],q[0];
rz(pi/512) q[0];
cx q[8],q[0];
rz(-pi/512) q[0];
rz(-pi/256) q[8];
cx q[8],q[1];
rz(pi/256) q[1];
cx q[8],q[1];
rz(-pi/256) q[1];
rz(-pi/128) q[8];
cx q[8],q[2];
rz(pi/128) q[2];
cx q[8],q[2];
rz(-pi/128) q[2];
rz(-pi/64) q[8];
cx q[8],q[3];
rz(pi/64) q[3];
cx q[8],q[3];
rz(-pi/64) q[3];
rz(-pi/32) q[8];
cx q[8],q[4];
rz(pi/32) q[4];
cx q[8],q[4];
rz(-pi/32) q[4];
rz(-pi/16) q[8];
cx q[8],q[5];
rz(pi/16) q[5];
cx q[8],q[5];
rz(-pi/16) q[5];
rz(-pi/8) q[8];
cx q[8],q[6];
rz(pi/8) q[6];
cx q[8],q[6];
rz(-pi/8) q[6];
rz(-pi/4) q[8];
cx q[8],q[7];
rz(pi/4) q[7];
cx q[8],q[7];
rz(-pi/4) q[7];
rz(pi/2) q[8];
rx(0.5*pi) q[8];
rz(pi/2) q[8];
rz(-pi/1024) q[9];
cx q[9],q[0];
rz(pi/1024) q[0];
cx q[9],q[0];
rz(-pi/1024) q[0];
cx q[10],q[0];
rz(pi/2048) q[0];
cx q[10],q[0];
rz(-pi/2048) q[0];
rz(-pi/1024) q[10];
cx q[11],q[0];
rz(pi/4096) q[0];
cx q[11],q[0];
rz(-pi/4096) q[0];
rz(-pi/2048) q[11];
cx q[12],q[0];
rz(pi/8192) q[0];
cx q[12],q[0];
rz(-pi/8192) q[0];
rz(-pi/4096) q[12];
cx q[13],q[0];
rz(pi/16384) q[0];
cx q[13],q[0];
rz(-pi/16384) q[0];
rz(-pi/8192) q[13];
cx q[14],q[0];
rz(pi/32768) q[0];
cx q[14],q[0];
rz(-pi/32768) q[0];
rz(-pi/16384) q[14];
rz(-pi/512) q[9];
cx q[9],q[1];
rz(pi/512) q[1];
cx q[9],q[1];
rz(-pi/512) q[1];
cx q[10],q[1];
rz(pi/1024) q[1];
cx q[10],q[1];
rz(-pi/1024) q[1];
rz(-pi/512) q[10];
cx q[11],q[1];
rz(pi/2048) q[1];
cx q[11],q[1];
rz(-pi/2048) q[1];
rz(-pi/1024) q[11];
cx q[12],q[1];
rz(pi/4096) q[1];
cx q[12],q[1];
rz(-pi/4096) q[1];
rz(-pi/2048) q[12];
cx q[13],q[1];
rz(pi/8192) q[1];
cx q[13],q[1];
rz(-pi/8192) q[1];
rz(-pi/4096) q[13];
cx q[14],q[1];
rz(pi/16384) q[1];
cx q[14],q[1];
rz(-pi/16384) q[1];
rz(-pi/8192) q[14];
rz(-pi/256) q[9];
cx q[9],q[2];
rz(pi/256) q[2];
cx q[9],q[2];
rz(-pi/256) q[2];
cx q[10],q[2];
rz(pi/512) q[2];
cx q[10],q[2];
rz(-pi/256) q[10];
rz(-pi/512) q[2];
cx q[11],q[2];
rz(pi/1024) q[2];
cx q[11],q[2];
rz(-pi/512) q[11];
rz(-pi/1024) q[2];
cx q[12],q[2];
rz(pi/2048) q[2];
cx q[12],q[2];
rz(-pi/1024) q[12];
rz(-pi/2048) q[2];
cx q[13],q[2];
rz(pi/4096) q[2];
cx q[13],q[2];
rz(-pi/2048) q[13];
rz(-pi/4096) q[2];
cx q[14],q[2];
rz(pi/8192) q[2];
cx q[14],q[2];
rz(-pi/4096) q[14];
rz(-pi/8192) q[2];
rz(-pi/128) q[9];
cx q[9],q[3];
rz(pi/128) q[3];
cx q[9],q[3];
rz(-pi/128) q[3];
cx q[10],q[3];
rz(pi/256) q[3];
cx q[10],q[3];
rz(-pi/128) q[10];
rz(-pi/256) q[3];
cx q[11],q[3];
rz(pi/512) q[3];
cx q[11],q[3];
rz(-pi/256) q[11];
rz(-pi/512) q[3];
cx q[12],q[3];
rz(pi/1024) q[3];
cx q[12],q[3];
rz(-pi/512) q[12];
rz(-pi/1024) q[3];
cx q[13],q[3];
rz(pi/2048) q[3];
cx q[13],q[3];
rz(-pi/1024) q[13];
rz(-pi/2048) q[3];
cx q[14],q[3];
rz(pi/4096) q[3];
cx q[14],q[3];
rz(-pi/2048) q[14];
rz(-pi/4096) q[3];
rz(-pi/64) q[9];
cx q[9],q[4];
rz(pi/64) q[4];
cx q[9],q[4];
rz(-pi/64) q[4];
cx q[10],q[4];
rz(pi/128) q[4];
cx q[10],q[4];
rz(-pi/64) q[10];
rz(-pi/128) q[4];
cx q[11],q[4];
rz(pi/256) q[4];
cx q[11],q[4];
rz(-pi/128) q[11];
rz(-pi/256) q[4];
cx q[12],q[4];
rz(pi/512) q[4];
cx q[12],q[4];
rz(-pi/256) q[12];
rz(-pi/512) q[4];
cx q[13],q[4];
rz(pi/1024) q[4];
cx q[13],q[4];
rz(-pi/512) q[13];
rz(-pi/1024) q[4];
cx q[14],q[4];
rz(pi/2048) q[4];
cx q[14],q[4];
rz(-pi/1024) q[14];
rz(-pi/2048) q[4];
rz(-pi/32) q[9];
cx q[9],q[5];
rz(pi/32) q[5];
cx q[9],q[5];
rz(-pi/32) q[5];
cx q[10],q[5];
rz(pi/64) q[5];
cx q[10],q[5];
rz(-pi/32) q[10];
rz(-pi/64) q[5];
cx q[11],q[5];
rz(pi/128) q[5];
cx q[11],q[5];
rz(-pi/64) q[11];
rz(-pi/128) q[5];
cx q[12],q[5];
rz(pi/256) q[5];
cx q[12],q[5];
rz(-pi/128) q[12];
rz(-pi/256) q[5];
cx q[13],q[5];
rz(pi/512) q[5];
cx q[13],q[5];
rz(-pi/256) q[13];
rz(-pi/512) q[5];
cx q[14],q[5];
rz(pi/1024) q[5];
cx q[14],q[5];
rz(-pi/512) q[14];
rz(-pi/1024) q[5];
rz(-pi/16) q[9];
cx q[9],q[6];
rz(pi/16) q[6];
cx q[9],q[6];
rz(-pi/16) q[6];
cx q[10],q[6];
rz(pi/32) q[6];
cx q[10],q[6];
rz(-pi/16) q[10];
rz(-pi/32) q[6];
cx q[11],q[6];
rz(pi/64) q[6];
cx q[11],q[6];
rz(-pi/32) q[11];
rz(-pi/64) q[6];
cx q[12],q[6];
rz(pi/128) q[6];
cx q[12],q[6];
rz(-pi/64) q[12];
rz(-pi/128) q[6];
cx q[13],q[6];
rz(pi/256) q[6];
cx q[13],q[6];
rz(-pi/128) q[13];
rz(-pi/256) q[6];
cx q[14],q[6];
rz(pi/512) q[6];
cx q[14],q[6];
rz(-pi/256) q[14];
rz(-pi/512) q[6];
rz(-pi/8) q[9];
cx q[9],q[7];
rz(pi/8) q[7];
cx q[9],q[7];
rz(-pi/8) q[7];
cx q[10],q[7];
rz(pi/16) q[7];
cx q[10],q[7];
rz(-pi/8) q[10];
rz(-pi/16) q[7];
cx q[11],q[7];
rz(pi/32) q[7];
cx q[11],q[7];
rz(-pi/16) q[11];
rz(-pi/32) q[7];
cx q[12],q[7];
rz(pi/64) q[7];
cx q[12],q[7];
rz(-pi/32) q[12];
rz(-pi/64) q[7];
cx q[13],q[7];
rz(pi/128) q[7];
cx q[13],q[7];
rz(-pi/64) q[13];
rz(-pi/128) q[7];
cx q[14],q[7];
rz(pi/256) q[7];
cx q[14],q[7];
rz(-pi/128) q[14];
rz(-pi/256) q[7];
rz(-pi/4) q[9];
cx q[9],q[8];
rz(pi/4) q[8];
cx q[9],q[8];
rz(-pi/4) q[8];
cx q[10],q[8];
rz(pi/8) q[8];
cx q[10],q[8];
rz(-pi/4) q[10];
rz(-pi/8) q[8];
cx q[11],q[8];
rz(pi/16) q[8];
cx q[11],q[8];
rz(-pi/8) q[11];
rz(-pi/16) q[8];
cx q[12],q[8];
rz(pi/32) q[8];
cx q[12],q[8];
rz(-pi/16) q[12];
rz(-pi/32) q[8];
cx q[13],q[8];
rz(pi/64) q[8];
cx q[13],q[8];
rz(-pi/32) q[13];
rz(-pi/64) q[8];
cx q[14],q[8];
rz(pi/128) q[8];
cx q[14],q[8];
rz(-pi/64) q[14];
rz(-pi/128) q[8];
rz(pi/2) q[9];
rx(0.5*pi) q[9];
rz(pi/2) q[9];
cx q[10],q[9];
rz(pi/4) q[9];
cx q[10],q[9];
rz(pi/2) q[10];
rx(0.5*pi) q[10];
rz(pi/2) q[10];
rz(-pi/4) q[9];
cx q[11],q[9];
rz(pi/8) q[9];
cx q[11],q[9];
rz(-pi/4) q[11];
cx q[11],q[10];
rz(pi/4) q[10];
cx q[11],q[10];
rz(-pi/4) q[10];
rz(pi/2) q[11];
rx(0.5*pi) q[11];
rz(pi/2) q[11];
rz(-pi/8) q[9];
cx q[12],q[9];
rz(pi/16) q[9];
cx q[12],q[9];
rz(-pi/8) q[12];
cx q[12],q[10];
rz(pi/8) q[10];
cx q[12],q[10];
rz(-pi/8) q[10];
rz(-pi/4) q[12];
cx q[12],q[11];
rz(pi/4) q[11];
cx q[12],q[11];
rz(-pi/4) q[11];
rz(pi/2) q[12];
rx(0.5*pi) q[12];
rz(pi/2) q[12];
rz(-pi/16) q[9];
cx q[13],q[9];
rz(pi/32) q[9];
cx q[13],q[9];
rz(-pi/16) q[13];
cx q[13],q[10];
rz(pi/16) q[10];
cx q[13],q[10];
rz(-pi/16) q[10];
rz(-pi/8) q[13];
cx q[13],q[11];
rz(pi/8) q[11];
cx q[13],q[11];
rz(-pi/8) q[11];
rz(-pi/4) q[13];
cx q[13],q[12];
rz(pi/4) q[12];
cx q[13],q[12];
rz(-pi/4) q[12];
rz(pi/2) q[13];
rx(0.5*pi) q[13];
rz(pi/2) q[13];
rz(-pi/32) q[9];
cx q[14],q[9];
rz(pi/64) q[9];
cx q[14],q[9];
rz(-pi/32) q[14];
cx q[14],q[10];
rz(pi/32) q[10];
cx q[14],q[10];
rz(-pi/32) q[10];
rz(-pi/16) q[14];
cx q[14],q[11];
rz(pi/16) q[11];
cx q[14],q[11];
rz(-pi/16) q[11];
rz(-pi/8) q[14];
cx q[14],q[12];
rz(pi/8) q[12];
cx q[14],q[12];
rz(-pi/8) q[12];
rz(-pi/4) q[14];
cx q[14],q[13];
rz(pi/4) q[13];
cx q[14],q[13];
rz(-pi/4) q[13];
rz(pi/2) q[14];
rx(0.5*pi) q[14];
rz(pi/2) q[14];
rz(-pi/64) q[9];