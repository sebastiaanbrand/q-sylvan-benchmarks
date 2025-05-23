// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// Qiskit version: 1.0.2

OPENQASM 2.0;
include "qelib1.inc";
qreg q[23];
creg meas[23];
s q[0];
u3(0.8273367870085527,1.812379643139356,2.7924663036203192) q[1];
u1(1.6609687938827449) q[3];
rx(5.864966885210837) q[6];
u2(0,0) q[7];
tdg q[10];
u2(pi/4,-pi) q[11];
h q[12];
cx q[5],q[12];
h q[12];
cu1(pi/2) q[5],q[12];
u2(-2.350396685598805,2.355329284762364) q[5];
cry(5.196847304624584) q[2],q[13];
sx q[2];
h q[13];
cry(0.9110285368422897) q[14],q[9];
u2(2.8704185852465693,4.6412047322306575) q[9];
crz(0.27841736785903115) q[9],q[3];
h q[15];
cx q[16],q[15];
h q[15];
cu1(pi/2) q[16],q[15];
u3(2.6486453968167414,-1.8803338899102986,1.8803338899102986) q[15];
h q[16];
cx q[10],q[16];
h q[16];
cu1(pi/2) q[10],q[16];
cry(2.6845301397458154) q[10],q[2];
u3(5.937976762063549,3.2440404314539117,1.7604762279470343) q[2];
u2(0,2.554295507354735) q[17];
cx q[6],q[17];
rz(1.4645506429344954) q[17];
cx q[6],q[17];
h q[17];
rzz(2.453068833014572) q[6],q[17];
u3(pi,-pi,pi/2) q[17];
u3(1.5985666798244635,1.8578290617371822,-pi/2) q[18];
sx q[19];
cx q[0],q[19];
u3(0.65415699328713,-2.1338289913340924,0.3153058075801587) q[0];
crx(3.9824402877397977) q[14],q[19];
rz(5.625348551233995) q[14];
u1(0.020746227822597163) q[20];
cx q[7],q[20];
ry(-1.8088051076493177) q[7];
ry(-1.8088051076493177) q[20];
cx q[7],q[20];
u2(-2.421260901700969,-pi) q[7];
u2(0,-0.020746227822595387) q[20];
cx q[20],q[18];
ry(-2.64825467449729) q[18];
ry(-2.64825467449729) q[20];
cx q[20],q[18];
u2(-pi/2,1.283763591852611) q[18];
rxx(4.943066750097003) q[18],q[9];
h q[9];
sdg q[18];
u2(-pi,-pi) q[20];
cx q[21],q[11];
tdg q[11];
cx q[8],q[11];
z q[8];
cu1(pi/2) q[8],q[19];
t q[11];
cx q[21],q[11];
u2(0,3*pi/4) q[11];
cz q[11],q[12];
cswap q[7],q[12],q[20];
cu1(pi/8) q[7],q[1];
cx q[7],q[10];
cu1(-pi/8) q[10],q[1];
cx q[7],q[10];
cu1(pi/8) q[10],q[1];
cx q[10],q[12];
u2(-pi/2,-0.12072423150561207) q[11];
cu1(-pi/8) q[12],q[1];
cx q[7],q[12];
cu1(pi/8) q[12],q[1];
cx q[10],q[12];
cu1(-pi/8) q[12],q[1];
cx q[7],q[12];
ry(3.125659121523028) q[7];
cu1(pi/8) q[12],q[1];
u2(0,-pi) q[1];
cu1(pi/2) q[2],q[1];
u2(pi/2,-pi/2) q[1];
ccx q[14],q[5],q[20];
cx q[0],q[20];
cswap q[5],q[14],q[10];
cx q[20],q[0];
cu1(4.922000266804368) q[0],q[20];
u2(-1.6643787200110323,0) q[0];
u3(1.2422612462072475,-0.8636722785573463,-0.26903848232790883) q[20];
u2(0,0) q[21];
cx q[4],q[22];
u1(1.489895741115495) q[4];
cx q[21],q[4];
ry(-2.4103587426616264) q[4];
ry(-2.4103587426616264) q[21];
cx q[21],q[4];
u1(-1.489895741115495) q[4];
cz q[4],q[16];
p(4.557114673625018) q[4];
cu3(6.02771839731381,2.732773034727302,1.150826711572504) q[16],q[8];
h q[8];
crz(2.367872435593911) q[5],q[8];
sdg q[16];
rxx(6.057040174769852) q[18],q[16];
s q[16];
u3(pi,-pi,-pi/2) q[18];
u2(-pi,-pi) q[21];
cp(4.458303280933144) q[21],q[15];
crz(6.149987115575591) q[15],q[19];
h q[15];
cx q[7],q[15];
cx q[15],q[7];
rx(5.590233885125366) q[15];
cu1(pi/8) q[19],q[9];
cx q[19],q[4];
cu1(-pi/8) q[4],q[9];
cx q[19],q[4];
cu1(pi/8) q[4],q[9];
cx q[4],q[12];
cu1(-pi/8) q[12],q[9];
cx q[19],q[12];
cu1(pi/8) q[12],q[9];
cx q[4],q[12];
cu1(-pi/8) q[12],q[9];
cu1(2.7035376924631196) q[16],q[4];
y q[16];
cx q[19],q[12];
cu1(pi/8) q[12],q[9];
u2(pi/2,-pi) q[9];
u3(1.8642439256652674,0,pi/2) q[12];
u2(-pi/2,pi/2) q[21];
rz(5.076820509783505) q[22];
cry(4.973898923189498) q[13],q[22];
ch q[13],q[6];
y q[6];
cswap q[6],q[14],q[10];
u2(pi/4,-pi) q[6];
cx q[5],q[6];
tdg q[6];
crz(2.4951327774590375) q[10],q[1];
h q[1];
u2(2.4907525990590296,1.8728326657655243) q[13];
h q[14];
cu1(pi/2) q[4],q[14];
h q[14];
rzz(0.4097337081451441) q[14],q[10];
cx q[15],q[1];
h q[1];
cu1(pi/2) q[15],q[1];
cx q[18],q[6];
t q[6];
cx q[5],q[6];
u2(pi/4,-pi) q[5];
u2(0,3*pi/4) q[6];
cry(3.337436683197915) q[6],q[4];
h q[4];
u1(-1.3109243767439884) q[6];
cx q[18],q[5];
tdg q[5];
cx q[16],q[5];
t q[5];
cx q[16],q[4];
h q[4];
cu1(pi/2) q[16],q[4];
u2(0,-pi) q[4];
u1(pi/4) q[16];
cx q[18],q[5];
u2(0,3*pi/4) q[5];
h q[18];
h q[22];
cu1(pi/2) q[3],q[22];
sdg q[3];
rxx(2.5884871722623766) q[17],q[3];
u2(0,-pi/2) q[3];
ccx q[2],q[19],q[3];
u3(2.7554385418524467,1.2500047991161,-2.8208011259109966) q[2];
u2(-pi/2,-pi) q[3];
swap q[15],q[2];
u1(-1.8322471356777914) q[2];
s q[15];
u2(pi/4,-pi/2) q[17];
sdg q[19];
rxx(0.45529085355760135) q[3],q[19];
s q[3];
s q[19];
cz q[3],q[19];
cu1(pi/2) q[19],q[18];
h q[18];
p(0.14633913997576417) q[19];
cx q[21],q[17];
tdg q[17];
cx q[13],q[17];
u3(pi,1.2130054884348418,0.35779083836005476) q[13];
cx q[0],q[13];
ry(0.493268449150241) q[0];
ry(-0.493268449150241) q[13];
cx q[0],q[13];
u2(-pi,-pi) q[0];
u1(2.286378003515006) q[13];
ccx q[13],q[14],q[20];
t q[17];
u2(0,-pi/2) q[20];
cx q[15],q[20];
rxx(5.785131286110796) q[11],q[20];
u2(-pi,-pi) q[15];
cx q[21],q[17];
cy q[9],q[21];
u1(1.7429645829728897) q[9];
cu1(3.178598497383512) q[5],q[9];
u3(1.681839034303282,2.990039239655691,-1.8777699555039187) q[5];
h q[9];
u1(-pi/4) q[17];
ccx q[8],q[7],q[17];
u2(-pi,-pi) q[7];
cx q[7],q[6];
ry(-0.9885381502949185) q[6];
ry(0.9885381502949185) q[7];
cx q[7],q[6];
u1(1.3109243767439889) q[6];
cy q[6],q[18];
cu1(pi/2) q[6],q[16];
u2(-pi,-pi) q[7];
u3(pi,-0.9517753738319317,-2.1898172797578614) q[8];
cu3(3.515322023540707,1.5782718659095798,0.27333525938642017) q[13],q[8];
u2(0,-pi/2) q[8];
cx q[8],q[2];
ry(-0.23221814538536995) q[2];
ry(0.23221814538536995) q[8];
cx q[8],q[2];
u1(-2.8801418447068983) q[2];
u3(1.716213186904181,-0.7095547890652609,0.26503121505375704) q[8];
cy q[13],q[11];
h q[11];
cy q[16],q[6];
h q[6];
h q[17];
u3(1.5330317159843807,-2.7735624383060187,2.773562438306019) q[18];
cz q[21],q[17];
cu1(pi/2) q[17],q[1];
u1(0.4826707425454684) q[1];
u1(5.135988168767603) q[21];
u3(2.9317039507260856,0,0) q[22];
cx q[12],q[22];
u2(-pi/2,pi/2) q[12];
cswap q[12],q[0],q[3];
u3(pi,-pi/2,-pi/2) q[0];
rxx(3.855284788590332) q[12],q[21];
cx q[12],q[5];
rz(4.922132731873485) q[5];
cx q[12],q[5];
u2(0,-pi/2) q[5];
s q[12];
cx q[12],q[5];
u3(2.625546432473971,-1.1154915110524257,1.7737363110944626) q[5];
u2(-pi,-pi) q[12];
ccx q[17],q[3],q[4];
u2(-2.3141610377527857,-pi) q[4];
cy q[19],q[17];
u3(1.5682870707732905,-0.0018345550086280582,-3.1415903519038384) q[17];
cx q[2],q[17];
rz(5.664166523141638) q[17];
cx q[2],q[17];
h q[17];
cu3(1.2603324309073707,5.162592214757015,2.5755719150473944) q[17],q[8];
u2(0,-pi/2) q[8];
s q[17];
u3(3.0998682664225266,3.1387681629748467,3.0452133821518217) q[19];
cu3(1.149028848990529,5.197874076082234,0.5437471273172796) q[19],q[16];
u2(pi/4,-pi) q[16];
swap q[21],q[3];
u2(2.201232793240197,-pi) q[3];
h q[21];
tdg q[22];
rzz(4.027911902703024) q[10],q[22];
h q[10];
cu1(pi/8) q[7],q[10];
cx q[7],q[14];
cu1(-pi/8) q[14],q[10];
cx q[7],q[14];
cu1(pi/8) q[14],q[10];
cx q[14],q[22];
cu1(-pi/8) q[22],q[10];
cx q[7],q[22];
cu1(pi/8) q[22],q[10];
cx q[14],q[22];
cu3(0.6435379416313662,4.6381443501044215,0.9569892645981921) q[4],q[14];
u2(0,0.12010321587470951) q[4];
cu1(pi/8) q[13],q[4];
cx q[13],q[20];
h q[14];
cu1(-pi/8) q[20],q[4];
cx q[13],q[20];
cu1(pi/8) q[20],q[4];
cx q[20],q[18];
cu1(-pi/8) q[18],q[4];
cx q[13],q[18];
cu1(pi/8) q[18],q[4];
cx q[20],q[18];
cu1(-pi/8) q[18],q[4];
cx q[13],q[18];
cu1(pi/2) q[2],q[13];
cu1(pi/8) q[18],q[4];
h q[4];
cx q[20],q[5];
tdg q[5];
cu1(-pi/8) q[22],q[10];
cx q[7],q[22];
u3(3.7769367415395863,3.5911571444609627,3.9818089293257306) q[7];
cp(4.706732754646426) q[7],q[0];
cu3(5.142920771025165,2.1986248830970574,4.548979753109472) q[0],q[21];
cry(0.07252864068885576) q[0],q[11];
cx q[7],q[12];
u3(0.7843112114751609,2.6503166640089457,1.9034305338723891) q[11];
rz(3.3857877848818543) q[12];
cx q[7],q[12];
u2(2.568763326600303,-pi) q[12];
rzz(4.732714927052355) q[0],q[12];
cu1(pi/8) q[22],q[10];
h q[10];
ch q[10],q[9];
tdg q[9];
h q[10];
cx q[10],q[6];
rz(5.504196595741835) q[6];
cx q[10],q[6];
cx q[10],q[5];
t q[5];
cu1(pi/2) q[18],q[6];
u2(-pi/2,-pi) q[6];
u3(2.0938550065267103,-1.0704448949755223,-2.071147758614271) q[18];
cx q[20],q[5];
u2(0,3*pi/4) q[5];
cu1(pi/2) q[22],q[15];
h q[15];
cx q[15],q[14];
h q[14];
cu1(pi/2) q[15],q[14];
u1(-pi/2) q[14];
sdg q[15];
rxx(5.571209279110489) q[15],q[14];
u1(-pi) q[14];
u2(0,0) q[15];
cx q[15],q[14];
cx q[14],q[15];
h q[14];
cx q[20],q[14];
u1(-pi) q[14];
rz(6.249028613334083) q[20];
y q[22];
ccx q[1],q[9],q[22];
u2(pi/4,-pi) q[1];
cx q[9],q[16];
u2(0,3*pi/4) q[16];
cx q[3],q[16];
u1(pi/4) q[16];
cx q[19],q[16];
u1(-pi/4) q[16];
cx q[3],q[16];
cx q[3],q[13];
cx q[13],q[3];
h q[3];
cu1(pi/2) q[0],q[3];
h q[3];
u1(pi/4) q[16];
crx(3.0104240913681877) q[18],q[0];
h q[0];
cx q[19],q[16];
swap q[10],q[19];
u2(pi/4,3*pi/4) q[16];
cx q[9],q[16];
sxdg q[9];
u2(-pi/2,3*pi/4) q[16];
rxx(2.8445455802783894) q[6],q[16];
s q[6];
u3(1.8629053110421772,2.7543933291918927,-2.008280608088345) q[16];
cx q[21],q[1];
u2(0,3*pi/4) q[1];
cx q[7],q[1];
u1(pi/4) q[1];
cx q[4],q[1];
u1(-pi/4) q[1];
cx q[7],q[1];
u1(pi/4) q[1];
cx q[4],q[1];
u2(pi/4,3*pi/4) q[1];
s q[4];
u2(0,-pi/2) q[7];
cx q[7],q[17];
cx q[8],q[4];
cx q[4],q[8];
h q[4];
u2(pi/4,-pi) q[8];
cx q[12],q[8];
tdg q[8];
cx q[17],q[7];
u2(pi/4,-pi) q[7];
cx q[13],q[7];
u2(0,3*pi/4) q[7];
cx q[6],q[7];
u1(pi/4) q[7];
cx q[10],q[7];
u1(-pi/4) q[7];
cx q[6],q[7];
u1(pi/4) q[7];
cx q[10],q[7];
u2(pi/4,3*pi/4) q[7];
cx q[13],q[7];
u3(2.6493666002558065,0.5508696641139679,pi/4) q[7];
u1(-0.9664559559807979) q[13];
u1(-pi) q[17];
cx q[17],q[13];
ry(-1.2146924671095192) q[13];
ry(1.2146924671095192) q[17];
cx q[17],q[13];
u3(1.1736827148731748,1.1023225123443527,-1.4452027801697676) q[13];
crz(0.4413226390369919) q[16],q[13];
u2(-pi,-pi) q[17];
cx q[21],q[1];
u2(0,3*pi/4) q[1];
swap q[5],q[1];
cx q[5],q[8];
u3(0.4658790510647626,-2.194647769554752,-2.308927728981473) q[5];
t q[8];
cx q[12],q[8];
u2(0,3*pi/4) q[8];
ccx q[8],q[20],q[12];
cu3(5.26375690297141,3.50123218467502,4.172100840595829) q[7],q[8];
cswap q[15],q[21],q[2];
cu3(5.9191545824792,3.2063150947089687,5.538435941062146) q[2],q[4];
u3(1.8195056778111205,-0.539798656259121,-0.6494785687662215) q[2];
cu1(1.9304185457267804) q[2],q[5];
rzz(0.12574600318265342) q[2],q[13];
y q[2];
swap q[15],q[9];
swap q[3],q[15];
cu1(3.053812760544332) q[6],q[9];
cu1(3.9584197013049276) q[3],q[9];
u1(2.246204785170522) q[3];
ch q[12],q[6];
tdg q[12];
cy q[19],q[1];
ccx q[1],q[4],q[10];
u2(0,-pi) q[1];
t q[4];
u3(pi,3*pi/4,0) q[10];
rxx(0.42490847770084933) q[11],q[4];
h q[11];
sdg q[19];
rxx(2.807019919994607) q[14],q[19];
s q[14];
s q[19];
ccx q[19],q[14],q[0];
h q[0];
cu1(pi/2) q[0],q[1];
u2(0,-pi/2) q[0];
swap q[7],q[14];
cp(5.469947402739597) q[16],q[7];
u1(2.5683474712799015) q[16];
h q[19];
ccx q[6],q[9],q[19];
u2(0,0) q[6];
u2(pi/4,-pi) q[9];
cx q[1],q[9];
u2(0,3*pi/4) q[9];
cx q[4],q[9];
u1(pi/4) q[9];
cx q[3],q[9];
u1(-pi/4) q[9];
cx q[4],q[9];
cu1(pi/8) q[4],q[0];
u1(pi/4) q[9];
cx q[3],q[9];
u2(pi/4,-pi) q[3];
u2(pi/4,3*pi/4) q[9];
cx q[1],q[9];
u3(pi,pi/2,-3*pi/4) q[9];
cx q[9],q[16];
ry(-2.0868545108788497) q[9];
ry(-2.0868545108788497) q[16];
cx q[9],q[16];
u2(-pi,-pi) q[9];
u2(0,0.5732451823098925) q[16];
h q[19];
cu1(0.08215959307910102) q[19],q[10];
cx q[4],q[19];
crx(6.213255284042808) q[10],q[13];
rz(2.0890538027827015) q[10];
u3(pi,0,pi/2) q[13];
cu1(-pi/8) q[19],q[0];
cx q[4],q[19];
cu1(pi/8) q[19],q[0];
cx q[20],q[18];
u2(-pi/2,1.4351794146781787) q[22];
ch q[21],q[22];
u1(5.495695691996359) q[21];
rzz(0.8200245535364928) q[21],q[15];
cp(0.034810388035532526) q[21],q[20];
cu1(2.229244736992953) q[5],q[21];
cx q[19],q[5];
cu1(-pi/8) q[5],q[0];
cx q[4],q[5];
cu1(pi/8) q[5],q[0];
cx q[19],q[5];
cu1(-pi/8) q[5],q[0];
cx q[4],q[5];
cu1(pi/8) q[5],q[0];
h q[0];
u2(0,-pi/2) q[5];
p(6.254474076869609) q[20];
u2(6.192490852594567,0.9403922958015752) q[22];
rzz(2.21879255497351) q[22],q[17];
crz(4.908176967222506) q[17],q[8];
cry(0.5289241697664371) q[14],q[8];
cu1(1.9605361019834837) q[1],q[14];
cx q[1],q[16];
h q[16];
cu1(pi/2) q[1],q[16];
tdg q[17];
cswap q[18],q[15],q[22];
cu1(pi/2) q[15],q[11];
h q[11];
cu3(5.853596596167231,0.5139819104794644,0.22818231596551253) q[20],q[18];
cu3(3.524154287504474,2.691117772150687,2.3416852590474986) q[7],q[20];
t q[7];
cx q[7],q[16];
cu1(pi/2) q[7],q[13];
crz(5.694562516769858) q[8],q[18];
u2(1.323061284834563,-pi) q[8];
u1(-pi/2) q[13];
cu1(0.6104921506527751) q[18],q[9];
cu1(pi/2) q[16],q[18];
u3(2.318556490451301,1.107355751450295,0.6411950566959983) q[16];
u2(pi/4,-pi) q[20];
u1(0.20106742201219419) q[22];
cx q[6],q[22];
ry(-0.0537537231007807) q[6];
ry(-0.0537537231007807) q[22];
cx q[6],q[22];
u2(-pi,-pi) q[6];
cx q[6],q[3];
u2(0,3*pi/4) q[3];
cx q[15],q[3];
u1(pi/4) q[3];
cx q[11],q[3];
u1(-pi/4) q[3];
cx q[15],q[3];
u1(pi/4) q[3];
cx q[11],q[3];
u2(pi/4,3*pi/4) q[3];
cx q[6],q[3];
u2(0,-3*pi/4) q[3];
s q[6];
cx q[6],q[3];
sdg q[3];
x q[6];
cx q[11],q[20];
u1(pi/4) q[15];
u2(0,3*pi/4) q[20];
cx q[4],q[20];
u1(pi/4) q[20];
cx q[14],q[20];
u1(-pi/4) q[20];
cx q[4],q[20];
cu1(pi/2) q[9],q[4];
u1(pi/4) q[20];
cx q[14],q[20];
rx(2.604210010408032) q[14];
u2(pi/4,3*pi/4) q[20];
cx q[11],q[20];
cu3(1.9615016398905107,6.1768690382429385,1.5149150705535257) q[6],q[11];
cu3(2.4559421369474372,3.7805157781642875,0.12705406750904324) q[8],q[6];
s q[6];
u2(pi/4,-pi) q[11];
u2(0,3*pi/4) q[20];
u1(-0.20106742201219419) q[22];
ccx q[17],q[22],q[21];
ch q[17],q[2];
rxx(5.790507651783996) q[2],q[17];
u3(2.2881375084599633,-2.8052649550122117,0) q[2];
cx q[15],q[2];
ry(-0.05572242955383659) q[2];
ry(-0.05572242955383659) q[15];
cx q[15],q[2];
u2(pi/2,1.2344686282173152) q[2];
u3(1.9116669310624006,0,0) q[15];
s q[21];
cx q[5],q[21];
cx q[21],q[5];
h q[5];
cx q[10],q[5];
h q[5];
cu1(pi/2) q[10],q[5];
u2(pi/4,-pi) q[10];
rzz(5.467170905077818) q[14],q[5];
u2(0,-pi/2) q[5];
cx q[5],q[6];
cx q[6],q[5];
h q[6];
u1(pi/4) q[21];
cx q[1],q[21];
u2(0,3*pi/4) q[21];
cx q[20],q[21];
u1(pi/4) q[21];
h q[22];
cu1(pi/8) q[19],q[22];
cx q[19],q[12];
cu1(-pi/8) q[12],q[22];
cx q[19],q[12];
cu1(pi/8) q[12],q[22];
cx q[12],q[0];
cu1(-pi/8) q[0],q[22];
cx q[19],q[0];
cu1(pi/8) q[0],q[22];
cx q[12],q[0];
cu1(-pi/8) q[0],q[22];
cx q[19],q[0];
cu1(pi/8) q[0],q[22];
cu1(pi/2) q[0],q[12];
p(4.7635670763236995) q[0];
u3(1.0211490549823339,pi/2,-pi/2) q[12];
cu3(0.48356107777515367,3.7962243643491047,0.7554746450890506) q[0],q[12];
h q[12];
cx q[5],q[12];
rz(0.1349053279176287) q[12];
cx q[5],q[12];
h q[12];
sdg q[19];
rxx(5.162226258848205) q[3],q[19];
s q[3];
cx q[3],q[10];
tdg q[10];
s q[19];
cx q[19],q[11];
tdg q[11];
cx q[17],q[11];
t q[11];
h q[17];
cx q[19],q[11];
u2(-pi/2,-pi/4) q[11];
cx q[5],q[11];
u3(1.1180251749033356,1.4692484825274423,2.359344638746837) q[19];
rxx(1.331682425112953) q[19],q[13];
u2(0,-pi/2) q[13];
u1(-pi/2) q[19];
h q[22];
cx q[22],q[21];
u1(-pi/4) q[21];
cx q[20],q[21];
u2(pi/4,-pi) q[20];
cx q[4],q[20];
tdg q[20];
cx q[9],q[20];
u1(5.035741707212887) q[9];
t q[20];
cx q[4],q[20];
u3(1.3160484953504985,1.647624007378873,0.32361601436285037) q[4];
u2(0,3*pi/4) q[20];
cx q[20],q[17];
h q[17];
cu1(pi/2) q[20],q[17];
cz q[17],q[6];
sdg q[6];
cry(2.565716737441561) q[15],q[17];
ch q[11],q[15];
s q[20];
cx q[20],q[13];
rz(3.361487029384078) q[13];
cx q[20],q[13];
h q[13];
u1(5.681629484986608) q[20];
u1(pi/4) q[21];
cx q[22],q[21];
u2(pi/4,3*pi/4) q[21];
cx q[1],q[21];
cx q[1],q[10];
u3(3.728082016767329,2.6160582134625905,-2.6160582134625905) q[1];
t q[10];
cx q[3],q[10];
ccx q[7],q[3],q[8];
u3(0.7251650287691658,0.8105384911796483,-1.3138898141748965) q[3];
swap q[7],q[0];
s q[0];
cx q[4],q[0];
cx q[0],q[4];
u1(-2.2059587260592135) q[0];
u2(1.727356424337973,pi/2) q[4];
u2(2.2527980209520333,pi/2) q[7];
crx(1.4018208983042588) q[9],q[8];
rz(5.4209241862562445) q[8];
u2(0,3*pi/4) q[10];
swap q[10],q[14];
u3(1.9912784540946646,-1.122636265752519,-2.018956387837274) q[10];
cu1(0.9186755361331901) q[10],q[17];
swap q[10],q[11];
u3(pi,-pi,pi/2) q[14];
rxx(5.654755084502481) q[14],q[6];
u1(2.0060862754419126) q[6];
u2(0,1.6965380825839311) q[14];
cx q[14],q[4];
ry(-1.0274366467730753) q[4];
ry(-1.0274366467730753) q[14];
cx q[14],q[4];
u1(2.9850325560467166) q[4];
u2(-pi,pi/2) q[14];
u2(0,3*pi/4) q[21];
rxx(5.1916906653000945) q[21],q[22];
ry(3.8351889910355066) q[21];
cx q[1],q[21];
cx q[21],q[1];
u2(pi/2,2.242661848645441) q[1];
ccx q[12],q[21],q[9];
cry(0.35036204201228127) q[5],q[21];
cx q[5],q[0];
h q[0];
cu1(pi/2) q[5],q[0];
u1(pi/2) q[0];
cx q[0],q[14];
u2(-pi,-pi) q[0];
y q[5];
u2(0,0) q[9];
cx q[9],q[6];
ry(-0.9187300120532261) q[6];
ry(0.9187300120532261) q[9];
cx q[9],q[6];
u1(-0.4352899486470161) q[6];
cswap q[6],q[21],q[1];
u1(-2.2630775985015363) q[6];
u2(-pi,-pi) q[9];
crx(4.1000151280847605) q[9],q[17];
u(2.0864092063225748,5.6219269491717485,5.962987580869692) q[9];
cu1(2.6759532811131526) q[13],q[12];
u1(-3*pi/4) q[12];
t q[13];
cy q[13],q[11];
h q[14];
h q[17];
t q[21];
rzz(0.029108939256269936) q[22],q[18];
x q[18];
rzz(1.5299985069170676) q[16],q[18];
cx q[18],q[8];
crx(4.482058572683729) q[7],q[8];
tdg q[7];
rz(0.4720013230665154) q[8];
u3(2.7395975925206515,-1.4832018251814012,-1.5803205466192642) q[18];
ccx q[7],q[12],q[18];
rx(4.451230904026963) q[7];
u2(pi/4,-pi) q[18];
y q[22];
cu1(pi/2) q[22],q[2];
ccx q[19],q[16],q[2];
u(0.08893335220964431,5.7112830423761975,0.8735072073371047) q[2];
cry(5.8259362968715305) q[2],q[4];
swap q[13],q[4];
rz(5.284860527114168) q[16];
cz q[1],q[16];
cswap q[9],q[8],q[1];
u3(0.7594781504422635,5.4624388992719775,0.48793756730843) q[1];
p(6.077230478817806) q[8];
u2(-pi/2,0) q[16];
cu1(pi/2) q[20],q[19];
u1(pi/2) q[19];
h q[20];
cx q[10],q[20];
rz(1.5762490618871035) q[20];
cx q[10],q[20];
h q[20];
h q[22];
cx q[3],q[22];
rz(2.3661455902582555) q[22];
cx q[3],q[22];
u(2.1884883783102658,4.9270092916743105,2.9201654642896124) q[3];
u2(0,-pi) q[22];
cu1(pi/2) q[15],q[22];
p(0.73419202585131) q[15];
cu3(0.3494237493588702,5.179792723353612,1.2080861833115961) q[15],q[3];
ccx q[15],q[10],q[14];
h q[14];
cx q[6],q[14];
u2(pi/4,-pi) q[14];
s q[15];
cswap q[20],q[2],q[3];
h q[3];
cu3(5.721582835498408,2.198450559363846,6.1890166146456504) q[8],q[2];
h q[2];
s q[8];
cx q[13],q[3];
h q[3];
cu1(pi/2) q[13],q[3];
u1(1.995377125645037) q[3];
t q[20];
cu1(pi/8) q[20],q[2];
cx q[20],q[16];
cu1(-pi/8) q[16],q[2];
cx q[20],q[16];
cu1(pi/8) q[16],q[2];
cx q[16],q[13];
cu1(-pi/8) q[13],q[2];
cx q[20],q[13];
cu1(pi/8) q[13],q[2];
cx q[16],q[13];
cu1(-pi/8) q[13],q[2];
cx q[20],q[13];
cu1(pi/8) q[13],q[2];
h q[2];
ch q[13],q[8];
u3(1.403326222159139,-2.6966036507860576,-2.4311035979457154) q[13];
cu1(pi/2) q[22],q[17];
h q[17];
ccx q[17],q[11],q[21];
cry(5.536200438816542) q[11],q[4];
cx q[4],q[14];
tdg q[14];
cx q[6],q[14];
t q[14];
cx q[4],q[14];
u2(0,3*pi/4) q[14];
cx q[17],q[18];
tdg q[18];
cx q[21],q[18];
t q[18];
cx q[17],q[18];
u2(0,3*pi/4) q[18];
crx(1.6805973579276898) q[18],q[7];
cy q[7],q[20];
u2(0,0) q[18];
u3(1.356279935830272,1.768996848662808,1.5727967572899626) q[20];
u3(0.8748135973880526,2.9257864589372238,-0.6273616379503748) q[21];
cx q[18],q[21];
ry(-0.3912652741572694) q[18];
ry(-0.3912652741572694) q[21];
cx q[18],q[21];
u2(-pi,-pi) q[18];
u1(-1.238448563394785) q[21];
cu1(pi/8) q[22],q[0];
cx q[22],q[19];
cu1(-pi/8) q[19],q[0];
cx q[22],q[19];
cu1(pi/8) q[19],q[0];
cx q[19],q[5];
cu1(-pi/8) q[5],q[0];
cx q[22],q[5];
cu1(pi/8) q[5],q[0];
cx q[19],q[5];
cu1(-pi/8) q[5],q[0];
ch q[19],q[12];
cx q[11],q[19];
cx q[19],q[11];
u2(pi/4,-pi) q[11];
cx q[3],q[11];
tdg q[11];
u2(0,0) q[19];
cx q[22],q[5];
cu1(pi/8) q[5],q[0];
u2(0,-pi/2) q[0];
h q[5];
cx q[9],q[5];
h q[5];
cu1(pi/2) q[9],q[5];
u2(-0.5245012200097636,0) q[9];
cx q[15],q[0];
u2(3.365902572200827,5.239409341450189) q[0];
cx q[0],q[11];
h q[0];
t q[11];
cx q[3],q[11];
cx q[3],q[18];
u2(0,3*pi/4) q[11];
x q[15];
cy q[1],q[15];
cx q[2],q[1];
x q[2];
crz(3.509175909992422) q[14],q[1];
u(2.482778569932634,1.4243841952904288,1.2668398253185111) q[1];
u3(2.596868516738048,0,pi/2) q[14];
u2(0.4007359321432995,-0.8573132613165457) q[15];
ch q[17],q[5];
u1(2.4043301793260907) q[5];
u2(pi/4,-pi) q[17];
cx q[6],q[17];
tdg q[17];
cx q[18],q[3];
u3(pi,-0.9889187597884512,2.5597150865833473) q[3];
h q[18];
cx q[19],q[5];
ry(-0.5130723445148335) q[5];
ry(0.5130723445148335) q[19];
cx q[19],q[5];
u1(-2.4043301793260916) q[5];
cu1(pi/2) q[8],q[5];
u2(-pi/2,pi/2) q[5];
u2(-pi,-pi) q[19];
cp(4.511161369168738) q[22],q[10];
u3(1.5504488211878986,pi/2,0.8333618934048599) q[10];
cu3(6.082455505834963,5.845249545579695,4.626734993644932) q[10],q[11];
cu3(2.6301935300751937,5.6006654101065125,4.7025427144224325) q[11],q[10];
u2(-pi/2,-pi/2) q[10];
u1(4.263876645660328) q[11];
cry(0.8799041633094143) q[22],q[12];
h q[12];
cx q[16],q[12];
rz(0.19238438292147197) q[12];
cx q[16],q[12];
u2(2.220305994045119,-pi) q[12];
u(5.938330138616645,4.462849822528038,5.821069680599746) q[16];
cx q[16],q[18];
rz(1.2390984515700998) q[18];
cx q[16],q[18];
u2(0,-pi) q[18];
cx q[22],q[17];
t q[17];
cx q[6],q[17];
ch q[6],q[21];
ccx q[12],q[21],q[13];
rxx(4.888774583689245) q[12],q[16];
u2(0.6783520474479109,1.1583140499519742) q[12];
u2(0,-pi) q[13];
u1(-2.0350038989368446) q[16];
u2(0,3*pi/4) q[17];
cu1(pi/2) q[17],q[0];
h q[0];
cu1(pi/8) q[0],q[4];
cx q[0],q[8];
cu1(-pi/8) q[8],q[4];
cx q[0],q[8];
cu1(pi/8) q[8],q[4];
cx q[8],q[6];
cu1(-pi/8) q[6],q[4];
cx q[0],q[6];
cu1(pi/8) q[6],q[4];
cx q[8],q[6];
cu1(-pi/8) q[6],q[4];
cx q[0],q[6];
cu1(pi/8) q[6],q[4];
h q[4];
cu1(pi/2) q[4],q[7];
ch q[4],q[11];
u2(0,-pi/2) q[4];
cu1(pi/2) q[6],q[18];
u1(-pi/2) q[7];
u3(pi,-pi,2.2320480262796005) q[8];
rxx(0.09067102110963807) q[9],q[17];
cu1(pi/2) q[9],q[13];
u3(1.3267410422955268,0.0936496424033173,-0.8928466565529796) q[9];
cx q[4],q[9];
cx q[9],q[4];
x q[4];
h q[9];
z q[11];
u2(pi/4,-pi) q[17];
cx q[1],q[17];
tdg q[17];
cx q[0],q[17];
u3(pi,-pi/2,0) q[0];
rxx(2.7583222785695165) q[14],q[0];
u1(-pi/2) q[0];
u1(pi/2) q[14];
t q[17];
cx q[1],q[17];
u1(-pi/4) q[17];
u2(0,-pi) q[18];
cx q[13],q[18];
h q[18];
cu1(pi/2) q[13],q[18];
sdg q[13];
u1(-pi/2) q[18];
rxx(5.968032411895262) q[13],q[18];
u1(-pi/2) q[13];
u1(1.4253693460199743) q[18];
cy q[4],q[18];
crz(2.533610686590986) q[19],q[22];
h q[21];
cx q[5],q[21];
h q[21];
cu1(pi/2) q[5],q[21];
crz(2.281331199484481) q[6],q[5];
u(5.923491950473281,0.7130089253650558,2.841187265505522) q[5];
u2(pi/4,-pi) q[6];
cx q[7],q[6];
u2(0,3*pi/4) q[6];
u2(0,0) q[21];
cx q[21],q[16];
ry(-1.2979035119859805) q[16];
ry(-1.2979035119859805) q[21];
cx q[21],q[16];
u1(2.0350038989368446) q[16];
cu1(3.098170514088518) q[16],q[12];
ch q[5],q[12];
s q[5];
swap q[5],q[4];
u2(-pi,-pi) q[21];
u2(pi/4,-pi) q[22];
cx q[15],q[22];
u2(0,3*pi/4) q[22];
cx q[2],q[22];
u1(pi/4) q[22];
cx q[19],q[22];
u1(-pi/4) q[22];
cx q[2],q[22];
u2(pi/2,2.0184065603916697) q[2];
u1(pi/4) q[22];
cx q[19],q[22];
u2(0,0) q[19];
cx q[19],q[3];
ry(-2.424485321091562) q[3];
ry(-2.424485321091562) q[19];
cx q[19],q[3];
u1(0.407041192782005) q[3];
u2(-pi,-pi) q[19];
u2(pi/4,3*pi/4) q[22];
cx q[15],q[22];
u2(0,0) q[15];
cx q[15],q[20];
ry(1.473779436146241) q[15];
ry(-1.473779436146241) q[20];
cx q[15],q[20];
u3(1.7063539619377692,-2.6902164317046413,0.1312912125492991) q[15];
crx(3.8401563055713464) q[8],q[15];
rzz(3.755199629077634) q[0],q[15];
u3(1.7854173824182749,-1.4962055807776284,-2.063437685127693) q[8];
u2(1.6115468708342335,5.8801089873885495) q[15];
cy q[5],q[15];
u1(2.3448303608515637) q[5];
u1(2.950482321250419) q[20];
ccx q[20],q[3],q[19];
u1(0.7651077832359232) q[3];
cx q[2],q[3];
ry(3.133524768648015) q[2];
ry(-3.133524768648015) q[3];
cx q[2],q[3];
u2(-pi,-pi/2) q[2];
cry(1.1880233935437035) q[2],q[12];
h q[2];
cu1(pi/2) q[0],q[2];
u3(0.6781298965797552,-2.425592398054728,2.701794875459509) q[2];
u1(-0.7651077832359232) q[3];
cp(4.783966963510564) q[4],q[0];
t q[0];
cp(5.239339318975211) q[19],q[21];
cz q[16],q[19];
u3(1.1509682119111673,0.46614547319897603,-0.8899019986210739) q[16];
cx q[16],q[5];
ry(-0.5670878140658748) q[5];
ry(0.5670878140658748) q[16];
cx q[16],q[5];
u1(-2.3448303608515637) q[5];
u2(-pi,-pi) q[16];
u3(pi,-pi/2,0) q[19];
t q[21];
u2(0,-3*pi/4) q[22];
ccx q[22],q[1],q[17];
h q[17];
cu3(0.13948666542990537,5.722243757903921,6.243561691687574) q[17],q[20];
ccx q[9],q[3],q[17];
ccx q[3],q[13],q[9];
h q[9];
h q[17];
cx q[22],q[6];
u1(pi/4) q[6];
cx q[1],q[6];
u1(-pi/4) q[6];
cx q[22],q[6];
u1(pi/4) q[6];
cx q[1],q[6];
cx q[1],q[17];
u2(pi/4,3*pi/4) q[6];
cx q[7],q[6];
u2(0,3*pi/4) q[6];
s q[7];
ccx q[10],q[20],q[6];
cu1(pi/2) q[6],q[20];
u3(1.330171475678899,1.7128131438492202,-2.8184215325718416) q[6];
cu3(4.481152002640207,1.9841348272878572,5.736466077952092) q[6],q[8];
ccx q[5],q[0],q[6];
sdg q[5];
rz(5.3998709743359) q[17];
cx q[1],q[17];
cx q[1],q[13];
u3(1.9404055173111059,-0.9934392683607753,0.9934392683607753) q[1];
u3(2.9767681483968285,1.6919775901754948,-pi/2) q[13];
cu3(4.918024527583518,2.6744201366429095,2.8720875317093553) q[13],q[15];
h q[17];
u2(-pi/2,pi/2) q[20];
cx q[22],q[11];
cx q[11],q[22];
cx q[10],q[22];
cu1(pi/8) q[10],q[9];
cu1(pi/8) q[11],q[14];
cx q[11],q[7];
cu1(-pi/8) q[7],q[14];
cx q[11],q[7];
cu1(pi/8) q[7],q[14];
cx q[7],q[21];
cu1(5.2448052187979055) q[12],q[22];
cx q[19],q[12];
u2(pi/4,-1.1116432626478954) q[12];
cu1(-pi/8) q[21],q[14];
cx q[11],q[21];
cu1(pi/8) q[21],q[14];
cx q[7],q[21];
h q[7];
cx q[17],q[7];
h q[7];
cu1(pi/2) q[17],q[7];
u3(1.8372882095991319,-2.010842933857066,2.0108429338570666) q[7];
u2(0,pi/2) q[17];
cu1(pi/2) q[4],q[17];
cx q[4],q[12];
tdg q[12];
u2(pi/2,-pi) q[17];
cu1(-pi/8) q[21],q[14];
cx q[11],q[21];
u2(pi/4,-pi) q[11];
cx q[3],q[11];
tdg q[11];
cx q[18],q[11];
t q[11];
cx q[3],q[11];
u1(4.949270728132468) q[3];
u2(0,3*pi/4) q[11];
ccx q[13],q[11],q[15];
h q[11];
h q[15];
cu1(pi/2) q[0],q[15];
h q[15];
sdg q[18];
cu1(pi/8) q[21],q[14];
cx q[10],q[21];
h q[14];
cu1(-pi/8) q[21],q[9];
cx q[10],q[21];
cu1(pi/8) q[21],q[9];
cx q[21],q[14];
cu1(-pi/8) q[14],q[9];
cx q[10],q[14];
cu1(pi/8) q[14],q[9];
cx q[21],q[14];
cu1(-pi/8) q[14],q[9];
cx q[10],q[14];
z q[10];
crx(4.346750760670928) q[1],q[10];
u1(-0.2612598536042148) q[1];
cx q[2],q[1];
ry(-2.8265455802585118) q[1];
ry(2.8265455802585118) q[2];
cx q[2],q[1];
u1(0.2612598536042148) q[1];
u2(-pi,-pi) q[2];
cx q[10],q[12];
s q[10];
t q[12];
cx q[4],q[12];
sdg q[4];
rxx(4.332637173688822) q[4],q[5];
s q[4];
s q[5];
u2(0,3*pi/4) q[12];
cu1(pi/2) q[13],q[12];
cu1(pi/8) q[14],q[9];
u2(-pi/2,-pi) q[9];
rxx(5.723088953577587) q[9],q[18];
s q[9];
u2(0,-pi/2) q[18];
cu1(pi/2) q[3],q[18];
h q[18];
rxx(5.652658666079441) q[19],q[14];
cy q[14],q[8];
rxx(1.6643226100864696) q[14],q[8];
sx q[19];
cx q[17],q[19];
u2(-pi,-pi) q[17];
cx q[2],q[17];
rz(1.4170088188622796) q[17];
cx q[2],q[17];
h q[17];
sx q[19];
cx q[10],q[19];
x q[10];
cu1(5.836980980008532) q[20],q[21];
sx q[20];
rzz(0.051000703629116524) q[20],q[16];
u2(3.725682458622787,5.038988329795634) q[20];
sdg q[21];
ccx q[7],q[18],q[21];
rxx(1.0699707547290316) q[6],q[18];
u1(2.0257499994649404) q[22];
rxx(0.04338079532426075) q[9],q[22];
h q[9];
ccx q[22],q[3],q[9];
ccx q[1],q[22],q[11];
crx(1.122151436172672) q[3],q[7];
h q[9];
h q[11];
crx(2.0813598370797446) q[16],q[9];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22];
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