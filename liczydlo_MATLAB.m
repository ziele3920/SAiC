clear

%%%%% dane tranzystora %%%%
B0=200;
kat = 26.5*10^(-3);
UY = 100;
UBEQ = 0.65;
UCEsat = 0.25;
cbc = 4.5*10^(-12);
fT = 150*10^6;
cbe = 0;

ICQ = 3.5*10^(-3);
ku=100;
RL = 1600;
Rg = 1200;

rbe = B0*kat/ICQ;
gm = ICQ/kat;
rce = UY/ICQ;

R3 = (gm/ku - rce^(-1) - RL^(-1))^(-1);

% UR4 = (2 - 4) UBEQ
% UCEQ = (1 - 5)V
UR4 = 3*UBEQ;
UCEQ = 1.753;

UCC = ICQ*R3+UCEQ+UR4;
R4 = UR4/ICQ;
IBQ = ICQ/B0;

% IR2 = (5 - 20) IBQ
IR2 = 10*IBQ;
IR1 = IR2 + IBQ;

R2 = (UCC + UR4)/IR2;
R1 = (UCC - UBEQ - UR4)/IR1;

RB = R1*R2/(R1+R2);
rWE = RB*rce/(RB+rce);
rWY = R3*rce/(R3+rce);
lamU = rWE/(Rg+rWE);
kUSK = lamU*ku;

kutest = -gm*(rce*R3*RL/(R3*RL + rce*RL + rce*R3));
cbe = gm/(2*pi*fT);
cWE = cbe + (1-kutest)*cbc;

fgtest = (Rg/rWE+1)/(2*pi*Rg*cWE);
fg=20*10^3;
Cd = (Rg/rWE+1)/(2*fg*pi*Rg*(1-kutest)) - cbe/(1-kutest) - cbc;

f3 = 19.86;
f1 = 1.986;
f2 = 1.324;

C1 = 1/(2*pi*f1*(rWE+Rg))
C2 = 1/(2*pi*f2*(rWY+RL))
C3 = (1+((B0+1)*R4)/((Rg*RB)/(Rg+RB)+rbe))/(2*pi*f3*R4)

UWYmax = UCEQ - UCEsat


