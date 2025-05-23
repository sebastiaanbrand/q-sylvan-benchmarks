// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// Qiskit version: 1.0.2
// Used Gate Set: ['id', 'rz', 'sx', 'x', 'cx', 'measure', 'barrier']

OPENQASM 2.0;
include "qelib1.inc";
qreg q[22];
creg meas[22];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
rz(2.0) q[0];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(2.0) q[1];
cx q[0],q[1];
rz(9.172838187819544) q[1];
cx q[0],q[1];
rz(pi/2) q[2];
sx q[2];
rz(pi/2) q[2];
rz(2.0) q[2];
cx q[0],q[2];
rz(9.172838187819544) q[2];
cx q[0],q[2];
cx q[1],q[2];
rz(9.172838187819544) q[2];
cx q[1],q[2];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(2.0) q[3];
cx q[0],q[3];
rz(9.172838187819544) q[3];
cx q[0],q[3];
cx q[1],q[3];
rz(9.172838187819544) q[3];
cx q[1],q[3];
cx q[2],q[3];
rz(9.172838187819544) q[3];
cx q[2],q[3];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
rz(2.0) q[4];
cx q[0],q[4];
rz(9.172838187819544) q[4];
cx q[0],q[4];
cx q[1],q[4];
rz(9.172838187819544) q[4];
cx q[1],q[4];
cx q[2],q[4];
rz(9.172838187819544) q[4];
cx q[2],q[4];
cx q[3],q[4];
rz(9.172838187819544) q[4];
cx q[3],q[4];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(2.0) q[5];
cx q[0],q[5];
rz(9.172838187819544) q[5];
cx q[0],q[5];
cx q[1],q[5];
rz(9.172838187819544) q[5];
cx q[1],q[5];
cx q[2],q[5];
rz(9.172838187819544) q[5];
cx q[2],q[5];
cx q[3],q[5];
rz(9.172838187819544) q[5];
cx q[3],q[5];
cx q[4],q[5];
rz(9.172838187819544) q[5];
cx q[4],q[5];
rz(pi/2) q[6];
sx q[6];
rz(pi/2) q[6];
rz(2.0) q[6];
cx q[0],q[6];
rz(9.172838187819544) q[6];
cx q[0],q[6];
cx q[1],q[6];
rz(9.172838187819544) q[6];
cx q[1],q[6];
cx q[2],q[6];
rz(9.172838187819544) q[6];
cx q[2],q[6];
cx q[3],q[6];
rz(9.172838187819544) q[6];
cx q[3],q[6];
cx q[4],q[6];
rz(9.172838187819544) q[6];
cx q[4],q[6];
cx q[5],q[6];
rz(9.172838187819544) q[6];
cx q[5],q[6];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(2.0) q[7];
cx q[0],q[7];
rz(9.172838187819544) q[7];
cx q[0],q[7];
cx q[1],q[7];
rz(9.172838187819544) q[7];
cx q[1],q[7];
cx q[2],q[7];
rz(9.172838187819544) q[7];
cx q[2],q[7];
cx q[3],q[7];
rz(9.172838187819544) q[7];
cx q[3],q[7];
cx q[4],q[7];
rz(9.172838187819544) q[7];
cx q[4],q[7];
cx q[5],q[7];
rz(9.172838187819544) q[7];
cx q[5],q[7];
cx q[6],q[7];
rz(9.172838187819544) q[7];
cx q[6],q[7];
rz(pi/2) q[8];
sx q[8];
rz(pi/2) q[8];
rz(2.0) q[8];
cx q[0],q[8];
rz(9.172838187819544) q[8];
cx q[0],q[8];
cx q[1],q[8];
rz(9.172838187819544) q[8];
cx q[1],q[8];
cx q[2],q[8];
rz(9.172838187819544) q[8];
cx q[2],q[8];
cx q[3],q[8];
rz(9.172838187819544) q[8];
cx q[3],q[8];
cx q[4],q[8];
rz(9.172838187819544) q[8];
cx q[4],q[8];
cx q[5],q[8];
rz(9.172838187819544) q[8];
cx q[5],q[8];
cx q[6],q[8];
rz(9.172838187819544) q[8];
cx q[6],q[8];
cx q[7],q[8];
rz(9.172838187819544) q[8];
cx q[7],q[8];
rz(pi/2) q[9];
sx q[9];
rz(pi/2) q[9];
rz(2.0) q[9];
cx q[0],q[9];
rz(9.172838187819544) q[9];
cx q[0],q[9];
cx q[1],q[9];
rz(9.172838187819544) q[9];
cx q[1],q[9];
cx q[2],q[9];
rz(9.172838187819544) q[9];
cx q[2],q[9];
cx q[3],q[9];
rz(9.172838187819544) q[9];
cx q[3],q[9];
cx q[4],q[9];
rz(9.172838187819544) q[9];
cx q[4],q[9];
cx q[5],q[9];
rz(9.172838187819544) q[9];
cx q[5],q[9];
cx q[6],q[9];
rz(9.172838187819544) q[9];
cx q[6],q[9];
cx q[7],q[9];
rz(9.172838187819544) q[9];
cx q[7],q[9];
cx q[8],q[9];
rz(9.172838187819544) q[9];
cx q[8],q[9];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
rz(2.0) q[10];
cx q[0],q[10];
rz(9.172838187819544) q[10];
cx q[0],q[10];
cx q[1],q[10];
rz(9.172838187819544) q[10];
cx q[1],q[10];
cx q[2],q[10];
rz(9.172838187819544) q[10];
cx q[2],q[10];
cx q[3],q[10];
rz(9.172838187819544) q[10];
cx q[3],q[10];
cx q[4],q[10];
rz(9.172838187819544) q[10];
cx q[4],q[10];
cx q[5],q[10];
rz(9.172838187819544) q[10];
cx q[5],q[10];
cx q[6],q[10];
rz(9.172838187819544) q[10];
cx q[6],q[10];
cx q[7],q[10];
rz(9.172838187819544) q[10];
cx q[7],q[10];
cx q[8],q[10];
rz(9.172838187819544) q[10];
cx q[8],q[10];
cx q[9],q[10];
rz(9.172838187819544) q[10];
cx q[9],q[10];
rz(pi/2) q[11];
sx q[11];
rz(pi/2) q[11];
rz(2.0) q[11];
cx q[0],q[11];
rz(9.172838187819544) q[11];
cx q[0],q[11];
cx q[1],q[11];
rz(9.172838187819544) q[11];
cx q[1],q[11];
cx q[2],q[11];
rz(9.172838187819544) q[11];
cx q[2],q[11];
cx q[3],q[11];
rz(9.172838187819544) q[11];
cx q[3],q[11];
cx q[4],q[11];
rz(9.172838187819544) q[11];
cx q[4],q[11];
cx q[5],q[11];
rz(9.172838187819544) q[11];
cx q[5],q[11];
cx q[6],q[11];
rz(9.172838187819544) q[11];
cx q[6],q[11];
cx q[7],q[11];
rz(9.172838187819544) q[11];
cx q[7],q[11];
cx q[8],q[11];
rz(9.172838187819544) q[11];
cx q[8],q[11];
cx q[9],q[11];
rz(9.172838187819544) q[11];
cx q[9],q[11];
cx q[10],q[11];
rz(9.172838187819544) q[11];
cx q[10],q[11];
rz(pi/2) q[12];
sx q[12];
rz(pi/2) q[12];
rz(2.0) q[12];
cx q[0],q[12];
rz(9.172838187819544) q[12];
cx q[0],q[12];
cx q[1],q[12];
rz(9.172838187819544) q[12];
cx q[1],q[12];
cx q[2],q[12];
rz(9.172838187819544) q[12];
cx q[2],q[12];
cx q[3],q[12];
rz(9.172838187819544) q[12];
cx q[3],q[12];
cx q[4],q[12];
rz(9.172838187819544) q[12];
cx q[4],q[12];
cx q[5],q[12];
rz(9.172838187819544) q[12];
cx q[5],q[12];
cx q[6],q[12];
rz(9.172838187819544) q[12];
cx q[6],q[12];
cx q[7],q[12];
rz(9.172838187819544) q[12];
cx q[7],q[12];
cx q[8],q[12];
rz(9.172838187819544) q[12];
cx q[8],q[12];
cx q[9],q[12];
rz(9.172838187819544) q[12];
cx q[9],q[12];
cx q[10],q[12];
rz(9.172838187819544) q[12];
cx q[10],q[12];
cx q[11],q[12];
rz(9.172838187819544) q[12];
cx q[11],q[12];
rz(pi/2) q[13];
sx q[13];
rz(pi/2) q[13];
rz(2.0) q[13];
cx q[0],q[13];
rz(9.172838187819544) q[13];
cx q[0],q[13];
cx q[1],q[13];
rz(9.172838187819544) q[13];
cx q[1],q[13];
cx q[2],q[13];
rz(9.172838187819544) q[13];
cx q[2],q[13];
cx q[3],q[13];
rz(9.172838187819544) q[13];
cx q[3],q[13];
cx q[4],q[13];
rz(9.172838187819544) q[13];
cx q[4],q[13];
cx q[5],q[13];
rz(9.172838187819544) q[13];
cx q[5],q[13];
cx q[6],q[13];
rz(9.172838187819544) q[13];
cx q[6],q[13];
cx q[7],q[13];
rz(9.172838187819544) q[13];
cx q[7],q[13];
cx q[8],q[13];
rz(9.172838187819544) q[13];
cx q[8],q[13];
cx q[9],q[13];
rz(9.172838187819544) q[13];
cx q[9],q[13];
cx q[10],q[13];
rz(9.172838187819544) q[13];
cx q[10],q[13];
cx q[11],q[13];
rz(9.172838187819544) q[13];
cx q[11],q[13];
cx q[12],q[13];
rz(9.172838187819544) q[13];
cx q[12],q[13];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(2.0) q[14];
cx q[0],q[14];
rz(9.172838187819544) q[14];
cx q[0],q[14];
cx q[1],q[14];
rz(9.172838187819544) q[14];
cx q[1],q[14];
cx q[2],q[14];
rz(9.172838187819544) q[14];
cx q[2],q[14];
cx q[3],q[14];
rz(9.172838187819544) q[14];
cx q[3],q[14];
cx q[4],q[14];
rz(9.172838187819544) q[14];
cx q[4],q[14];
cx q[5],q[14];
rz(9.172838187819544) q[14];
cx q[5],q[14];
cx q[6],q[14];
rz(9.172838187819544) q[14];
cx q[6],q[14];
cx q[7],q[14];
rz(9.172838187819544) q[14];
cx q[7],q[14];
cx q[8],q[14];
rz(9.172838187819544) q[14];
cx q[8],q[14];
cx q[9],q[14];
rz(9.172838187819544) q[14];
cx q[9],q[14];
cx q[10],q[14];
rz(9.172838187819544) q[14];
cx q[10],q[14];
cx q[11],q[14];
rz(9.172838187819544) q[14];
cx q[11],q[14];
cx q[12],q[14];
rz(9.172838187819544) q[14];
cx q[12],q[14];
cx q[13],q[14];
rz(9.172838187819544) q[14];
cx q[13],q[14];
rz(pi/2) q[15];
sx q[15];
rz(pi/2) q[15];
rz(2.0) q[15];
cx q[0],q[15];
rz(9.172838187819544) q[15];
cx q[0],q[15];
cx q[1],q[15];
rz(9.172838187819544) q[15];
cx q[1],q[15];
cx q[2],q[15];
rz(9.172838187819544) q[15];
cx q[2],q[15];
cx q[3],q[15];
rz(9.172838187819544) q[15];
cx q[3],q[15];
cx q[4],q[15];
rz(9.172838187819544) q[15];
cx q[4],q[15];
cx q[5],q[15];
rz(9.172838187819544) q[15];
cx q[5],q[15];
cx q[6],q[15];
rz(9.172838187819544) q[15];
cx q[6],q[15];
cx q[7],q[15];
rz(9.172838187819544) q[15];
cx q[7],q[15];
cx q[8],q[15];
rz(9.172838187819544) q[15];
cx q[8],q[15];
cx q[9],q[15];
rz(9.172838187819544) q[15];
cx q[9],q[15];
cx q[10],q[15];
rz(9.172838187819544) q[15];
cx q[10],q[15];
cx q[11],q[15];
rz(9.172838187819544) q[15];
cx q[11],q[15];
cx q[12],q[15];
rz(9.172838187819544) q[15];
cx q[12],q[15];
cx q[13],q[15];
rz(9.172838187819544) q[15];
cx q[13],q[15];
cx q[14],q[15];
rz(9.172838187819544) q[15];
cx q[14],q[15];
rz(pi/2) q[16];
sx q[16];
rz(pi/2) q[16];
rz(2.0) q[16];
cx q[0],q[16];
rz(9.172838187819544) q[16];
cx q[0],q[16];
cx q[1],q[16];
rz(9.172838187819544) q[16];
cx q[1],q[16];
cx q[2],q[16];
rz(9.172838187819544) q[16];
cx q[2],q[16];
cx q[3],q[16];
rz(9.172838187819544) q[16];
cx q[3],q[16];
cx q[4],q[16];
rz(9.172838187819544) q[16];
cx q[4],q[16];
cx q[5],q[16];
rz(9.172838187819544) q[16];
cx q[5],q[16];
cx q[6],q[16];
rz(9.172838187819544) q[16];
cx q[6],q[16];
cx q[7],q[16];
rz(9.172838187819544) q[16];
cx q[7],q[16];
cx q[8],q[16];
rz(9.172838187819544) q[16];
cx q[8],q[16];
cx q[9],q[16];
rz(9.172838187819544) q[16];
cx q[9],q[16];
cx q[10],q[16];
rz(9.172838187819544) q[16];
cx q[10],q[16];
cx q[11],q[16];
rz(9.172838187819544) q[16];
cx q[11],q[16];
cx q[12],q[16];
rz(9.172838187819544) q[16];
cx q[12],q[16];
cx q[13],q[16];
rz(9.172838187819544) q[16];
cx q[13],q[16];
cx q[14],q[16];
rz(9.172838187819544) q[16];
cx q[14],q[16];
cx q[15],q[16];
rz(9.172838187819544) q[16];
cx q[15],q[16];
rz(pi/2) q[17];
sx q[17];
rz(pi/2) q[17];
rz(2.0) q[17];
cx q[0],q[17];
rz(9.172838187819544) q[17];
cx q[0],q[17];
cx q[1],q[17];
rz(9.172838187819544) q[17];
cx q[1],q[17];
cx q[2],q[17];
rz(9.172838187819544) q[17];
cx q[2],q[17];
cx q[3],q[17];
rz(9.172838187819544) q[17];
cx q[3],q[17];
cx q[4],q[17];
rz(9.172838187819544) q[17];
cx q[4],q[17];
cx q[5],q[17];
rz(9.172838187819544) q[17];
cx q[5],q[17];
cx q[6],q[17];
rz(9.172838187819544) q[17];
cx q[6],q[17];
cx q[7],q[17];
rz(9.172838187819544) q[17];
cx q[7],q[17];
cx q[8],q[17];
rz(9.172838187819544) q[17];
cx q[8],q[17];
cx q[9],q[17];
rz(9.172838187819544) q[17];
cx q[9],q[17];
cx q[10],q[17];
rz(9.172838187819544) q[17];
cx q[10],q[17];
cx q[11],q[17];
rz(9.172838187819544) q[17];
cx q[11],q[17];
cx q[12],q[17];
rz(9.172838187819544) q[17];
cx q[12],q[17];
cx q[13],q[17];
rz(9.172838187819544) q[17];
cx q[13],q[17];
cx q[14],q[17];
rz(9.172838187819544) q[17];
cx q[14],q[17];
cx q[15],q[17];
rz(9.172838187819544) q[17];
cx q[15],q[17];
cx q[16],q[17];
rz(9.172838187819544) q[17];
cx q[16],q[17];
rz(pi/2) q[18];
sx q[18];
rz(pi/2) q[18];
rz(2.0) q[18];
cx q[0],q[18];
rz(9.172838187819544) q[18];
cx q[0],q[18];
cx q[1],q[18];
rz(9.172838187819544) q[18];
cx q[1],q[18];
cx q[2],q[18];
rz(9.172838187819544) q[18];
cx q[2],q[18];
cx q[3],q[18];
rz(9.172838187819544) q[18];
cx q[3],q[18];
cx q[4],q[18];
rz(9.172838187819544) q[18];
cx q[4],q[18];
cx q[5],q[18];
rz(9.172838187819544) q[18];
cx q[5],q[18];
cx q[6],q[18];
rz(9.172838187819544) q[18];
cx q[6],q[18];
cx q[7],q[18];
rz(9.172838187819544) q[18];
cx q[7],q[18];
cx q[8],q[18];
rz(9.172838187819544) q[18];
cx q[8],q[18];
cx q[9],q[18];
rz(9.172838187819544) q[18];
cx q[9],q[18];
cx q[10],q[18];
rz(9.172838187819544) q[18];
cx q[10],q[18];
cx q[11],q[18];
rz(9.172838187819544) q[18];
cx q[11],q[18];
cx q[12],q[18];
rz(9.172838187819544) q[18];
cx q[12],q[18];
cx q[13],q[18];
rz(9.172838187819544) q[18];
cx q[13],q[18];
cx q[14],q[18];
rz(9.172838187819544) q[18];
cx q[14],q[18];
cx q[15],q[18];
rz(9.172838187819544) q[18];
cx q[15],q[18];
cx q[16],q[18];
rz(9.172838187819544) q[18];
cx q[16],q[18];
cx q[17],q[18];
rz(9.172838187819544) q[18];
cx q[17],q[18];
rz(pi/2) q[19];
sx q[19];
rz(pi/2) q[19];
rz(2.0) q[19];
cx q[0],q[19];
rz(9.172838187819544) q[19];
cx q[0],q[19];
cx q[1],q[19];
rz(9.172838187819544) q[19];
cx q[1],q[19];
cx q[2],q[19];
rz(9.172838187819544) q[19];
cx q[2],q[19];
cx q[3],q[19];
rz(9.172838187819544) q[19];
cx q[3],q[19];
cx q[4],q[19];
rz(9.172838187819544) q[19];
cx q[4],q[19];
cx q[5],q[19];
rz(9.172838187819544) q[19];
cx q[5],q[19];
cx q[6],q[19];
rz(9.172838187819544) q[19];
cx q[6],q[19];
cx q[7],q[19];
rz(9.172838187819544) q[19];
cx q[7],q[19];
cx q[8],q[19];
rz(9.172838187819544) q[19];
cx q[8],q[19];
cx q[9],q[19];
rz(9.172838187819544) q[19];
cx q[9],q[19];
cx q[10],q[19];
rz(9.172838187819544) q[19];
cx q[10],q[19];
cx q[11],q[19];
rz(9.172838187819544) q[19];
cx q[11],q[19];
cx q[12],q[19];
rz(9.172838187819544) q[19];
cx q[12],q[19];
cx q[13],q[19];
rz(9.172838187819544) q[19];
cx q[13],q[19];
cx q[14],q[19];
rz(9.172838187819544) q[19];
cx q[14],q[19];
cx q[15],q[19];
rz(9.172838187819544) q[19];
cx q[15],q[19];
cx q[16],q[19];
rz(9.172838187819544) q[19];
cx q[16],q[19];
cx q[17],q[19];
rz(9.172838187819544) q[19];
cx q[17],q[19];
cx q[18],q[19];
rz(9.172838187819544) q[19];
cx q[18],q[19];
rz(pi/2) q[20];
sx q[20];
rz(pi/2) q[20];
rz(2.0) q[20];
cx q[0],q[20];
rz(9.172838187819544) q[20];
cx q[0],q[20];
cx q[1],q[20];
rz(9.172838187819544) q[20];
cx q[1],q[20];
cx q[2],q[20];
rz(9.172838187819544) q[20];
cx q[2],q[20];
cx q[3],q[20];
rz(9.172838187819544) q[20];
cx q[3],q[20];
cx q[4],q[20];
rz(9.172838187819544) q[20];
cx q[4],q[20];
cx q[5],q[20];
rz(9.172838187819544) q[20];
cx q[5],q[20];
cx q[6],q[20];
rz(9.172838187819544) q[20];
cx q[6],q[20];
cx q[7],q[20];
rz(9.172838187819544) q[20];
cx q[7],q[20];
cx q[8],q[20];
rz(9.172838187819544) q[20];
cx q[8],q[20];
cx q[9],q[20];
rz(9.172838187819544) q[20];
cx q[9],q[20];
cx q[10],q[20];
rz(9.172838187819544) q[20];
cx q[10],q[20];
cx q[11],q[20];
rz(9.172838187819544) q[20];
cx q[11],q[20];
cx q[12],q[20];
rz(9.172838187819544) q[20];
cx q[12],q[20];
cx q[13],q[20];
rz(9.172838187819544) q[20];
cx q[13],q[20];
cx q[14],q[20];
rz(9.172838187819544) q[20];
cx q[14],q[20];
cx q[15],q[20];
rz(9.172838187819544) q[20];
cx q[15],q[20];
cx q[16],q[20];
rz(9.172838187819544) q[20];
cx q[16],q[20];
cx q[17],q[20];
rz(9.172838187819544) q[20];
cx q[17],q[20];
cx q[18],q[20];
rz(9.172838187819544) q[20];
cx q[18],q[20];
cx q[19],q[20];
rz(9.172838187819544) q[20];
cx q[19],q[20];
rz(pi/2) q[21];
sx q[21];
rz(pi/2) q[21];
rz(2.0) q[21];
cx q[0],q[21];
rz(9.172838187819544) q[21];
cx q[0],q[21];
rz(pi/2) q[0];
sx q[0];
rz(pi/2) q[0];
rz(2.0) q[0];
cx q[1],q[21];
rz(9.172838187819544) q[21];
cx q[1],q[21];
rz(pi/2) q[1];
sx q[1];
rz(pi/2) q[1];
rz(2.0) q[1];
cx q[0],q[1];
rz(9.172838187819544) q[1];
cx q[0],q[1];
cx q[2],q[21];
rz(9.172838187819544) q[21];
cx q[2],q[21];
rz(pi/2) q[2];
sx q[2];
rz(pi/2) q[2];
rz(2.0) q[2];
cx q[0],q[2];
rz(9.172838187819544) q[2];
cx q[0],q[2];
cx q[1],q[2];
rz(9.172838187819544) q[2];
cx q[1],q[2];
cx q[3],q[21];
rz(9.172838187819544) q[21];
cx q[3],q[21];
rz(pi/2) q[3];
sx q[3];
rz(pi/2) q[3];
rz(2.0) q[3];
cx q[0],q[3];
rz(9.172838187819544) q[3];
cx q[0],q[3];
cx q[1],q[3];
rz(9.172838187819544) q[3];
cx q[1],q[3];
cx q[2],q[3];
rz(9.172838187819544) q[3];
cx q[2],q[3];
cx q[4],q[21];
rz(9.172838187819544) q[21];
cx q[4],q[21];
rz(pi/2) q[4];
sx q[4];
rz(pi/2) q[4];
rz(2.0) q[4];
cx q[0],q[4];
rz(9.172838187819544) q[4];
cx q[0],q[4];
cx q[1],q[4];
rz(9.172838187819544) q[4];
cx q[1],q[4];
cx q[2],q[4];
rz(9.172838187819544) q[4];
cx q[2],q[4];
cx q[3],q[4];
rz(9.172838187819544) q[4];
cx q[3],q[4];
cx q[5],q[21];
rz(9.172838187819544) q[21];
cx q[5],q[21];
rz(pi/2) q[5];
sx q[5];
rz(pi/2) q[5];
rz(2.0) q[5];
cx q[0],q[5];
rz(9.172838187819544) q[5];
cx q[0],q[5];
cx q[1],q[5];
rz(9.172838187819544) q[5];
cx q[1],q[5];
cx q[2],q[5];
rz(9.172838187819544) q[5];
cx q[2],q[5];
cx q[3],q[5];
rz(9.172838187819544) q[5];
cx q[3],q[5];
cx q[4],q[5];
rz(9.172838187819544) q[5];
cx q[4],q[5];
cx q[6],q[21];
rz(9.172838187819544) q[21];
cx q[6],q[21];
rz(pi/2) q[6];
sx q[6];
rz(pi/2) q[6];
rz(2.0) q[6];
cx q[0],q[6];
rz(9.172838187819544) q[6];
cx q[0],q[6];
cx q[1],q[6];
rz(9.172838187819544) q[6];
cx q[1],q[6];
cx q[2],q[6];
rz(9.172838187819544) q[6];
cx q[2],q[6];
cx q[3],q[6];
rz(9.172838187819544) q[6];
cx q[3],q[6];
cx q[4],q[6];
rz(9.172838187819544) q[6];
cx q[4],q[6];
cx q[5],q[6];
rz(9.172838187819544) q[6];
cx q[5],q[6];
cx q[7],q[21];
rz(9.172838187819544) q[21];
cx q[7],q[21];
rz(pi/2) q[7];
sx q[7];
rz(pi/2) q[7];
rz(2.0) q[7];
cx q[0],q[7];
rz(9.172838187819544) q[7];
cx q[0],q[7];
cx q[1],q[7];
rz(9.172838187819544) q[7];
cx q[1],q[7];
cx q[2],q[7];
rz(9.172838187819544) q[7];
cx q[2],q[7];
cx q[3],q[7];
rz(9.172838187819544) q[7];
cx q[3],q[7];
cx q[4],q[7];
rz(9.172838187819544) q[7];
cx q[4],q[7];
cx q[5],q[7];
rz(9.172838187819544) q[7];
cx q[5],q[7];
cx q[6],q[7];
rz(9.172838187819544) q[7];
cx q[6],q[7];
cx q[8],q[21];
rz(9.172838187819544) q[21];
cx q[8],q[21];
rz(pi/2) q[8];
sx q[8];
rz(pi/2) q[8];
rz(2.0) q[8];
cx q[0],q[8];
rz(9.172838187819544) q[8];
cx q[0],q[8];
cx q[1],q[8];
rz(9.172838187819544) q[8];
cx q[1],q[8];
cx q[2],q[8];
rz(9.172838187819544) q[8];
cx q[2],q[8];
cx q[3],q[8];
rz(9.172838187819544) q[8];
cx q[3],q[8];
cx q[4],q[8];
rz(9.172838187819544) q[8];
cx q[4],q[8];
cx q[5],q[8];
rz(9.172838187819544) q[8];
cx q[5],q[8];
cx q[6],q[8];
rz(9.172838187819544) q[8];
cx q[6],q[8];
cx q[7],q[8];
rz(9.172838187819544) q[8];
cx q[7],q[8];
cx q[9],q[21];
rz(9.172838187819544) q[21];
cx q[9],q[21];
rz(pi/2) q[9];
sx q[9];
rz(pi/2) q[9];
rz(2.0) q[9];
cx q[0],q[9];
rz(9.172838187819544) q[9];
cx q[0],q[9];
cx q[1],q[9];
rz(9.172838187819544) q[9];
cx q[1],q[9];
cx q[2],q[9];
rz(9.172838187819544) q[9];
cx q[2],q[9];
cx q[3],q[9];
rz(9.172838187819544) q[9];
cx q[3],q[9];
cx q[4],q[9];
rz(9.172838187819544) q[9];
cx q[4],q[9];
cx q[5],q[9];
rz(9.172838187819544) q[9];
cx q[5],q[9];
cx q[6],q[9];
rz(9.172838187819544) q[9];
cx q[6],q[9];
cx q[7],q[9];
rz(9.172838187819544) q[9];
cx q[7],q[9];
cx q[8],q[9];
rz(9.172838187819544) q[9];
cx q[8],q[9];
cx q[10],q[21];
rz(9.172838187819544) q[21];
cx q[10],q[21];
rz(pi/2) q[10];
sx q[10];
rz(pi/2) q[10];
rz(2.0) q[10];
cx q[0],q[10];
rz(9.172838187819544) q[10];
cx q[0],q[10];
cx q[1],q[10];
rz(9.172838187819544) q[10];
cx q[1],q[10];
cx q[2],q[10];
rz(9.172838187819544) q[10];
cx q[2],q[10];
cx q[3],q[10];
rz(9.172838187819544) q[10];
cx q[3],q[10];
cx q[4],q[10];
rz(9.172838187819544) q[10];
cx q[4],q[10];
cx q[5],q[10];
rz(9.172838187819544) q[10];
cx q[5],q[10];
cx q[6],q[10];
rz(9.172838187819544) q[10];
cx q[6],q[10];
cx q[7],q[10];
rz(9.172838187819544) q[10];
cx q[7],q[10];
cx q[8],q[10];
rz(9.172838187819544) q[10];
cx q[8],q[10];
cx q[9],q[10];
rz(9.172838187819544) q[10];
cx q[9],q[10];
cx q[11],q[21];
rz(9.172838187819544) q[21];
cx q[11],q[21];
rz(pi/2) q[11];
sx q[11];
rz(pi/2) q[11];
rz(2.0) q[11];
cx q[0],q[11];
rz(9.172838187819544) q[11];
cx q[0],q[11];
cx q[1],q[11];
rz(9.172838187819544) q[11];
cx q[1],q[11];
cx q[2],q[11];
rz(9.172838187819544) q[11];
cx q[2],q[11];
cx q[3],q[11];
rz(9.172838187819544) q[11];
cx q[3],q[11];
cx q[4],q[11];
rz(9.172838187819544) q[11];
cx q[4],q[11];
cx q[5],q[11];
rz(9.172838187819544) q[11];
cx q[5],q[11];
cx q[6],q[11];
rz(9.172838187819544) q[11];
cx q[6],q[11];
cx q[7],q[11];
rz(9.172838187819544) q[11];
cx q[7],q[11];
cx q[8],q[11];
rz(9.172838187819544) q[11];
cx q[8],q[11];
cx q[9],q[11];
rz(9.172838187819544) q[11];
cx q[9],q[11];
cx q[10],q[11];
rz(9.172838187819544) q[11];
cx q[10],q[11];
cx q[12],q[21];
rz(9.172838187819544) q[21];
cx q[12],q[21];
rz(pi/2) q[12];
sx q[12];
rz(pi/2) q[12];
rz(2.0) q[12];
cx q[0],q[12];
rz(9.172838187819544) q[12];
cx q[0],q[12];
cx q[1],q[12];
rz(9.172838187819544) q[12];
cx q[1],q[12];
cx q[2],q[12];
rz(9.172838187819544) q[12];
cx q[2],q[12];
cx q[3],q[12];
rz(9.172838187819544) q[12];
cx q[3],q[12];
cx q[4],q[12];
rz(9.172838187819544) q[12];
cx q[4],q[12];
cx q[5],q[12];
rz(9.172838187819544) q[12];
cx q[5],q[12];
cx q[6],q[12];
rz(9.172838187819544) q[12];
cx q[6],q[12];
cx q[7],q[12];
rz(9.172838187819544) q[12];
cx q[7],q[12];
cx q[8],q[12];
rz(9.172838187819544) q[12];
cx q[8],q[12];
cx q[9],q[12];
rz(9.172838187819544) q[12];
cx q[9],q[12];
cx q[10],q[12];
rz(9.172838187819544) q[12];
cx q[10],q[12];
cx q[11],q[12];
rz(9.172838187819544) q[12];
cx q[11],q[12];
cx q[13],q[21];
rz(9.172838187819544) q[21];
cx q[13],q[21];
rz(pi/2) q[13];
sx q[13];
rz(pi/2) q[13];
rz(2.0) q[13];
cx q[0],q[13];
rz(9.172838187819544) q[13];
cx q[0],q[13];
cx q[1],q[13];
rz(9.172838187819544) q[13];
cx q[1],q[13];
cx q[2],q[13];
rz(9.172838187819544) q[13];
cx q[2],q[13];
cx q[3],q[13];
rz(9.172838187819544) q[13];
cx q[3],q[13];
cx q[4],q[13];
rz(9.172838187819544) q[13];
cx q[4],q[13];
cx q[5],q[13];
rz(9.172838187819544) q[13];
cx q[5],q[13];
cx q[6],q[13];
rz(9.172838187819544) q[13];
cx q[6],q[13];
cx q[7],q[13];
rz(9.172838187819544) q[13];
cx q[7],q[13];
cx q[8],q[13];
rz(9.172838187819544) q[13];
cx q[8],q[13];
cx q[9],q[13];
rz(9.172838187819544) q[13];
cx q[9],q[13];
cx q[10],q[13];
rz(9.172838187819544) q[13];
cx q[10],q[13];
cx q[11],q[13];
rz(9.172838187819544) q[13];
cx q[11],q[13];
cx q[12],q[13];
rz(9.172838187819544) q[13];
cx q[12],q[13];
cx q[14],q[21];
rz(9.172838187819544) q[21];
cx q[14],q[21];
rz(pi/2) q[14];
sx q[14];
rz(pi/2) q[14];
rz(2.0) q[14];
cx q[0],q[14];
rz(9.172838187819544) q[14];
cx q[0],q[14];
cx q[1],q[14];
rz(9.172838187819544) q[14];
cx q[1],q[14];
cx q[2],q[14];
rz(9.172838187819544) q[14];
cx q[2],q[14];
cx q[3],q[14];
rz(9.172838187819544) q[14];
cx q[3],q[14];
cx q[4],q[14];
rz(9.172838187819544) q[14];
cx q[4],q[14];
cx q[5],q[14];
rz(9.172838187819544) q[14];
cx q[5],q[14];
cx q[6],q[14];
rz(9.172838187819544) q[14];
cx q[6],q[14];
cx q[7],q[14];
rz(9.172838187819544) q[14];
cx q[7],q[14];
cx q[8],q[14];
rz(9.172838187819544) q[14];
cx q[8],q[14];
cx q[9],q[14];
rz(9.172838187819544) q[14];
cx q[9],q[14];
cx q[10],q[14];
rz(9.172838187819544) q[14];
cx q[10],q[14];
cx q[11],q[14];
rz(9.172838187819544) q[14];
cx q[11],q[14];
cx q[12],q[14];
rz(9.172838187819544) q[14];
cx q[12],q[14];
cx q[13],q[14];
rz(9.172838187819544) q[14];
cx q[13],q[14];
cx q[15],q[21];
rz(9.172838187819544) q[21];
cx q[15],q[21];
rz(pi/2) q[15];
sx q[15];
rz(pi/2) q[15];
rz(2.0) q[15];
cx q[0],q[15];
rz(9.172838187819544) q[15];
cx q[0],q[15];
cx q[1],q[15];
rz(9.172838187819544) q[15];
cx q[1],q[15];
cx q[2],q[15];
rz(9.172838187819544) q[15];
cx q[2],q[15];
cx q[3],q[15];
rz(9.172838187819544) q[15];
cx q[3],q[15];
cx q[4],q[15];
rz(9.172838187819544) q[15];
cx q[4],q[15];
cx q[5],q[15];
rz(9.172838187819544) q[15];
cx q[5],q[15];
cx q[6],q[15];
rz(9.172838187819544) q[15];
cx q[6],q[15];
cx q[7],q[15];
rz(9.172838187819544) q[15];
cx q[7],q[15];
cx q[8],q[15];
rz(9.172838187819544) q[15];
cx q[8],q[15];
cx q[9],q[15];
rz(9.172838187819544) q[15];
cx q[9],q[15];
cx q[10],q[15];
rz(9.172838187819544) q[15];
cx q[10],q[15];
cx q[11],q[15];
rz(9.172838187819544) q[15];
cx q[11],q[15];
cx q[12],q[15];
rz(9.172838187819544) q[15];
cx q[12],q[15];
cx q[13],q[15];
rz(9.172838187819544) q[15];
cx q[13],q[15];
cx q[14],q[15];
rz(9.172838187819544) q[15];
cx q[14],q[15];
cx q[16],q[21];
rz(9.172838187819544) q[21];
cx q[16],q[21];
rz(pi/2) q[16];
sx q[16];
rz(pi/2) q[16];
rz(2.0) q[16];
cx q[0],q[16];
rz(9.172838187819544) q[16];
cx q[0],q[16];
cx q[1],q[16];
rz(9.172838187819544) q[16];
cx q[1],q[16];
cx q[2],q[16];
rz(9.172838187819544) q[16];
cx q[2],q[16];
cx q[3],q[16];
rz(9.172838187819544) q[16];
cx q[3],q[16];
cx q[4],q[16];
rz(9.172838187819544) q[16];
cx q[4],q[16];
cx q[5],q[16];
rz(9.172838187819544) q[16];
cx q[5],q[16];
cx q[6],q[16];
rz(9.172838187819544) q[16];
cx q[6],q[16];
cx q[7],q[16];
rz(9.172838187819544) q[16];
cx q[7],q[16];
cx q[8],q[16];
rz(9.172838187819544) q[16];
cx q[8],q[16];
cx q[9],q[16];
rz(9.172838187819544) q[16];
cx q[9],q[16];
cx q[10],q[16];
rz(9.172838187819544) q[16];
cx q[10],q[16];
cx q[11],q[16];
rz(9.172838187819544) q[16];
cx q[11],q[16];
cx q[12],q[16];
rz(9.172838187819544) q[16];
cx q[12],q[16];
cx q[13],q[16];
rz(9.172838187819544) q[16];
cx q[13],q[16];
cx q[14],q[16];
rz(9.172838187819544) q[16];
cx q[14],q[16];
cx q[15],q[16];
rz(9.172838187819544) q[16];
cx q[15],q[16];
cx q[17],q[21];
rz(9.172838187819544) q[21];
cx q[17],q[21];
rz(pi/2) q[17];
sx q[17];
rz(pi/2) q[17];
rz(2.0) q[17];
cx q[0],q[17];
rz(9.172838187819544) q[17];
cx q[0],q[17];
cx q[1],q[17];
rz(9.172838187819544) q[17];
cx q[1],q[17];
cx q[2],q[17];
rz(9.172838187819544) q[17];
cx q[2],q[17];
cx q[3],q[17];
rz(9.172838187819544) q[17];
cx q[3],q[17];
cx q[4],q[17];
rz(9.172838187819544) q[17];
cx q[4],q[17];
cx q[5],q[17];
rz(9.172838187819544) q[17];
cx q[5],q[17];
cx q[6],q[17];
rz(9.172838187819544) q[17];
cx q[6],q[17];
cx q[7],q[17];
rz(9.172838187819544) q[17];
cx q[7],q[17];
cx q[8],q[17];
rz(9.172838187819544) q[17];
cx q[8],q[17];
cx q[9],q[17];
rz(9.172838187819544) q[17];
cx q[9],q[17];
cx q[10],q[17];
rz(9.172838187819544) q[17];
cx q[10],q[17];
cx q[11],q[17];
rz(9.172838187819544) q[17];
cx q[11],q[17];
cx q[12],q[17];
rz(9.172838187819544) q[17];
cx q[12],q[17];
cx q[13],q[17];
rz(9.172838187819544) q[17];
cx q[13],q[17];
cx q[14],q[17];
rz(9.172838187819544) q[17];
cx q[14],q[17];
cx q[15],q[17];
rz(9.172838187819544) q[17];
cx q[15],q[17];
cx q[16],q[17];
rz(9.172838187819544) q[17];
cx q[16],q[17];
cx q[18],q[21];
rz(9.172838187819544) q[21];
cx q[18],q[21];
rz(pi/2) q[18];
sx q[18];
rz(pi/2) q[18];
rz(2.0) q[18];
cx q[0],q[18];
rz(9.172838187819544) q[18];
cx q[0],q[18];
cx q[1],q[18];
rz(9.172838187819544) q[18];
cx q[1],q[18];
cx q[2],q[18];
rz(9.172838187819544) q[18];
cx q[2],q[18];
cx q[3],q[18];
rz(9.172838187819544) q[18];
cx q[3],q[18];
cx q[4],q[18];
rz(9.172838187819544) q[18];
cx q[4],q[18];
cx q[5],q[18];
rz(9.172838187819544) q[18];
cx q[5],q[18];
cx q[6],q[18];
rz(9.172838187819544) q[18];
cx q[6],q[18];
cx q[7],q[18];
rz(9.172838187819544) q[18];
cx q[7],q[18];
cx q[8],q[18];
rz(9.172838187819544) q[18];
cx q[8],q[18];
cx q[9],q[18];
rz(9.172838187819544) q[18];
cx q[9],q[18];
cx q[10],q[18];
rz(9.172838187819544) q[18];
cx q[10],q[18];
cx q[11],q[18];
rz(9.172838187819544) q[18];
cx q[11],q[18];
cx q[12],q[18];
rz(9.172838187819544) q[18];
cx q[12],q[18];
cx q[13],q[18];
rz(9.172838187819544) q[18];
cx q[13],q[18];
cx q[14],q[18];
rz(9.172838187819544) q[18];
cx q[14],q[18];
cx q[15],q[18];
rz(9.172838187819544) q[18];
cx q[15],q[18];
cx q[16],q[18];
rz(9.172838187819544) q[18];
cx q[16],q[18];
cx q[17],q[18];
rz(9.172838187819544) q[18];
cx q[17],q[18];
cx q[19],q[21];
rz(9.172838187819544) q[21];
cx q[19],q[21];
rz(pi/2) q[19];
sx q[19];
rz(pi/2) q[19];
rz(2.0) q[19];
cx q[0],q[19];
rz(9.172838187819544) q[19];
cx q[0],q[19];
cx q[1],q[19];
rz(9.172838187819544) q[19];
cx q[1],q[19];
cx q[2],q[19];
rz(9.172838187819544) q[19];
cx q[2],q[19];
cx q[3],q[19];
rz(9.172838187819544) q[19];
cx q[3],q[19];
cx q[4],q[19];
rz(9.172838187819544) q[19];
cx q[4],q[19];
cx q[5],q[19];
rz(9.172838187819544) q[19];
cx q[5],q[19];
cx q[6],q[19];
rz(9.172838187819544) q[19];
cx q[6],q[19];
cx q[7],q[19];
rz(9.172838187819544) q[19];
cx q[7],q[19];
cx q[8],q[19];
rz(9.172838187819544) q[19];
cx q[8],q[19];
cx q[9],q[19];
rz(9.172838187819544) q[19];
cx q[9],q[19];
cx q[10],q[19];
rz(9.172838187819544) q[19];
cx q[10],q[19];
cx q[11],q[19];
rz(9.172838187819544) q[19];
cx q[11],q[19];
cx q[12],q[19];
rz(9.172838187819544) q[19];
cx q[12],q[19];
cx q[13],q[19];
rz(9.172838187819544) q[19];
cx q[13],q[19];
cx q[14],q[19];
rz(9.172838187819544) q[19];
cx q[14],q[19];
cx q[15],q[19];
rz(9.172838187819544) q[19];
cx q[15],q[19];
cx q[16],q[19];
rz(9.172838187819544) q[19];
cx q[16],q[19];
cx q[17],q[19];
rz(9.172838187819544) q[19];
cx q[17],q[19];
cx q[18],q[19];
rz(9.172838187819544) q[19];
cx q[18],q[19];
cx q[20],q[21];
rz(9.172838187819544) q[21];
cx q[20],q[21];
rz(pi/2) q[20];
sx q[20];
rz(pi/2) q[20];
rz(2.0) q[20];
cx q[0],q[20];
rz(9.172838187819544) q[20];
cx q[0],q[20];
cx q[1],q[20];
rz(9.172838187819544) q[20];
cx q[1],q[20];
cx q[2],q[20];
rz(9.172838187819544) q[20];
cx q[2],q[20];
cx q[3],q[20];
rz(9.172838187819544) q[20];
cx q[3],q[20];
cx q[4],q[20];
rz(9.172838187819544) q[20];
cx q[4],q[20];
cx q[5],q[20];
rz(9.172838187819544) q[20];
cx q[5],q[20];
cx q[6],q[20];
rz(9.172838187819544) q[20];
cx q[6],q[20];
cx q[7],q[20];
rz(9.172838187819544) q[20];
cx q[7],q[20];
cx q[8],q[20];
rz(9.172838187819544) q[20];
cx q[8],q[20];
cx q[9],q[20];
rz(9.172838187819544) q[20];
cx q[9],q[20];
cx q[10],q[20];
rz(9.172838187819544) q[20];
cx q[10],q[20];
cx q[11],q[20];
rz(9.172838187819544) q[20];
cx q[11],q[20];
cx q[12],q[20];
rz(9.172838187819544) q[20];
cx q[12],q[20];
cx q[13],q[20];
rz(9.172838187819544) q[20];
cx q[13],q[20];
cx q[14],q[20];
rz(9.172838187819544) q[20];
cx q[14],q[20];
cx q[15],q[20];
rz(9.172838187819544) q[20];
cx q[15],q[20];
cx q[16],q[20];
rz(9.172838187819544) q[20];
cx q[16],q[20];
cx q[17],q[20];
rz(9.172838187819544) q[20];
cx q[17],q[20];
cx q[18],q[20];
rz(9.172838187819544) q[20];
cx q[18],q[20];
cx q[19],q[20];
rz(9.172838187819544) q[20];
cx q[19],q[20];
rz(pi/2) q[21];
sx q[21];
rz(pi/2) q[21];
rz(2.0) q[21];
cx q[0],q[21];
rz(9.172838187819544) q[21];
cx q[0],q[21];
rz(0) q[0];
sx q[0];
rz(3.6869439887802393) q[0];
sx q[0];
rz(3*pi) q[0];
cx q[1],q[21];
rz(9.172838187819544) q[21];
cx q[1],q[21];
rz(0) q[1];
sx q[1];
rz(3.153985122545963) q[1];
sx q[1];
rz(3*pi) q[1];
cx q[2],q[21];
rz(9.172838187819544) q[21];
cx q[2],q[21];
rz(0) q[2];
sx q[2];
rz(3.5839375095227615) q[2];
sx q[2];
rz(3*pi) q[2];
cx q[3],q[21];
rz(9.172838187819544) q[21];
cx q[3],q[21];
rz(0) q[3];
sx q[3];
rz(3.180605324544175) q[3];
sx q[3];
rz(3*pi) q[3];
cx q[4],q[21];
rz(9.172838187819544) q[21];
cx q[4],q[21];
rz(0) q[4];
sx q[4];
rz(4.05441969576224) q[4];
sx q[4];
rz(3*pi) q[4];
cx q[5],q[21];
rz(9.172838187819544) q[21];
cx q[5],q[21];
rz(0) q[5];
sx q[5];
rz(3.2311731718893952) q[5];
sx q[5];
rz(3*pi) q[5];
cx q[6],q[21];
rz(9.172838187819544) q[21];
cx q[6],q[21];
rz(0) q[6];
sx q[6];
rz(3.8143616883599374) q[6];
sx q[6];
rz(3*pi) q[6];
cx q[7],q[21];
rz(9.172838187819544) q[21];
cx q[7],q[21];
rz(0) q[7];
sx q[7];
rz(3.575355653049928) q[7];
sx q[7];
rz(3*pi) q[7];
cx q[8],q[21];
rz(9.172838187819544) q[21];
cx q[8],q[21];
rz(0) q[8];
sx q[8];
rz(4.01837920865519) q[8];
sx q[8];
rz(3*pi) q[8];
cx q[9],q[21];
rz(9.172838187819544) q[21];
cx q[9],q[21];
rz(0) q[9];
sx q[9];
rz(3.7980611440619896) q[9];
sx q[9];
rz(3*pi) q[9];
cx q[10],q[21];
rz(9.172838187819544) q[21];
cx q[10],q[21];
rz(0) q[10];
sx q[10];
rz(3.3869575690928038) q[10];
sx q[10];
rz(3*pi) q[10];
cx q[11],q[21];
rz(9.172838187819544) q[21];
cx q[11],q[21];
rz(0) q[11];
sx q[11];
rz(4.109474574596909) q[11];
sx q[11];
rz(3*pi) q[11];
cx q[12],q[21];
rz(9.172838187819544) q[21];
cx q[12],q[21];
rz(0) q[12];
sx q[12];
rz(4.060923255122381) q[12];
sx q[12];
rz(3*pi) q[12];
cx q[13],q[21];
rz(9.172838187819544) q[21];
cx q[13],q[21];
rz(0) q[13];
sx q[13];
rz(3.7237546663690937) q[13];
sx q[13];
rz(3*pi) q[13];
cx q[14],q[21];
rz(9.172838187819544) q[21];
cx q[14],q[21];
rz(0) q[14];
sx q[14];
rz(3.497424262284543) q[14];
sx q[14];
rz(3*pi) q[14];
cx q[15],q[21];
rz(9.172838187819544) q[21];
cx q[15],q[21];
rz(0) q[15];
sx q[15];
rz(3.52081509847085) q[15];
sx q[15];
rz(3*pi) q[15];
cx q[16],q[21];
rz(9.172838187819544) q[21];
cx q[16],q[21];
rz(0) q[16];
sx q[16];
rz(3.856873801617853) q[16];
sx q[16];
rz(3*pi) q[16];
cx q[17],q[21];
rz(9.172838187819544) q[21];
cx q[17],q[21];
rz(0) q[17];
sx q[17];
rz(3.550827597533659) q[17];
sx q[17];
rz(3*pi) q[17];
cx q[18],q[21];
rz(9.172838187819544) q[21];
cx q[18],q[21];
rz(0) q[18];
sx q[18];
rz(3.9305235084117163) q[18];
sx q[18];
rz(3*pi) q[18];
cx q[19],q[21];
rz(9.172838187819544) q[21];
cx q[19],q[21];
rz(0) q[19];
sx q[19];
rz(3.539976734369054) q[19];
sx q[19];
rz(3*pi) q[19];
cx q[20],q[21];
rz(9.172838187819544) q[21];
cx q[20],q[21];
rz(0) q[20];
sx q[20];
rz(4.012278908559793) q[20];
sx q[20];
rz(3*pi) q[20];
rz(0) q[21];
sx q[21];
rz(3.415811416585599) q[21];
sx q[21];
rz(3*pi) q[21];
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
cx q[9],q[10];
cx q[8],q[9];
cx q[7],q[8];
cx q[6],q[7];
cx q[5],q[6];
cx q[4],q[5];
cx q[3],q[4];
cx q[2],q[3];
cx q[1],q[2];
cx q[0],q[1];
rz(0) q[0];
sx q[0];
rz(3.477165897478426) q[0];
sx q[0];
rz(3*pi) q[0];
rz(0) q[1];
sx q[1];
rz(4.1364883422698036) q[1];
sx q[1];
rz(3*pi) q[1];
rz(0) q[2];
sx q[2];
rz(3.171703527201295) q[2];
sx q[2];
rz(3*pi) q[2];
rz(0) q[3];
sx q[3];
rz(3.397183119722376) q[3];
sx q[3];
rz(3*pi) q[3];
rz(0) q[4];
sx q[4];
rz(3.2282817335531613) q[4];
sx q[4];
rz(3*pi) q[4];
rz(0) q[5];
sx q[5];
rz(3.8507777011977185) q[5];
sx q[5];
rz(3*pi) q[5];
rz(0) q[6];
sx q[6];
rz(3.251198117552454) q[6];
sx q[6];
rz(3*pi) q[6];
rz(0) q[7];
sx q[7];
rz(3.837922422796981) q[7];
sx q[7];
rz(3*pi) q[7];
rz(0) q[8];
sx q[8];
rz(3.258229666569034) q[8];
sx q[8];
rz(3*pi) q[8];
rz(0) q[9];
sx q[9];
rz(3.9900466552859823) q[9];
sx q[9];
rz(3*pi) q[9];
rz(0) q[10];
sx q[10];
rz(3.386968297680553) q[10];
sx q[10];
rz(3*pi) q[10];
rz(0) q[11];
sx q[11];
rz(4.136718512005615) q[11];
sx q[11];
rz(3*pi) q[11];
rz(0) q[12];
sx q[12];
rz(3.24505752490463) q[12];
sx q[12];
rz(3*pi) q[12];
rz(0) q[13];
sx q[13];
rz(3.23886165242004) q[13];
sx q[13];
rz(3*pi) q[13];
rz(0) q[14];
sx q[14];
rz(3.7210996171145014) q[14];
sx q[14];
rz(3*pi) q[14];
rz(0) q[15];
sx q[15];
rz(3.5029960306809618) q[15];
sx q[15];
rz(3*pi) q[15];
rz(0) q[16];
sx q[16];
rz(3.5568086236221426) q[16];
sx q[16];
rz(3*pi) q[16];
rz(0) q[17];
sx q[17];
rz(3.157329488668231) q[17];
sx q[17];
rz(3*pi) q[17];
rz(0) q[18];
sx q[18];
rz(3.3518120282314214) q[18];
sx q[18];
rz(3*pi) q[18];
rz(0) q[19];
sx q[19];
rz(4.139759809027061) q[19];
sx q[19];
rz(3*pi) q[19];
rz(0) q[20];
sx q[20];
rz(3.5020501615255446) q[20];
sx q[20];
rz(3*pi) q[20];
rz(0) q[21];
sx q[21];
rz(3.6420494352243766) q[21];
sx q[21];
rz(3*pi) q[21];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];
measure q[16] -> meas[16];
measure q[17] -> meas[17];
measure q[18] -> meas[18];
measure q[19] -> meas[19];
measure q[20] -> meas[20];
measure q[21] -> meas[21];