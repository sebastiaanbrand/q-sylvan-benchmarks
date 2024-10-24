// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// Qiskit version: 1.0.2

OPENQASM 2.0;
include "qelib1.inc";
qreg q[24];
creg meas[24];
u3(2.300745019439789,pi/2,-pi) q[1];
rx(5.864966885210837) q[2];
cx q[3],q[4];
u2(1.1499661966238133,-2.6486453968167423) q[4];
h q[6];
sx q[7];
s q[8];
cx q[8],q[7];
u1(1.4645506429344959) q[7];
x q[8];
cz q[2],q[8];
u3(1.5985666798244635,-0.2711740683432238,-pi/2) q[9];
cu1(pi/2) q[12],q[7];
u2(pi/4,-pi) q[13];
cx q[11],q[13];
tdg q[13];
cx q[10],q[13];
u2(-2.350396685598805,-1.5716615322248781) q[10];
t q[13];
cx q[11],q[13];
h q[11];
cx q[3],q[11];
h q[11];
cu1(pi/2) q[3],q[11];
h q[3];
cx q[8],q[3];
rz(1.454894982862097) q[3];
cx q[8],q[3];
u2(-pi,pi/2) q[3];
u1(-pi/4) q[11];
swap q[11],q[7];
s q[7];
u2(0.3644315293988152,3*pi/4) q[13];
cx q[15],q[6];
h q[6];
cu1(pi/2) q[15],q[6];
u2(0,-pi) q[6];
u2(0,0) q[15];
cx q[15],q[9];
ry(-2.4997108576634877) q[9];
ry(-2.4997108576634877) q[15];
cx q[15],q[9];
u1(1.8419703951381203) q[9];
u3(0.7050200653985376,-1.1659528699674198,1.5340334169629335) q[15];
cry(5.196847304624584) q[5],q[16];
rx(5.432461787371337) q[16];
sdg q[17];
u1(-0.11110532769970938) q[18];
rzz(2.453068833014572) q[18],q[1];
h q[1];
u2(0,0) q[19];
h q[20];
cx q[0],q[20];
h q[20];
cu1(pi/2) q[0],q[20];
crx(0.7203317518888239) q[5],q[0];
u3(0.1985592692451562,-0.08191660178282056,0.12487864535773063) q[5];
u2(0,0) q[20];
cx q[20],q[13];
ry(-3.1011423607500923) q[13];
ry(-3.1011423607500923) q[20];
cx q[20],q[13];
u3(pi,0.9676139280968563,-2.5384102548917524) q[13];
cx q[13],q[1];
h q[1];
cu1(pi/2) q[13],q[1];
u3(0.7491182519962942,-1.3527708846428603,-2.2714740169068324) q[1];
h q[13];
u2(-pi,-pi) q[20];
u1(0.020746227822597163) q[21];
cx q[19],q[21];
ry(-1.8088051076493177) q[19];
ry(-1.8088051076493177) q[21];
cx q[19],q[21];
u3(1.7498100254153492,3.1252181396855683,-0.1819530745919984) q[19];
cx q[10],q[19];
tdg q[19];
u3(2.832055090474391,0.13210031179562165,-0.1528465396182188) q[21];
cry(2.6845301397458154) q[9],q[21];
u2(pi/4,-pi) q[9];
cry(0.9110285368422897) q[22],q[14];
rx(0.43137627135395684) q[14];
cy q[0],q[14];
cx q[0],q[19];
u2(0,0) q[0];
u3(1.3895855771693475,-0.6286560629202058,0.9684739900612716) q[14];
t q[19];
cx q[10],q[19];
cp(0.8536767566826966) q[5],q[10];
u2(pi/4,-pi) q[10];
u2(-2.287052918975709,3*pi/4) q[19];
cx q[0],q[19];
ry(-1.81347477259592) q[0];
ry(-1.81347477259592) q[19];
cx q[0],q[19];
u2(-pi,-pi) q[0];
cu1(2.7035376924631196) q[0],q[5];
u3(2.1473016820601543,0.707828078250035,2.574428200064676) q[0];
u3(2.456106176791147,-1.8501963860073345,0.7184880977083963) q[19];
h q[22];
sdg q[23];
rxx(5.695888160944528) q[23],q[17];
u2(-pi/2,-pi) q[17];
cz q[17],q[20];
u1(pi/2) q[20];
s q[23];
cx q[23],q[22];
rz(4.820717485323253) q[22];
cx q[23],q[22];
crz(0.27841736785903115) q[2],q[23];
tdg q[2];
h q[22];
cswap q[6],q[22],q[16];
cx q[6],q[9];
tdg q[9];
cx q[4],q[9];
u3(4.2855116880912725,-1.444714862073997,1.444714862073997) q[4];
cx q[4],q[10];
t q[9];
cx q[6],q[9];
swap q[6],q[2];
u1(-0.07785765387528443) q[2];
u3(3.008742707479723,2.0142025399601335,-2.0142025399601335) q[6];
u2(pi/2,3*pi/4) q[9];
tdg q[10];
cx q[3],q[10];
t q[10];
cx q[4],q[10];
u2(0,3*pi/4) q[10];
cx q[6],q[10];
rx(3.4047365073538574) q[10];
cu3(2.421879330912173,6.142149185496677,4.443589999062532) q[10],q[15];
h q[15];
h q[16];
cu1(pi/8) q[8],q[16];
cx q[8],q[17];
cu1(-pi/8) q[17],q[16];
cx q[8],q[17];
cu1(pi/8) q[17],q[16];
cx q[17],q[12];
cu1(-pi/8) q[12],q[16];
cx q[8],q[12];
cu1(pi/8) q[12],q[16];
cx q[17],q[12];
cu1(-pi/8) q[12],q[16];
cx q[8],q[12];
cu1(pi/8) q[12],q[16];
cu1(pi/2) q[11],q[12];
u2(pi/2,-pi) q[16];
u2(0,-pi/2) q[17];
cx q[17],q[7];
cx q[7],q[17];
u2(1.8642439256652672,-pi) q[7];
u3(pi,-pi/2,-pi/4) q[17];
cx q[20],q[9];
cx q[9],q[20];
u3(pi,1.2867384562434543,1.8548541973463388) q[9];
h q[22];
cx q[21],q[22];
h q[22];
cu1(pi/2) q[21],q[22];
u1(5.306484114352285) q[21];
cu1(6.162461075673974) q[21],q[8];
ccx q[4],q[3],q[8];
u1(-1.2627880889257166) q[3];
cx q[14],q[3];
ry(-1.418074293577401) q[3];
ry(1.418074293577401) q[14];
cx q[14],q[3];
u1(1.262788088925717) q[3];
u2(-pi,-pi) q[14];
cry(0.5827527689578689) q[3],q[14];
h q[3];
u2(pi/4,-pi) q[21];
cx q[22],q[13];
h q[13];
cu1(pi/2) q[22],q[13];
cswap q[12],q[13],q[16];
u2(0,0) q[12];
cx q[12],q[2];
ry(-2.7760435307779896) q[2];
ry(-2.7760435307779896) q[12];
cx q[12],q[2];
u1(1.6486539806701792) q[2];
u2(-pi,-pi) q[12];
cz q[8],q[12];
cy q[13],q[7];
cx q[4],q[13];
cx q[13],q[4];
u2(-1.0555076110178199,2.1669990216614767) q[16];
cu1(0.21420527290543262) q[16],q[4];
cx q[4],q[10];
cx q[16],q[15];
rz(0.3037618616793895) q[15];
cx q[16],q[15];
h q[15];
cu3(6.238651213351592,3.141693083085852,0.4851534132028912) q[17],q[2];
u2(-pi/2,pi/2) q[2];
cp(3.5730578711460286) q[9],q[17];
t q[9];
h q[17];
p(4.922277683248398) q[22];
cy q[5],q[22];
u3(1.2884348986812295,-2.7954658143737428,-0.721503937769727) q[5];
cx q[22],q[7];
cx q[7],q[22];
u1(0.5007433663129781) q[7];
crx(4.956735330393394) q[8],q[22];
cx q[23],q[18];
cx q[18],q[23];
u3(pi,-pi,-1.5824742721964626) q[18];
tdg q[23];
crz(3.0509600791917504) q[11],q[23];
cx q[11],q[21];
tdg q[21];
cx q[20],q[21];
cp(5.298397105888836) q[20],q[6];
cu1(pi/2) q[6],q[0];
h q[0];
ch q[0],q[6];
cry(3.568967231508171) q[2],q[0];
u3(1.2484029636772729,-3.1368417997783222,-1.9147285739605746) q[0];
u2(pi/4,-pi) q[2];
ch q[15],q[6];
cx q[6],q[2];
u2(0,3*pi/4) q[2];
u2(0,0) q[20];
cx q[20],q[7];
ry(-1.323324173714335) q[7];
ry(-1.323324173714335) q[20];
cx q[20],q[7];
u2(0,2.640849287276815) q[7];
u2(-pi,-pi) q[20];
t q[21];
cx q[11],q[21];
crz(4.6953643466626085) q[18],q[11];
cx q[12],q[11];
u2(-pi,0.8838843645255627) q[12];
crx(0.24408822817581924) q[18],q[19];
cx q[19],q[17];
h q[17];
cu1(pi/2) q[19],q[17];
crx(5.468967898137674) q[4],q[19];
u2(0,0) q[4];
u1(-1.965841703221606) q[19];
u2(-2.3015423577113094,-pi/4) q[21];
cswap q[8],q[21],q[20];
u2(0,-pi/2) q[8];
cx q[8],q[5];
cx q[5],q[8];
h q[5];
u3(pi,-pi/2,0) q[21];
z q[23];
rxx(0.535976103973743) q[1],q[23];
ch q[13],q[1];
u1(1.3765119043206742) q[13];
rxx(5.6946507737984255) q[10],q[13];
rxx(0.4721449346106464) q[10],q[5];
crx(5.548968590502123) q[13],q[15];
s q[13];
h q[15];
cx q[8],q[15];
h q[15];
cu1(pi/2) q[8],q[15];
sx q[8];
ccx q[18],q[1],q[3];
u3(1.4520222082168603,-2.0533544037093097,0.0619960495185925) q[3];
cy q[17],q[1];
u2(0,0) q[1];
cx q[1],q[19];
ry(3.064254432898039) q[1];
cry(1.8711205015238437) q[18],q[11];
u3(2.6620685801532558,-2.9785560775578386,-0.7047503978365897) q[11];
ry(-3.064254432898039) q[19];
cx q[1],q[19];
u2(-pi,-pi) q[1];
u2(0,-1.1757509503681873) q[19];
cx q[21],q[19];
rz(2.318350220204926) q[19];
cx q[21],q[19];
cu1(pi/2) q[15],q[21];
u1(-0.334572733595186) q[15];
u2(2.7499846993742523,-pi) q[19];
tdg q[23];
cu1(pi/8) q[23],q[7];
cx q[23],q[14];
cu1(-pi/8) q[14],q[7];
cx q[23],q[14];
cu1(pi/8) q[14],q[7];
cx q[14],q[22];
cu1(-pi/8) q[22],q[7];
cx q[23],q[22];
cu1(pi/8) q[22],q[7];
cx q[14],q[22];
h q[14];
cu1(-pi/8) q[22],q[7];
cx q[23],q[22];
cu1(pi/8) q[22],q[7];
h q[7];
cy q[9],q[7];
s q[7];
s q[9];
cx q[12],q[7];
cx q[7],q[12];
h q[7];
u2(-pi,-pi) q[12];
cu1(pi/8) q[22],q[14];
cx q[22],q[16];
cu1(-pi/8) q[16],q[14];
cx q[22],q[16];
cu1(pi/8) q[16],q[14];
cx q[16],q[20];
cu1(-pi/8) q[20],q[14];
cx q[22],q[20];
cu1(pi/8) q[20],q[14];
cx q[16],q[20];
cu1(-pi/8) q[20],q[14];
cx q[22],q[20];
cu1(pi/8) q[20],q[14];
h q[14];
cx q[14],q[3];
h q[3];
cu1(pi/2) q[14],q[3];
u2(0,-pi) q[3];
ccx q[7],q[1],q[3];
h q[3];
cx q[14],q[0];
h q[0];
cu1(pi/2) q[14],q[0];
s q[14];
cx q[14],q[8];
u3(pi,-pi,-pi/2) q[14];
u1(-2.927090278152596) q[20];
cx q[4],q[20];
ry(0.8309395330630959) q[4];
ry(-0.8309395330630959) q[20];
cx q[4],q[20];
u2(-pi,-pi) q[4];
cz q[4],q[9];
u2(pi/4,-pi) q[4];
u1(2.927090278152596) q[20];
cu3(0.493448912319289,1.7686617479081617,0.5277784822910401) q[22],q[16];
u3(2.227119945724848,-0.6308942721249906,2.5742194947878225) q[16];
cp(5.713262476767414) q[22],q[20];
ch q[9],q[22];
rx(3.8371134342202953) q[22];
u(0.6246238923704159,2.3749623468387755,4.7046749871144575) q[23];
cx q[23],q[2];
u1(pi/4) q[2];
cx q[18],q[2];
u1(-pi/4) q[2];
cx q[23],q[2];
u1(pi/4) q[2];
cx q[18],q[2];
u2(pi/4,3*pi/4) q[2];
cx q[6],q[2];
u2(0,3*pi/4) q[2];
h q[18];
cu1(pi/8) q[10],q[18];
cx q[10],q[6];
cu1(-pi/8) q[6],q[18];
cx q[10],q[6];
cu1(pi/8) q[6],q[18];
cx q[6],q[2];
cu1(-pi/8) q[2],q[18];
cx q[10],q[2];
cu1(pi/8) q[2],q[18];
cx q[6],q[2];
cu1(-pi/8) q[2],q[18];
cu1(5.677306039220654) q[6],q[17];
cx q[10],q[2];
cu1(pi/8) q[2],q[18];
cx q[2],q[4];
u2(0,3*pi/4) q[4];
cx q[7],q[4];
u1(pi/4) q[4];
cx q[3],q[4];
u1(-pi/4) q[4];
cx q[7],q[4];
u1(pi/4) q[4];
cx q[3],q[4];
sx q[3];
u2(pi/4,3*pi/4) q[4];
cx q[2],q[4];
u2(pi/2,3*pi/4) q[4];
h q[7];
cu1(pi/8) q[6],q[7];
cx q[6],q[9];
cu1(-pi/8) q[9],q[7];
cx q[6],q[9];
cu1(pi/8) q[9],q[7];
h q[10];
cx q[0],q[10];
rz(0.1649644721627606) q[10];
cx q[0],q[10];
h q[10];
cx q[9],q[10];
cu1(-pi/8) q[10],q[7];
cx q[6],q[10];
cu1(pi/8) q[10],q[7];
cx q[9],q[10];
u2(pi/4,-pi) q[9];
cu1(-pi/8) q[10],q[7];
cx q[6],q[10];
cu1(pi/8) q[10],q[7];
u2(0,-pi) q[7];
u1(-0.5432521463475579) q[10];
cx q[14],q[3];
u2(0,0) q[3];
cx q[3],q[10];
ry(2.783738111839025) q[3];
ry(-2.783738111839025) q[10];
cx q[3],q[10];
u2(pi/2,-pi) q[3];
u3(2.5594581107161223,1.5199256044065024,-2.9285225457508153) q[10];
x q[14];
cx q[14],q[9];
u2(0,3*pi/4) q[9];
cx q[17],q[0];
h q[0];
u2(0,0) q[17];
cx q[17],q[15];
ry(-0.36289858611676196) q[15];
ry(-0.36289858611676196) q[17];
cx q[17],q[15];
u1(-2.807019919994607) q[15];
u3(pi,-1.2858722001728342,1.855720453416959) q[17];
cy q[21],q[2];
cx q[21],q[0];
rz(3.1953224164936005) q[0];
cx q[21],q[0];
h q[0];
h q[21];
cy q[23],q[5];
cx q[5],q[16];
u2(0,3*pi/4) q[16];
cx q[13],q[16];
u1(pi/4) q[16];
cx q[1],q[16];
u1(-pi/4) q[16];
cx q[13],q[16];
cx q[13],q[19];
cx q[2],q[19];
ry(3.009452179335529) q[2];
u1(pi/4) q[16];
cx q[1],q[16];
cz q[1],q[11];
x q[1];
cu1(pi/2) q[1],q[17];
u2(0,0) q[11];
u2(pi/4,3*pi/4) q[16];
cx q[5],q[16];
sdg q[5];
rxx(2.4803766115147057) q[12],q[5];
u3(pi,pi/2,0) q[5];
s q[12];
u2(0,-3*pi/4) q[16];
cx q[4],q[16];
x q[4];
cu3(1.6651737111436844,4.44348629651231,4.855308754757299) q[4],q[16];
u2(3.704028958421574,2.7995383225285044) q[4];
rx(2.162428073965007) q[16];
u2(-pi/2,-pi) q[17];
cry(2.6215789363932407) q[19],q[0];
h q[19];
cu1(pi/2) q[10],q[19];
h q[19];
ccx q[20],q[23],q[18];
cp(4.390921185034637) q[6],q[18];
s q[6];
cz q[8],q[23];
u3(2.128895001393237,-pi,pi/2) q[8];
cx q[8],q[6];
cx q[6],q[8];
u2(-pi/4,-pi) q[6];
u2(-2.82236852500318,pi/2) q[18];
cu3(3.3156005884183655,5.760383950371973,4.147505728892529) q[18],q[2];
sx q[2];
u1(2.3097151413046175) q[20];
cx q[11],q[20];
ry(0.26257175957079676) q[11];
ry(-0.26257175957079676) q[20];
cx q[11],q[20];
u2(pi/2,-pi) q[11];
rxx(4.095685186819329) q[11],q[3];
s q[3];
s q[11];
cx q[11],q[8];
cx q[8],q[11];
crz(4.666901442854227) q[8],q[10];
u2(0,2.320757813314974) q[11];
u3(1.019428404208176,0.35963953108522695,1.5313432494644115) q[20];
crz(1.9164065388485196) q[20],q[16];
cz q[22],q[12];
cx q[12],q[21];
rz(0.47419885444553767) q[21];
cx q[12],q[21];
u2(0,-3*pi/4) q[12];
u2(-pi/2,-pi) q[21];
rxx(0.22062108505454137) q[21],q[17];
s q[17];
s q[21];
ccx q[19],q[21],q[20];
p(6.269341347561659) q[20];
s q[21];
h q[22];
cx q[5],q[22];
rz(3.671726385247692) q[22];
cx q[5],q[22];
cu1(pi/8) q[3],q[22];
cx q[3],q[5];
cu1(-pi/8) q[5],q[22];
cx q[3],q[5];
cu1(pi/8) q[5],q[22];
cx q[5],q[15];
cu1(-pi/8) q[15],q[22];
cx q[3],q[15];
cu1(pi/8) q[15],q[22];
cx q[5],q[15];
cu1(-pi/8) q[15],q[22];
cx q[3],q[15];
ccx q[6],q[3],q[12];
u2(pi/4,-pi) q[6];
cx q[2],q[6];
tdg q[6];
u2(0,-pi) q[12];
cu1(pi/8) q[15],q[22];
cu1(pi/2) q[18],q[12];
u1(-2.0443020481772436) q[12];
h q[22];
cx q[23],q[9];
u1(pi/4) q[9];
cx q[13],q[9];
u1(-pi/4) q[9];
cx q[23],q[9];
u1(pi/4) q[9];
cx q[13],q[9];
u2(pi/4,3*pi/4) q[9];
cx q[14],q[9];
swap q[7],q[14];
u2(pi/2,-pi/2) q[7];
u2(0,3*pi/4) q[9];
crx(5.83703684810961) q[9],q[13];
h q[9];
cx q[4],q[9];
rz(4.928885672134828) q[9];
cx q[4],q[9];
h q[9];
cu1(pi/2) q[9],q[16];
u1(6.1517194754973215) q[9];
ry(2.443596646876557) q[13];
cy q[13],q[5];
cswap q[10],q[19],q[13];
u2(pi/4,-pi) q[10];
cx q[14],q[0];
cu1(pi/2) q[0],q[7];
u2(3.0649340115981554,-2.4031203248642834) q[7];
u2(0,-pi) q[16];
cu1(pi/8) q[5],q[16];
swap q[17],q[14];
x q[17];
u1(1.511820862905621) q[19];
cu3(3.7780850474994696,2.5590559164525426,1.5900173668611213) q[20],q[14];
u2(0,0) q[14];
cx q[14],q[12];
ry(-2.9190282070370794) q[12];
ry(-2.9190282070370794) q[14];
cx q[14],q[12];
u1(2.0443020481772436) q[12];
u2(pi/2,-pi) q[14];
cp(2.0890538027827015) q[20],q[21];
crz(5.840760002608805) q[22],q[4];
cx q[4],q[6];
cswap q[4],q[13],q[18];
u2(0,-0.04220985076164041) q[4];
cx q[5],q[22];
t q[6];
cx q[2],q[6];
u3(5.163030972839443,0.1434012114111163,0.16266555838453584) q[2];
u2(0,3*pi/4) q[6];
cx q[6],q[10];
u2(0,3*pi/4) q[10];
u2(0,0) q[13];
h q[18];
cu1(-pi/8) q[22],q[16];
cx q[5],q[22];
cu1(pi/8) q[22],q[16];
cx q[22],q[8];
cu1(-pi/8) q[8],q[16];
cx q[5],q[8];
cu1(pi/8) q[8],q[16];
cx q[22],q[8];
cu1(-pi/8) q[8],q[16];
cx q[5],q[8];
cu1(pi/8) q[8],q[16];
p(2.1123844786954313) q[8];
cu3(0.6104921506527751,2.920677509694216,1.318390862985621) q[8],q[5];
sdg q[5];
ccx q[8],q[20],q[18];
u1(2.8918975022227684) q[8];
rxx(2.4330328969809467) q[14],q[5];
u1(-0.24062440032787613) q[5];
u3(2.6468979472357765,pi/2,-2.9663393935345814) q[14];
h q[16];
cx q[16],q[10];
u1(pi/4) q[10];
cz q[17],q[22];
u2(0,-pi/2) q[17];
u2(-1.9077768553935153,-pi) q[18];
cx q[4],q[18];
ry(-1.0250309819707593) q[4];
ry(-1.0250309819707593) q[18];
cx q[4],q[18];
u2(-pi,-pi) q[4];
u2(0,-1.2338157981962778) q[18];
u1(0.1589540242527967) q[22];
cx q[13],q[22];
ry(0.6592840413350781) q[13];
ry(-0.6592840413350781) q[22];
cx q[13],q[22];
u2(-pi,-pi) q[13];
u1(0.8209868792455959) q[22];
u2(1.7899747207246606,3.5208836576313014) q[23];
crz(6.236249523380651) q[1],q[23];
cu1(4.058201861681506) q[1],q[15];
u3(1.243378204179692,2.3699168114444698,2.918912204222881) q[1];
z q[15];
cswap q[7],q[3],q[15];
sdg q[3];
s q[7];
cx q[17],q[7];
cx q[7],q[17];
h q[7];
rxx(1.184153166433536) q[19],q[3];
s q[3];
s q[19];
cu1(4.742141966422339) q[21],q[15];
h q[21];
cx q[7],q[21];
rz(5.314723798560928) q[21];
cx q[7],q[21];
u1(-1.2551557007262861) q[7];
h q[21];
p(3.604249152724086) q[23];
cu1(pi/2) q[23],q[11];
h q[11];
cswap q[9],q[0],q[11];
cx q[0],q[1];
cx q[1],q[0];
cz q[0],q[15];
rxx(3.3267340383086825) q[1],q[20];
cu1(pi/2) q[1],q[18];
u2(0,-pi/2) q[1];
cx q[1],q[8];
cx q[8],q[1];
u2(-pi/2,-pi) q[8];
x q[11];
cy q[11],q[17];
z q[11];
h q[18];
cu3(6.164905055965242,3.584257078551252,4.218858498500714) q[20],q[4];
x q[4];
cx q[23],q[10];
u1(-pi/4) q[10];
cx q[16],q[10];
u1(pi/4) q[10];
z q[16];
ccx q[19],q[16],q[3];
h q[3];
u2(0,1.0730987472621392) q[16];
cx q[17],q[3];
h q[3];
cu1(pi/2) q[17],q[3];
u2(-pi/2,pi/2) q[3];
cz q[17],q[18];
cy q[3],q[18];
h q[19];
cu1(pi/8) q[0],q[19];
cx q[23],q[10];
u2(pi/4,3*pi/4) q[10];
cx q[6],q[10];
rzz(3.6593834337403552) q[6],q[2];
u2(-1.5618517307328252,-pi) q[2];
cx q[9],q[10];
tdg q[10];
cx q[12],q[10];
t q[10];
cx q[9],q[10];
cp(2.2124260409962044) q[9],q[6];
ry(5.847070211188854) q[6];
u3(pi,pi/2,-3*pi/4) q[10];
cx q[10],q[22];
ry(2.5130057833514643) q[10];
cu3(5.268488684001932,2.1504242006182763,2.5958092891759503) q[13],q[12];
u2(0,0) q[12];
cx q[12],q[7];
ry(-1.9542204667364795) q[7];
ry(-1.9542204667364795) q[12];
cx q[12],q[7];
u1(1.2551557007262861) q[7];
u2(pi/2,-pi) q[12];
cu3(2.440535605737203,2.7482500772391254,6.219213711951733) q[15],q[13];
u2(0,2.5008784992227353) q[15];
cx q[17],q[15];
h q[15];
cu1(pi/2) q[17],q[15];
u3(2.006086275441912,pi/2,-1.8035363844051124) q[15];
cu1(pi/8) q[21],q[2];
cx q[21],q[9];
cu1(-pi/8) q[9],q[2];
cx q[21],q[9];
cu1(pi/8) q[9],q[2];
cx q[9],q[5];
cu1(-pi/8) q[5],q[2];
cx q[21],q[5];
cu1(pi/8) q[5],q[2];
cx q[9],q[5];
cu1(-pi/8) q[5],q[2];
h q[9];
cx q[21],q[5];
cu1(pi/8) q[5],q[2];
h q[2];
cswap q[6],q[21],q[13];
ch q[7],q[5];
u3(5.4123455116159,0.19131822439167512,-0.19131822439167512) q[5];
sxdg q[7];
sdg q[21];
ry(-2.5130057833514643) q[22];
cx q[10],q[22];
u2(-1.8141984961627333,-pi) q[10];
u1(-0.9799409034983926) q[22];
cx q[0],q[22];
cu1(-pi/8) q[22],q[19];
cx q[0],q[22];
cu1(pi/8) q[22],q[19];
u2(pi/2,pi/2) q[23];
cx q[22],q[23];
cu1(-pi/8) q[23],q[19];
cx q[0],q[23];
cu1(pi/8) q[23],q[19];
cx q[22],q[23];
u1(-3.117100731061763) q[22];
cx q[16],q[22];
ry(-1.6633597120927515) q[16];
ry(-1.6633597120927515) q[22];
cx q[16],q[22];
u2(-pi,-pi) q[16];
u2(pi/4,-0.02449192252803023) q[22];
cu1(-pi/8) q[23],q[19];
cx q[0],q[23];
cswap q[0],q[10],q[2];
u1(1.556211323019422) q[0];
ch q[13],q[2];
u1(-1.4490771034061534) q[13];
cswap q[18],q[7],q[2];
x q[2];
u1(2.4443035341320014) q[18];
cx q[15],q[18];
ry(-2.8556415211880988) q[15];
ry(-2.8556415211880988) q[18];
cx q[15],q[18];
u1(-2.4443035341320014) q[18];
cu1(pi/8) q[23],q[19];
cu1(3.963409832625689) q[19],q[16];
u3(2.7395975925206515,0.3022291420169405,-0.7949223832218157) q[16];
cry(2.6759532811131526) q[19],q[14];
cu1(pi/8) q[23],q[9];
cx q[23],q[11];
cu1(-pi/8) q[11],q[9];
cx q[23],q[11];
cu1(pi/8) q[11],q[9];
cx q[11],q[20];
cu1(-pi/8) q[20],q[9];
cx q[23],q[20];
cu1(pi/8) q[20],q[9];
cx q[11],q[20];
ccx q[11],q[6],q[4];
sdg q[4];
u2(0,0) q[6];
cx q[6],q[13];
ry(1.4919218628663107) q[6];
x q[11];
ry(-1.4919218628663107) q[13];
cx q[6],q[13];
u3(pi,-1.2858722001728342,1.855720453416959) q[6];
u1(1.4490771034061538) q[13];
cz q[13],q[7];
cu3(4.052486582567272,0.07069998081728655,2.927427240084209) q[2],q[7];
u2(0,0) q[7];
cx q[14],q[11];
cu1(-pi/8) q[20],q[9];
cx q[23],q[20];
cu1(pi/8) q[20],q[9];
u2(-pi/2,-pi) q[9];
rxx(2.565716737441561) q[8],q[9];
rxx(5.5908245296847845) q[4],q[8];
s q[4];
s q[9];
cx q[20],q[22];
u2(0,3*pi/4) q[22];
cx q[1],q[22];
u1(pi/4) q[22];
cx q[12],q[22];
u1(-pi/4) q[22];
cx q[1],q[22];
u2(-2.940076106258843,-2.6320152338804452) q[1];
cx q[15],q[1];
ry(-0.21156478345943902) q[1];
ry(-0.21156478345943902) q[15];
cx q[15],q[1];
u3(0.9586362255495191,0.6203564787289269,1.5419398918424614) q[1];
u3(pi,-1.2858722001728342,1.855720453416959) q[15];
u1(pi/4) q[22];
cx q[12],q[22];
cry(0.3498717707325438) q[12],q[5];
sxdg q[12];
cp(3.1500721718629596) q[12],q[14];
u2(pi/4,-pi) q[12];
sdg q[14];
u2(pi/4,3*pi/4) q[22];
cx q[20],q[22];
u2(0,0) q[20];
cx q[20],q[0];
ry(-1.9117971738734651) q[0];
ry(1.9117971738734651) q[20];
cx q[20],q[0];
u2(0,2.622858187503901) q[0];
u2(-pi,-pi) q[20];
u2(0,3*pi/4) q[22];
cswap q[22],q[3],q[9];
ccx q[3],q[20],q[19];
u2(0,-pi) q[3];
cu1(pi/8) q[3],q[7];
ry(6.223383322037425) q[9];
cu1(pi/8) q[9],q[0];
cx q[9],q[19];
cu1(-pi/8) q[19],q[0];
cx q[9],q[19];
cu1(pi/8) q[19],q[0];
cx q[19],q[11];
cu1(-pi/8) q[11],q[0];
cx q[9],q[11];
cu1(pi/8) q[11],q[0];
cx q[19],q[11];
cu1(-pi/8) q[11],q[0];
cx q[9],q[11];
u1(2.606752773564392) q[9];
cu1(pi/8) q[11],q[0];
u3(2.0987063852114893,0.4839828721619872,-0.7640739553375457) q[0];
cu1(pi/8) q[11],q[13];
u1(-0.13012176311957901) q[22];
crx(5.654755084502481) q[23],q[10];
cswap q[21],q[10],q[17];
cp(1.585151040190885) q[4],q[17];
s q[4];
cx q[6],q[4];
cx q[4],q[6];
h q[4];
sdg q[10];
rxx(3.252014202088769) q[10],q[8];
u1(0.1683488237843198) q[8];
cx q[8],q[12];
s q[10];
cx q[11],q[6];
cu1(-pi/8) q[6],q[13];
cx q[11],q[6];
cu1(pi/8) q[6],q[13];
cx q[6],q[18];
u2(0,3*pi/4) q[12];
cx q[4],q[12];
u1(pi/4) q[12];
cu1(-pi/8) q[18],q[13];
cx q[11],q[18];
cu1(pi/8) q[18],q[13];
cx q[6],q[18];
cu1(-pi/8) q[18],q[13];
cx q[11],q[18];
ch q[9],q[11];
u3(6.247872247472405,0.19238438292147197,4.732736485991688) q[11];
cu1(pi/8) q[18],q[13];
u3(0.7369875808525307,-1.5982400286445921,0.9586495786249785) q[13];
ch q[20],q[17];
cu1(pi/2) q[17],q[15];
h q[15];
u2(0,pi/2) q[20];
cu1(pi/2) q[6],q[20];
h q[20];
ch q[21],q[5];
u3(pi,-pi/2,1.7832666384834752) q[5];
cu3(5.157077795500639,1.5485548976453924,3.6008930922749656) q[5],q[16];
cx q[3],q[16];
x q[5];
cu1(5.720599511244998) q[10],q[21];
sdg q[10];
rxx(6.261625169288389) q[10],q[14];
s q[10];
cry(3.5176418043934525) q[10],q[15];
h q[10];
s q[14];
cu1(pi/8) q[15],q[10];
cx q[15],q[18];
cu1(-pi/8) q[16],q[7];
cx q[3],q[16];
cu1(pi/8) q[16],q[7];
cx q[16],q[1];
cu1(-pi/8) q[1],q[7];
cx q[3],q[1];
cu1(pi/8) q[1],q[7];
cx q[16],q[1];
cu1(-pi/8) q[1],q[7];
cx q[3],q[1];
cu1(pi/8) q[1],q[7];
h q[7];
cu3(0.6905962639033414,0.9859643358688135,3.921952245886748) q[7],q[9];
sdg q[9];
cu1(-pi/8) q[18],q[10];
cx q[15],q[18];
cu1(pi/8) q[18],q[10];
cx q[18],q[5];
cu1(-pi/8) q[5],q[10];
cx q[15],q[5];
cu1(pi/8) q[5],q[10];
cx q[18],q[5];
cu1(-pi/8) q[5],q[10];
cx q[15],q[5];
cu1(pi/8) q[5],q[10];
rzz(5.938330138616645) q[5],q[18];
u2(pi/4,-pi) q[5];
h q[10];
u2(0,0) q[18];
rx(3.7102311819892546) q[21];
cx q[22],q[12];
u1(-pi/4) q[12];
cx q[4],q[12];
u1(pi/4) q[12];
ch q[14],q[4];
u2(0,0) q[4];
cx q[4],q[13];
ry(0.8596605113399446) q[4];
cu3(0.08722977146087585,5.9773405750595,2.9184682135791817) q[6],q[14];
u2(-pi/2,pi/2) q[6];
ry(-0.8596605113399446) q[13];
cx q[4],q[13];
u2(-pi,-pi) q[4];
crx(1.3631236777292282) q[11],q[4];
sx q[4];
u1(3.009626519178733) q[13];
u3(1.8203354846515487,-1.663897436350295,-0.6079819669988078) q[14];
cx q[18],q[14];
ry(-2.9198806209815507) q[14];
ry(-2.9198806209815507) q[18];
cx q[18],q[14];
u1(-1.9398108438193393) q[14];
u2(-0.5121801608846264,-pi) q[18];
cx q[22],q[12];
u2(pi/4,3*pi/4) q[12];
cx q[8],q[12];
u2(0,3*pi/4) q[12];
crx(4.836980451111362) q[17],q[8];
u2(pi/2,-pi/2) q[8];
u2(0.6098534007935381,pi/2) q[17];
cswap q[21],q[2],q[12];
u2(pi/4,-pi) q[2];
cx q[1],q[2];
u2(0,3*pi/4) q[2];
cx q[12],q[2];
u1(pi/4) q[2];
cx q[20],q[2];
u1(-pi/4) q[2];
cx q[12],q[2];
u1(pi/4) q[2];
cx q[20],q[2];
u2(pi/4,3*pi/4) q[2];
cx q[1],q[2];
u2(pi/4,-pi) q[1];
u2(0,3*pi/4) q[2];
ch q[13],q[20];
h q[13];
u3(0.4348639455381977,-1.6026967100215792,-2.5495467571959356) q[20];
ch q[21],q[3];
cu1(pi/2) q[7],q[3];
cx q[3],q[5];
tdg q[5];
cx q[15],q[21];
cx q[21],q[15];
ccx q[11],q[21],q[13];
h q[13];
u3(0.7207385106025513,-1.9594563112239136,-2.6489532070335926) q[15];
u3(pi,-pi,2.5968685167380485) q[21];
u3(1.341290867473193,-2.4046941644865085,1.0443566418922696) q[22];
cx q[22],q[1];
tdg q[1];
cx q[2],q[1];
t q[1];
s q[2];
cx q[22],q[1];
u2(0,3*pi/4) q[1];
cz q[1],q[22];
crx(0.28295426738312696) q[11],q[22];
u3(0.3679119809337298,-1.3419179841528008,2.8242151638621085) q[23];
rzz(5.536200438816542) q[19],q[23];
u3(1.5990851979517735,0,0.9702154593090757) q[19];
rzz(4.951939246889875) q[10],q[19];
ch q[10],q[7];
u2(0,0) q[10];
cx q[10],q[18];
ry(2.5634081190846345) q[10];
ry(-2.5634081190846345) q[18];
cx q[10],q[18];
u2(0,0) q[10];
u3(pi,-2.612284570634658,1.041488243839762) q[18];
h q[19];
cx q[8],q[19];
rz(1.8460704603840015) q[19];
cx q[8],q[19];
cy q[8],q[1];
cu3(4.806038622788007,5.390338650626607,2.281331199484481) q[1],q[22];
h q[8];
h q[19];
rxx(2.237351101609687) q[19],q[7];
u3(0.38626763757113497,-0.9942857659347215,2.6047057082216316) q[19];
u2(0,0) q[22];
cx q[22],q[19];
ry(-2.8611218789519604) q[19];
ry(2.8611218789519604) q[22];
cx q[22],q[19];
u1(-1.6104199422869092) q[19];
u2(-pi,-pi) q[22];
u1(0.5889635969963689) q[23];
cx q[0],q[23];
ry(1.5964934936982176) q[0];
ry(-1.5964934936982176) q[23];
cx q[0],q[23];
u2(-pi,-pi/2) q[0];
cx q[0],q[12];
cx q[12],q[0];
cx q[12],q[5];
t q[5];
cx q[3],q[5];
rz(6.01498934766615) q[3];
u2(0,3*pi/4) q[5];
u2(pi/4,-pi) q[12];
cx q[14],q[12];
u2(0,3*pi/4) q[12];
cx q[17],q[0];
cx q[0],q[17];
sdg q[0];
u1(-0.5889635969963689) q[23];
cry(1.4460804685978053) q[16],q[23];
u3(pi,-pi/2,-pi) q[16];
cx q[16],q[4];
cx q[4],q[5];
cx q[5],q[4];
u3(5.09460029095542,-0.24405528449936975,0.24405528449936975) q[5];
swap q[7],q[4];
ch q[5],q[7];
u2(-pi/2,-pi) q[5];
s q[7];
x q[16];
ccx q[13],q[17],q[16];
u3(0.678352047447911,-pi/2,-0.4124822768429226) q[13];
sx q[16];
cx q[18],q[13];
rz(0.7130089253650558) q[13];
cx q[18],q[13];
u2(-pi,-pi) q[13];
cu3(3.8893904415106952,2.595807023971961,2.6773850814478446) q[21],q[17];
s q[17];
sdg q[23];
rxx(5.902478810479298) q[9],q[23];
u2(0,3*pi/4) q[9];
cx q[11],q[9];
h q[9];
cu1(pi/2) q[11],q[9];
u2(0,-pi/2) q[9];
cx q[9],q[17];
cx q[17],q[9];
cx q[9],q[21];
h q[17];
ccx q[18],q[17],q[22];
u3(2.413262818678112,3.818281435297612,-3.818281435297612) q[17];
rz(4.216243711243133) q[18];
cx q[21],q[9];
sdg q[22];
rxx(5.641249855778857) q[22],q[5];
s q[5];
u1(-pi) q[22];
u2(0,0) q[23];
cx q[23],q[2];
cx q[2],q[23];
h q[2];
cx q[2],q[12];
u1(pi/4) q[12];
cx q[6],q[12];
u1(-pi/4) q[12];
cx q[2],q[12];
u1(pi/4) q[12];
cx q[6],q[12];
s q[6];
cx q[6],q[16];
u3(pi,0,-pi) q[6];
u2(pi/4,3*pi/4) q[12];
cx q[14],q[12];
u3(1.516100617049811,-1.7161068153747918,2.290822798305772) q[12];
ccx q[1],q[16],q[12];
u2(pi/4,-3*pi/4) q[1];
u(1.3742032404139184,3.4200813662530303,3.255254129919474) q[14];
cswap q[14],q[4],q[11];
u3(1.2898679517579155,0.39600191493597237,0.2837669447334603) q[4];
crx(2.8276519920871297) q[11],q[19];
sxdg q[11];
cry(2.896748030370742) q[4],q[11];
cz q[14],q[12];
p(0.19581173606218966) q[12];
cu1(pi/2) q[15],q[6];
u1(-pi) q[6];
sxdg q[16];
cp(5.190718646782745) q[16],q[14];
u2(-0.1301111514018931,-1.2692765556582517) q[14];
cy q[16],q[12];
u2(0,0) q[12];
sdg q[16];
sdg q[23];
rxx(2.4000986549445003) q[23],q[0];
s q[0];
ccx q[0],q[3],q[8];
cu1(2.7583222785695165) q[0],q[20];
rz(0.26927600299419546) q[0];
u2(-2.841187265505522,0) q[8];
cry(0.7333266374029811) q[10],q[3];
z q[3];
cx q[3],q[1];
tdg q[1];
cx q[7],q[1];
t q[1];
cx q[3],q[1];
u2(0,3*pi/4) q[1];
sx q[3];
u2(pi/4,-pi) q[7];
cx q[1],q[7];
tdg q[7];
cswap q[19],q[21],q[0];
cry(4.869675476980899) q[17],q[21];
u2(0.974629564837466,2.5761719797045752) q[19];
u1(3.8401563055713464) q[20];
rzz(5.929947920354725) q[6],q[20];
h q[6];
cx q[22],q[3];
swap q[19],q[3];
u2(-pi/2,-pi) q[3];
u1(-2.3656389778472353) q[19];
x q[22];
s q[23];
cy q[23],q[2];
u3(1.9400270663691068,1.432597473701576,-2.85488347647064) q[2];
crz(4.417974419123203) q[5],q[2];
crz(4.911067033364261) q[2],q[21];
cx q[5],q[22];
u(5.239339318975211,6.26704953729603,0.8056885435589735) q[23];
ccx q[23],q[10],q[15];
u3(2.1736345735156952,-1.011456255006689,-2.8765286381110133) q[10];
cu3(4.286944672765803,1.9031818095299375,0.048783850653456466) q[10],q[18];
sdg q[10];
cswap q[15],q[13],q[8];
ccx q[0],q[8],q[6];
swap q[0],q[17];
h q[6];
crz(0.2835852940131401) q[6],q[4];
u2(pi/4,1.6984209947089761) q[6];
u1(2.2593737691785316) q[8];
z q[15];
rxx(0.1298659179546081) q[16],q[10];
u1(pi/2) q[10];
cu1(pi/2) q[4],q[10];
u2(0,0) q[10];
cx q[10],q[19];
ry(0.9160280901995559) q[10];
s q[16];
u1(2.0697726519289272) q[18];
cx q[12],q[18];
ry(-0.9485188624799639) q[12];
ry(-0.9485188624799639) q[18];
cx q[12],q[18];
u2(-pi,-pi) q[12];
cu1(5.843138700117417) q[16],q[12];
u1(-2.0697726519289277) q[18];
ry(-0.9160280901995559) q[19];
cx q[10],q[19];
u2(-pi,-pi) q[10];
u3(pi,2.744171328063624,1.9682176523210657) q[19];
rzz(0.40879755362635645) q[23],q[9];
cx q[9],q[7];
t q[7];
cx q[1],q[7];
u2(-pi/2,3*pi/4) q[7];
cx q[7],q[14];
u2(0,0) q[9];
cx q[9],q[8];
ry(-0.9251006287466872) q[8];
ry(-0.9251006287466872) q[9];
cx q[9],q[8];
u1(-2.2593737691785316) q[8];
rzz(3.714177410995772) q[8],q[17];
u3(0.8095234135806293,0.1660672869153581,2.8784449856891934) q[9];
ccx q[12],q[7],q[8];
ry(5.358520955470168) q[12];
ccx q[13],q[23],q[20];
cswap q[1],q[11],q[13];
cry(0.12118126338059888) q[1],q[0];
ccx q[13],q[2],q[5];
cry(3.0175445436165047) q[1],q[5];
cu1(pi/2) q[1],q[7];
rz(3.245820988478024) q[1];
s q[13];
cx q[13],q[3];
u2(3.725682458622787,5.038988329795634) q[3];
u2(-pi,0.49203652220137917) q[13];
cu1(pi/8) q[12],q[13];
cx q[12],q[19];
cu1(-pi/8) q[19],q[13];
cx q[12],q[19];
cu1(pi/8) q[19],q[13];
u1(3.725538001676108) q[20];
cy q[23],q[15];
cswap q[22],q[15],q[18];
rzz(5.6530911605170235) q[16],q[15];
cu3(5.204283962848544,5.734864516379402,2.990688901832239) q[5],q[15];
h q[15];
cu1(pi/2) q[3],q[15];
u2(0,pi/2) q[15];
u3(1.143251174303253,-pi/4,2.9189702826975257) q[16];
cx q[1],q[16];
tdg q[16];
h q[18];
h q[22];
ccx q[17],q[4],q[22];
h q[4];
u3(0.37507911029838764,-2.458022348392623,2.130687630744162) q[17];
h q[22];
cu1(2.9211312050376304) q[18],q[22];
t q[18];
u2(pi/4,-pi) q[23];
cx q[21],q[23];
u2(0,3*pi/4) q[23];
cx q[20],q[23];
u1(pi/4) q[23];
cx q[11],q[23];
u1(-pi/4) q[23];
cx q[20],q[23];
ccx q[14],q[20],q[2];
ccx q[2],q[10],q[4];
u3(3*pi/4,0,pi/2) q[4];
h q[20];
u1(pi/4) q[23];
cx q[11],q[23];
cy q[11],q[0];
u2(-1.1262024295523148,1.1837848253815482) q[0];
rxx(2.4334395409281173) q[0],q[17];
ccx q[11],q[14],q[20];
h q[11];
cu1(pi/8) q[10],q[11];
cx q[10],q[2];
cu1(-pi/8) q[2],q[11];
cx q[10],q[2];
cu1(pi/8) q[2],q[11];
cx q[2],q[5];
cu1(-pi/8) q[5],q[11];
cx q[10],q[5];
cu1(pi/8) q[5],q[11];
cx q[2],q[5];
sx q[2];
cu1(-pi/8) q[5],q[11];
cx q[10],q[5];
cu1(pi/8) q[5],q[11];
z q[5];
u1(0.9443644582774612) q[10];
cry(1.4109540596607673) q[5],q[10];
u2(pi/2,-pi) q[11];
cp(5.590714878487367) q[9],q[11];
u1(0.7541806904814949) q[11];
cz q[14],q[22];
ch q[14],q[3];
x q[3];
h q[14];
u3(2.251419136074043,0,-pi) q[17];
u3(1.8902864105997266,-1.2911797250478418,-1.0645295714592988) q[20];
cp(4.83313071905391) q[22],q[18];
cu3(1.7250504538437084,4.777203956676947,4.969745096067706) q[22],q[15];
u(0.8924459500002336,1.3273626295231984,6.12325584599632) q[22];
u2(pi/4,3*pi/4) q[23];
cx q[21],q[23];
u2(0,3*pi/4) q[23];
cx q[23],q[6];
tdg q[6];
cx q[21],q[6];
t q[6];
u3(3.0047890330351006,-1.54572306998586,-2.783043231148105) q[21];
cu1(3.8968473613537036) q[21],q[5];
cx q[23],q[6];
u2(pi/2,3*pi/4) q[6];
crx(1.122151436172672) q[8],q[23];
u2(0,0.7230847349357203) q[8];
cx q[19],q[6];
cu1(-pi/8) q[6],q[13];
cx q[12],q[6];
cu1(pi/8) q[6],q[13];
cx q[19],q[6];
cu1(-pi/8) q[6],q[13];
cx q[12],q[6];
cu1(pi/8) q[6],q[13];
u1(-1.3381033344373012) q[6];
cx q[8],q[6];
ry(-0.04323186899641504) q[6];
ry(-0.04323186899641504) q[8];
cx q[8],q[6];
u1(1.5146289990779724) q[6];
u2(-pi,-pi) q[8];
rxx(1.031694436738848) q[8],q[4];
cx q[3],q[4];
cx q[4],q[3];
rxx(5.302269203949774) q[8],q[10];
p(1.3666629442233449) q[12];
u2(pi/4,-pi) q[13];
cu1(pi/2) q[18],q[13];
cy q[18],q[20];
cx q[19],q[16];
t q[16];
cx q[1],q[16];
sx q[1];
crz(0.42407146404523755) q[15],q[1];
u3(1.8502303437939336,-0.4624228279252103,2.666189949129036) q[16];
h q[23];
cx q[7],q[23];
h q[23];
cu1(pi/2) q[7],q[23];
s q[7];
cx q[7],q[2];
cx q[2],q[14];
x q[7];
cu3(0.7008637769657088,2.6629964451205126,5.025077327888956) q[12],q[23];
crx(5.849528541497364) q[12],q[0];
u2(0,0) q[0];
cx q[0],q[6];
ry(-0.9637229577795948) q[0];
ry(-0.9637229577795948) q[6];
cx q[0],q[6];
u2(-pi,-pi) q[0];
u1(0.6088724987567797) q[6];
h q[14];
cu1(pi/2) q[2],q[14];
cp(5.616437727139234) q[2],q[13];
u2(pi/4,-pi) q[14];
cx q[12],q[14];
u2(0,3*pi/4) q[14];
swap q[19],q[7];
u2(0,0) q[7];
cx q[7],q[11];
ry(0.039080985365049795) q[7];
ry(-0.039080985365049795) q[11];
cx q[7],q[11];
u2(-pi,-pi) q[7];
u1(-0.7541806904814949) q[11];
cx q[19],q[14];
u1(pi/4) q[14];
cx q[9],q[14];
u1(-pi/4) q[14];
cx q[19],q[14];
u1(pi/4) q[14];
cx q[9],q[14];
u2(pi/4,3*pi/4) q[14];
cx q[12],q[14];
u2(0,3*pi/4) q[14];
u3(0.01160890354787694,0,0) q[23];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23];
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
measure q[22] -> meas[22];
measure q[23] -> meas[23];