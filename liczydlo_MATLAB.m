clear
B0=200;
kat = 26.5*10^(-3);
ICQ = 3.5*10^(-3);
UY = 100;
ku=100;
RL = 1600;
UBEQ = 0.65;
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

