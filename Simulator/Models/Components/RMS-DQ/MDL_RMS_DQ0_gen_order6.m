%----- Equations f 

function res = MDL_RMS_DQ0_gen_order6(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_gen_order6');
disp('dynamic_states:  ROTORANGLE dwr dEq1 dEd1 dPsi1d dPsi2q');
disp('inputs:  VD1 VQ1 VT TMECH EFD');
disp('external_states:  ID1 IQ1 W P1 Q1');
disp('internal_states:  Vdr Vqr Idr Iqr psid psiq IFD TELEC PMECH VRD VRQ IRD IRQ');
disp('parameters:  SN UN SR UR ws Ra Xd Xd1 Xd2 Tdo1 Tdo2 Xq Xq1 Xq2 Tqo1 Tqo2 Xl H KD LFTYPE');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 6');
disp('Number of y = 23');
disp('Number of f = 6');
disp('Number of g = 18');
disp('Number of p = 20');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_gen_order6([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [6 18 0 []];
return;
elseif flag == 101
res=[6 23 20 6 18];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'ROTORANGLE';...
'dwr';...
'dEq1';...
'dEd1';...
'dPsi1d';...
'dPsi2q';...
};
algstates = { ... ;
'VD1';...
'VQ1';...
'VT';...
'TMECH';...
'EFD';...
'ID1';...
'IQ1';...
'W';...
'P1';...
'Q1';...
'Vdr';...
'Vqr';...
'Idr';...
'Iqr';...
'psid';...
'psiq';...
'IFD';...
'TELEC';...
'PMECH';...
'VRD';...
'VRQ';...
'IRD';...
'IRQ';...
};
parameters = { ... ;
'SN';...
'UN';...
'SR';...
'UR';...
'ws';...
'Ra';...
'Xd';...
'Xd1';...
'Xd2';...
'Tdo1';...
'Tdo2';...
'Xq';...
'Xq1';...
'Xq2';...
'Tqo1';...
'Tqo2';...
'Xl';...
'H';...
'KD';...
'LFTYPE';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
'W';...
'P1';...
'Q1';...
};
internalstates = { ... ;
'Vdr';...
'Vqr';...
'Idr';...
'Iqr';...
'psid';...
'psiq';...
'IFD';...
'TELEC';...
'PMECH';...
'VRD';...
'VRQ';...
'IRD';...
'IRQ';...
};
events = { ... ;
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,6);
res.y0=zeros(1,23);
res.p0=zeros(1,20);
res.x0(1) = 7.853982e-01; % ROTORANGLE 
res.x0(2) = 1; % dwr 
res.x0(3) = 1; % dEq1 
res.x0(4) = 0; % dEd1 
res.x0(5) = 1; % dPsi1d 
res.x0(6) = 0; % dPsi2q 
res.y0(1) = 1; % VD1 
res.y0(2) = 0; % VQ1 
res.y0(3) = 1; % VT 
res.y0(4) = 1; % TMECH 
res.y0(5) = 1; % EFD 
res.y0(6) = 0; % ID1 
res.y0(7) = 0; % IQ1 
res.y0(8) = 1; % W 
res.y0(9) = 1; % P1 
res.y0(10) = 0; % Q1 
res.y0(11) = 2.000000e-01; % Vdr 
res.y0(12) = 1; % Vqr 
res.y0(13) = 0; % Idr 
res.y0(14) = 8.000000e-01; % Iqr 
res.y0(15) = 0; % psid 
res.y0(16) = 0; % psiq 
res.y0(17) = 1; % IFD 
res.y0(18) = 1; % TELEC 
res.y0(19) = 1; % PMECH 
res.y0(20) = 1; % VRD 
res.y0(21) = 0; % VRQ 
res.y0(22) = -1; % IRD 
res.y0(23) = 0; % IRQ 
res.p0(1) = 100; % SN 
res.p0(2) = 10; % UN 
res.p0(3) = 5; % SR 
res.p0(4) = 3.300000e+00; % UR 
res.p0(5) = 3.141593e+02; % ws 
res.p0(6) = 0; % Ra 
res.p0(7) = 0; % Xd 
res.p0(8) = 0; % Xd1 
res.p0(9) = 0; % Xd2 
res.p0(10) = 0; % Tdo1 
res.p0(11) = 0; % Tdo2 
res.p0(12) = 0; % Xq 
res.p0(13) = 0; % Xq1 
res.p0(14) = 0; % Xq2 
res.p0(15) = 0; % Tqo1 
res.p0(16) = 0; % Tqo2 
res.p0(17) = 0; % Xl 
res.p0(18) = 0; % H 
res.p0(19) = 0; % KD 
res.p0(20) = 0; % LFTYPE 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
SN = param(1);
UN = param(2);
SR = param(3);
UR = param(4);
ws = param(5);
Ra = param(6);
Xd = param(7);
Xd1 = param(8);
Xd2 = param(9);
Tdo1 = param(10);
Tdo2 = param(11);
Xq = param(12);
Xq1 = param(13);
Xq2 = param(14);
Tqo1 = param(15);
Tqo2 = param(16);
Xl = param(17);
H = param(18);
KD = param(19);
LFTYPE = param(20);
end
%------- map parameters -------------------
SN = param(1);
UN = param(2);
SR = param(3);
UR = param(4);
ws = param(5);
Ra = param(6);
Xd = param(7);
Xd1 = param(8);
Xd2 = param(9);
Tdo1 = param(10);
Tdo2 = param(11);
Xq = param(12);
Xq1 = param(13);
Xq2 = param(14);
Tqo1 = param(15);
Tqo2 = param(16);
Xl = param(17);
H = param(18);
KD = param(19);
LFTYPE = param(20);
%------- map x -------------------
ROTORANGLE = x(1);
dwr = x(2);
dEq1 = x(3);
dEd1 = x(4);
dPsi1d = x(5);
dPsi2q = x(6);
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
VT = y(3);
TMECH = y(4);
EFD = y(5);
ID1 = y(6);
IQ1 = y(7);
W = y(8);
P1 = y(9);
Q1 = y(10);
Vdr = y(11);
Vqr = y(12);
Idr = y(13);
Iqr = y(14);
psid = y(15);
psiq = y(16);
IFD = y(17);
TELEC = y(18);
PMECH = y(19);
VRD = y(20);
VRQ = y(21);
IRD = y(22);
IRQ = y(23);


if flag == 1
%----- f 
res = empty;
%-----------------------
res(1) = ws*(dwr - 1);
res(2) = -(TELEC - TMECH + KD*ws*(dwr - 1))/(2*H);
res(3) = -(dEq1 - EFD + Idr*(Xd - Xd1))/Tdo1;
res(4) = -(dEd1 - Iqr*(Xq - Xq1))/Tqo1;
res(5) = -(dPsi1d - dEq1 + Idr*(Xd1 - Xl))/Tdo2;
res(6) = -(dEd1 + dPsi2q - Iqr*(Xl - Xq1))/Tqo2;
%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------
res = [res;[1 2 (ws)]];
res = [res;[2 2 (-(KD*ws)/(2*H))]];
res = [res;[3 3 (-1/Tdo1)]];
res = [res;[4 4 (-1/Tqo1)]];
res = [res;[5 3 (1/Tdo2)]];
res = [res;[5 5 (-1/Tdo2)]];
res = [res;[6 4 (-1/Tqo2)]];
res = [res;[6 6 (-1/Tqo2)]];
%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------
res = [res;[2 4 (1/(2*H))]];
res = [res;[2 18 (-1/(2*H))]];
res = [res;[3 5 (1/Tdo1)]];
res = [res;[3 13 (-(Xd - Xd1)/Tdo1)]];
res = [res;[4 14 ((Xq - Xq1)/Tqo1)]];
res = [res;[5 13 (-(Xd1 - Xl)/Tdo2)]];
res = [res;[6 14 ((Xl - Xq1)/Tqo2)]];
%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
res(1) = UN*VD1 - UR*VRD;
res(2) = UN*VQ1 - UR*VRQ;
res(3) = (ID1*SN)/UN + (IRD*SR)/UR;
res(4) = (IQ1*SN)/UN + (IRQ*SR)/UR;
%-----------------------
res(5) = Vdr + psiq + Idr*Ra;
res(6) = Vqr - psid + Iqr*Ra;
res(7) = (dEq1*(Xd2 - Xl))/(Xd1 - Xl) - Idr*Xd2 - psid + (dPsi1d*(Xd1 - Xd2))/(Xd1 - Xl);
res(8) = - psiq - Iqr*Xq2 - (dEd1*(Xl - Xq2))/(Xl - Xq1) - (dPsi2q*(Xq1 - Xq2))/(Xl - Xq1);
res(9) = Vqr*cos(ROTORANGLE) - VRD + Vdr*sin(ROTORANGLE);
res(10) = Vqr*sin(ROTORANGLE) - Vdr*cos(ROTORANGLE) - VRQ;
res(11) = Iqr*cos(ROTORANGLE) - IRD + Idr*sin(ROTORANGLE);
res(12) = Iqr*sin(ROTORANGLE) - Idr*cos(ROTORANGLE) - IRQ;
res(13) = W - dwr;
res(14) = IFD*(Xd1 - Xl) - dEq1 + ((Xd - Xd1)*(psid + Idr*Xl))/(Xd - Xl);
res(15) = TELEC + Idr*psiq - Iqr*psid;
res(16) = P1 - IRD*VRD - IRQ*VRQ;
res(17) = Q1 - IRD*VRQ + IRQ*VRD;
res(18) = TMECH*W - PMECH;
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
%-----------------------
res = [res;[7 3 ((Xd2 - Xl)/(Xd1 - Xl))]];
res = [res;[7 5 ((Xd1 - Xd2)/(Xd1 - Xl))]];
res = [res;[8 4 (-(Xl - Xq2)/(Xl - Xq1))]];
res = [res;[8 6 (-(Xq1 - Xq2)/(Xl - Xq1))]];
res = [res;[9 1 (Vdr*cos(ROTORANGLE) - Vqr*sin(ROTORANGLE))]];
res = [res;[10 1 (Vqr*cos(ROTORANGLE) + Vdr*sin(ROTORANGLE))]];
res = [res;[11 1 (Idr*cos(ROTORANGLE) - Iqr*sin(ROTORANGLE))]];
res = [res;[12 1 (Iqr*cos(ROTORANGLE) + Idr*sin(ROTORANGLE))]];
res = [res;[13 2 (-1)]];
res = [res;[14 3 (-1)]];
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
res = [res;[1 1 (UN)]];
res = [res;[1 20 (-UR)]];
res = [res;[2 2 (UN)]];
res = [res;[2 21 (-UR)]];
res = [res;[3 6 (SN/UN)]];
res = [res;[3 22 (SR/UR)]];
res = [res;[4 7 (SN/UN)]];
res = [res;[4 23 (SR/UR)]];
%-----------------------
res = [res;[5 11 (1)]];
res = [res;[5 13 (Ra)]];
res = [res;[5 16 (1)]];
res = [res;[6 12 (1)]];
res = [res;[6 14 (Ra)]];
res = [res;[6 15 (-1)]];
res = [res;[7 13 (-Xd2)]];
res = [res;[7 15 (-1)]];
res = [res;[8 14 (-Xq2)]];
res = [res;[8 16 (-1)]];
res = [res;[9 11 (sin(ROTORANGLE))]];
res = [res;[9 12 (cos(ROTORANGLE))]];
res = [res;[9 20 (-1)]];
res = [res;[10 11 (-cos(ROTORANGLE))]];
res = [res;[10 12 (sin(ROTORANGLE))]];
res = [res;[10 21 (-1)]];
res = [res;[11 13 (sin(ROTORANGLE))]];
res = [res;[11 14 (cos(ROTORANGLE))]];
res = [res;[11 22 (-1)]];
res = [res;[12 13 (-cos(ROTORANGLE))]];
res = [res;[12 14 (sin(ROTORANGLE))]];
res = [res;[12 23 (-1)]];
res = [res;[13 8 (1)]];
res = [res;[14 13 ((Xl*(Xd - Xd1))/(Xd - Xl))]];
res = [res;[14 15 ((Xd - Xd1)/(Xd - Xl))]];
res = [res;[14 17 (Xd1 - Xl)]];
res = [res;[15 13 (psiq)]];
res = [res;[15 14 (-psid)]];
res = [res;[15 15 (-Iqr)]];
res = [res;[15 16 (Idr)]];
res = [res;[15 18 (1)]];
res = [res;[16 9 (1)]];
res = [res;[16 20 (-IRD)]];
res = [res;[16 21 (-IRQ)]];
res = [res;[16 22 (-VRD)]];
res = [res;[16 23 (-VRQ)]];
res = [res;[17 10 (1)]];
res = [res;[17 20 (IRQ)]];
res = [res;[17 21 (-IRD)]];
res = [res;[17 22 (-VRQ)]];
res = [res;[17 23 (VRD)]];
res = [res;[18 4 (W)]];
res = [res;[18 8 (TMECH)]];
res = [res;[18 19 (-1)]];
%-----------------------
elseif flag == 7
%----- h 
res = x;
elseif flag == 8
%----- hx 
res = [[1:6];[1:6];ones(1,6)]';
elseif flag == 9
%----- hy 
res = empty3;
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
elseif flag == 107
res.x0=x;
res.y0=y;
%-----------------------
%-----------------------
end
