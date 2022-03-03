%----- Equations f 

function res = MDL_CTRL_pss_pss2a(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_pss_pss2a');
disp('dynamic_states:  dVT dV1 dV2 dV3 dV4 dV5 dV6 dV11 dV12 dVN1 dVN2 dVN3 dVN4 dVN5 dVN7 dVN8 dVN9 dVN10 dVN11');
disp('inputs:  W P PMECH VT IFD ID IQ');
disp('external_states:  VPSS');
disp('internal_states:  derVT VIN1 VIN2 V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 VN1 VN2 VN3 VN4 VN5 VN6 VN7 VN8 VN9 VN10 VN11 IBranch derVTdot V5dot V6dot dVN1dot VN2dot VN3dot VN4dot VN5dot dVN7dot VN8dot VN9dot VN10dot VN11dot dV11dot dV12dot');
disp('events:  ev_VPSS_max ev_VPSS_min');
disp('parameters:  TW1 TW2 TW3 TW4 TW6 KS2 TW7 KS3 KS1 T1 T2 T3 T4 VSTMIN VSTMAX M N T8 T9 SWS1 SWS2');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 19');
disp('Number of y = 52');
disp('Number of f = 19');
disp('Number of g = 45');
disp('Number of p = 21');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_pss_pss2a([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [19 45 0 [51 52 ]];
return;
elseif flag == 101
res=[19 52 21 19 45];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dVT';...
'dV1';...
'dV2';...
'dV3';...
'dV4';...
'dV5';...
'dV6';...
'dV11';...
'dV12';...
'dVN1';...
'dVN2';...
'dVN3';...
'dVN4';...
'dVN5';...
'dVN7';...
'dVN8';...
'dVN9';...
'dVN10';...
'dVN11';...
};
algstates = { ... ;
'W';...
'P';...
'PMECH';...
'VT';...
'IFD';...
'ID';...
'IQ';...
'VPSS';...
'derVT';...
'VIN1';...
'VIN2';...
'V1';...
'V2';...
'V3';...
'V4';...
'V5';...
'V6';...
'V7';...
'V8';...
'V9';...
'V10';...
'V11';...
'V12';...
'VN1';...
'VN2';...
'VN3';...
'VN4';...
'VN5';...
'VN6';...
'VN7';...
'VN8';...
'VN9';...
'VN10';...
'VN11';...
'IBranch';...
'derVTdot';...
'V5dot';...
'V6dot';...
'dVN1dot';...
'VN2dot';...
'VN3dot';...
'VN4dot';...
'VN5dot';...
'dVN7dot';...
'VN8dot';...
'VN9dot';...
'VN10dot';...
'VN11dot';...
'dV11dot';...
'dV12dot';...
'ev_VPSS_max';...
'ev_VPSS_min';...
};
parameters = { ... ;
'TW1';...
'TW2';...
'TW3';...
'TW4';...
'TW6';...
'KS2';...
'TW7';...
'KS3';...
'KS1';...
'T1';...
'T2';...
'T3';...
'T4';...
'VSTMIN';...
'VSTMAX';...
'M';...
'N';...
'T8';...
'T9';...
'SWS1';...
'SWS2';...
};
externalstates = { ... ;
'VPSS';...
};
internalstates = { ... ;
'derVT';...
'VIN1';...
'VIN2';...
'V1';...
'V2';...
'V3';...
'V4';...
'V5';...
'V6';...
'V7';...
'V8';...
'V9';...
'V10';...
'V11';...
'V12';...
'VN1';...
'VN2';...
'VN3';...
'VN4';...
'VN5';...
'VN6';...
'VN7';...
'VN8';...
'VN9';...
'VN10';...
'VN11';...
'IBranch';...
'derVTdot';...
'V5dot';...
'V6dot';...
'dVN1dot';...
'VN2dot';...
'VN3dot';...
'VN4dot';...
'VN5dot';...
'dVN7dot';...
'VN8dot';...
'VN9dot';...
'VN10dot';...
'VN11dot';...
'dV11dot';...
'dV12dot';...
};
events = { ... ;
'ev_VPSS_max';...
'ev_VPSS_min';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,19);
res.y0=zeros(1,52);
res.p0=zeros(1,21);
res.x0(1) = 0; % dVT 
res.x0(2) = 0; % dV1 
res.x0(3) = 0; % dV2 
res.x0(4) = 0; % dV3 
res.x0(5) = 0; % dV4 
res.x0(6) = 0; % dV5 
res.x0(7) = 0; % dV6 
res.x0(8) = 0; % dV11 
res.x0(9) = 0; % dV12 
res.x0(10) = 0; % dVN1 
res.x0(11) = 0; % dVN2 
res.x0(12) = 0; % dVN3 
res.x0(13) = 0; % dVN4 
res.x0(14) = 0; % dVN5 
res.x0(15) = 0; % dVN7 
res.x0(16) = 0; % dVN8 
res.x0(17) = 0; % dVN9 
res.x0(18) = 0; % dVN10 
res.x0(19) = 0; % dVN11 
res.y0(1) = 1; % W 
res.y0(2) = 1; % P 
res.y0(3) = 1; % PMECH 
res.y0(4) = 1; % VT 
res.y0(5) = 1; % IFD 
res.y0(6) = 1; % ID 
res.y0(7) = 1; % IQ 
res.y0(8) = 0; % VPSS 
res.y0(9) = 0; % derVT 
res.y0(10) = 1; % VIN1 
res.y0(11) = 1; % VIN2 
res.y0(12) = 0; % V1 
res.y0(13) = 0; % V2 
res.y0(14) = 0; % V3 
res.y0(15) = 0; % V4 
res.y0(16) = 0; % V5 
res.y0(17) = 0; % V6 
res.y0(18) = 0; % V7 
res.y0(19) = 0; % V8 
res.y0(20) = 0; % V9 
res.y0(21) = 0; % V10 
res.y0(22) = 0; % V11 
res.y0(23) = 0; % V12 
res.y0(24) = 0; % VN1 
res.y0(25) = 0; % VN2 
res.y0(26) = 0; % VN3 
res.y0(27) = 0; % VN4 
res.y0(28) = 0; % VN5 
res.y0(29) = 0; % VN6 
res.y0(30) = 0; % VN7 
res.y0(31) = 0; % VN8 
res.y0(32) = 0; % VN9 
res.y0(33) = 0; % VN10 
res.y0(34) = 0; % VN11 
res.y0(35) = 1; % IBranch 
res.p0(1) = 1; % TW1 
res.p0(2) = 1; % TW2 
res.p0(3) = 1; % TW3 
res.p0(4) = 1; % TW4 
res.p0(5) = 2; % TW6 
res.p0(6) = 1; % KS2 
res.p0(7) = 2; % TW7 
res.p0(8) = 2; % KS3 
res.p0(9) = 1; % KS1 
res.p0(10) = 3; % T1 
res.p0(11) = 4; % T2 
res.p0(12) = 1; % T3 
res.p0(13) = 1; % T4 
res.p0(14) = -10; % VSTMIN 
res.p0(15) = 10; % VSTMAX 
res.p0(16) = 1; % M 
res.p0(17) = 1; % N 
res.p0(18) = 1; % T8 
res.p0(19) = 2; % T9 
res.p0(20) = 1; % SWS1 
res.p0(21) = 1; % SWS2 
return;
elseif flag == 110
	res = [0  0];
return;
elseif flag == 111
	res = [0  0];
return;
elseif flag == 106
TW1 = param(1);
TW2 = param(2);
TW3 = param(3);
TW4 = param(4);
TW6 = param(5);
KS2 = param(6);
TW7 = param(7);
KS3 = param(8);
KS1 = param(9);
T1 = param(10);
T2 = param(11);
T3 = param(12);
T4 = param(13);
VSTMIN = param(14);
VSTMAX = param(15);
M = param(16);
N = param(17);
T8 = param(18);
T9 = param(19);
SWS1 = param(20);
SWS2 = param(21);
if  1 == 0 
return;
end
if  TW1 == 0 
return;
end
if  TW2 == 0 
return;
end
if  TW3 == 0 
return;
end
if  TW4 == 0 
return;
end
if  TW6 == 0 
return;
end
if  TW7 == 0 
return;
end
if  T8 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T8 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T9 == 0 
return;
end
if  T1 == 0 
return;
end
if  T2 == 0 
return;
end
if  T3 == 0 
return;
end
if  T4 == 0 
return;
end
end
%------- map parameters -------------------
TW1 = param(1);
TW2 = param(2);
TW3 = param(3);
TW4 = param(4);
TW6 = param(5);
KS2 = param(6);
TW7 = param(7);
KS3 = param(8);
KS1 = param(9);
T1 = param(10);
T2 = param(11);
T3 = param(12);
T4 = param(13);
VSTMIN = param(14);
VSTMAX = param(15);
M = param(16);
N = param(17);
T8 = param(18);
T9 = param(19);
SWS1 = param(20);
SWS2 = param(21);
%------- map x -------------------
dVT = x(1);
dV1 = x(2);
dV2 = x(3);
dV3 = x(4);
dV4 = x(5);
dV5 = x(6);
dV6 = x(7);
dV11 = x(8);
dV12 = x(9);
dVN1 = x(10);
dVN2 = x(11);
dVN3 = x(12);
dVN4 = x(13);
dVN5 = x(14);
dVN7 = x(15);
dVN8 = x(16);
dVN9 = x(17);
dVN10 = x(18);
dVN11 = x(19);
%------- map y -------------------
W = y(1);
P = y(2);
PMECH = y(3);
VT = y(4);
IFD = y(5);
ID = y(6);
IQ = y(7);
VPSS = y(8);
derVT = y(9);
VIN1 = y(10);
VIN2 = y(11);
V1 = y(12);
V2 = y(13);
V3 = y(14);
V4 = y(15);
V5 = y(16);
V6 = y(17);
V7 = y(18);
V8 = y(19);
V9 = y(20);
V10 = y(21);
V11 = y(22);
V12 = y(23);
VN1 = y(24);
VN2 = y(25);
VN3 = y(26);
VN4 = y(27);
VN5 = y(28);
VN6 = y(29);
VN7 = y(30);
VN8 = y(31);
VN9 = y(32);
VN10 = y(33);
VN11 = y(34);
IBranch = y(35);
derVTdot = y(36);
V5dot = y(37);
V6dot = y(38);
dVN1dot = y(39);
VN2dot = y(40);
VN3dot = y(41);
VN4dot = y(42);
VN5dot = y(43);
dVN7dot = y(44);
VN8dot = y(45);
VN9dot = y(46);
VN10dot = y(47);
VN11dot = y(48);
dV11dot = y(49);
dV12dot = y(50);
ev_VPSS_max = y(51);
ev_VPSS_min = y(52);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res(1) = derVTdot;
if (abs(TW1) > 0) 
res(2) = (VIN1 - dV1)/TW1;
else
res(2) = 0;
end
if (abs(TW2) > 0) 
res(3) = (V1 - dV2)/TW2;
else
res(3) = 0;
end
if (abs(TW3) > 0) 
res(4) = (VIN2 - dV3)/TW3;
else
res(4) = 0;
end
if (abs(TW4) > 0) 
res(5) = (V3 - dV4)/TW4;
else
res(5) = 0;
end
res(6) = V5dot;
res(7) = V6dot;
res(10) = dVN1dot;
res(11) = VN2dot;
res(12) = VN3dot;
res(13) = VN4dot;
res(14) = VN5dot;
res(15) = dVN7dot;
res(16) = VN8dot;
res(17) = VN9dot;
res(18) = VN10dot;
res(19) = VN11dot;
res(8) = dV11dot;
res(9) = dV12dot;
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TW1) > 0) 
res = [res;[2 2 (-1/TW1)]];
else
end
if (abs(TW2) > 0) 
res = [res;[3 3 (-1/TW2)]];
else
end
if (abs(TW3) > 0) 
res = [res;[4 4 (-1/TW3)]];
else
end
if (abs(TW4) > 0) 
res = [res;[5 5 (-1/TW4)]];
else
end
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res = [res;[1 36 (1)]];
if (abs(TW1) > 0) 
res = [res;[2 10 (1/TW1)]];
else
end
if (abs(TW2) > 0) 
res = [res;[3 12 (1/TW2)]];
else
end
if (abs(TW3) > 0) 
res = [res;[4 11 (1/TW3)]];
else
end
if (abs(TW4) > 0) 
res = [res;[5 14 (1/TW4)]];
else
end
res = [res;[6 37 (1)]];
res = [res;[7 38 (1)]];
res = [res;[10 39 (1)]];
res = [res;[11 40 (1)]];
res = [res;[12 41 (1)]];
res = [res;[13 42 (1)]];
res = [res;[14 43 (1)]];
res = [res;[15 44 (1)]];
res = [res;[16 45 (1)]];
res = [res;[17 46 (1)]];
res = [res;[18 47 (1)]];
res = [res;[19 48 (1)]];
res = [res;[8 49 (1)]];
res = [res;[9 50 (1)]];
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
%--------------------
if (abs(1) > 0) 
res(1) = dVT - VT + derVTdot;
res(2) = derVT - dVT;
else
res(1) = derVTdot;
res(2) = derVT - VT;
end
res(3) = IBranch^2 - ID^2 - IQ^2;
%-----------------------
if (abs(SWS1-1.0*(1))<1e-9) 
res(4) = VIN1 - W + 1;
else
if (abs(SWS1-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
res(4) = VIN1 - W;
else
if (abs(SWS1-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
res(4) = VIN1 - P;
else
if (abs(SWS1-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
res(4) = VIN1 - PMECH;
else
if (abs(SWS1-1.0*(5))<1e-9) 
res(4) = VIN1 - VT;
else
res(4) = VIN1 - derVT;
end
end
end
end
end

%-----------------------
if (abs(SWS2-1.0*(1))<1e-9) 
res(5) = VIN2 - W + 1;
else
if (abs(SWS2-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
res(5) = VIN2 - W;
else
if (abs(SWS2-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
res(5) = VIN2 - P;
else
if (abs(SWS2-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
res(5) = VIN2 - PMECH;
else
if (abs(SWS2-1.0*(5))<1e-9) 
res(5) = VIN2 - VT;
else
res(5) = VIN2 - derVT;
end
end
end
end
end
%-----------------------
%--------------------
if (abs(TW1) > 0) 
res(6) = V1 - VIN1 + dV1;
else
res(6) = V1 - VIN1;
end
%--------------------
if (abs(TW2) > 0) 
res(7) = V2 - V1 + dV2;
else
res(7) = V2 - V1;
end
%--------------------
if (abs(TW3) > 0) 
res(8) = V3 - VIN2 + dV3;
else
res(8) = V3 - VIN2;
end
%--------------------
if (abs(TW4) > 0) 
res(9) = V4 - V3 + dV4;
else
res(9) = V4 - V3;
end
%-----------------------
%--------------------
if (abs(TW6) > 0) 
res(10) = V5dot - (V2 - dV5)/TW6;
res(11) = V5 - dV5;
else
res(10) = V5dot;
res(11) = V5 - V2;
end
%--------------------
if (abs(TW7) > 0) 
res(12) = V6dot + (dV6 - KS2*V4)/TW7;
res(13) = V6 - dV6;
else
res(12) = V6dot;
res(13) = V6 - KS2*V4;
end
%-----------------------
res(14) = V7 - V5 - KS3*V6;
%-----------------------
if (abs(T9) > 0) 
if (abs(T8) > 0) 
res(15) = dVN1dot - (VN1 - dVN1)/T8;
else
res(15) = dVN1dot - (V7 - dVN1)/T9;
end
if (abs(T8) > 0) 
res(16) = VN1 - (T8*(V7 + dVN1*(T9/T8 - 1)))/T9;
else
res(16) = VN1 - dVN1;
end
else
%--------------------
res(15) = dVN1dot;
res(16) = VN1 - V7;
end
%--------------------
if (abs(T9) > 0) 
res(17) = VN2dot - (VN1 - dVN2)/T9;
res(18) = VN2 - dVN2;
else
res(17) = VN2dot;
res(18) = VN2 - VN1;
end
%--------------------
if (abs(T9) > 0) 
res(19) = VN3dot - (VN2 - dVN3)/T9;
res(20) = VN3 - dVN3;
else
res(19) = VN3dot;
res(20) = VN3 - VN2;
end
%--------------------
if (abs(T9) > 0) 
res(21) = VN4dot - (VN3 - dVN4)/T9;
res(22) = VN4 - dVN4;
else
res(21) = VN4dot;
res(22) = VN4 - VN3;
end
%--------------------
if (abs(T9) > 0) 
res(23) = VN5dot - (VN4 - dVN5)/T9;
res(24) = VN5 - dVN5;
else
res(23) = VN5dot;
res(24) = VN5 - VN4;
end
if (abs(T9) > 0) 
if (abs(T8) > 0) 
res(25) = dVN7dot - (VN7 - dVN7)/T8;
else
res(25) = dVN7dot - (VN6 - dVN7)/T9;
end
if (abs(T8) > 0) 
res(26) = VN7 - (T8*(VN6 + dVN7*(T9/T8 - 1)))/T9;
else
res(26) = VN7 - dVN7;
end
else
%--------------------
res(25) = dVN7dot;
res(26) = VN7 - VN6;
end
%--------------------
if (abs(T9) > 0) 
res(27) = VN8dot - (VN7 - dVN8)/T9;
res(28) = VN8 - dVN8;
else
res(27) = VN8dot;
res(28) = VN8 - VN7;
end
%--------------------
if (abs(T9) > 0) 
res(29) = VN9dot - (VN8 - dVN9)/T9;
res(30) = VN9 - dVN9;
else
res(29) = VN9dot;
res(30) = VN9 - VN8;
end
%--------------------
if (abs(T9) > 0) 
res(31) = VN10dot - (VN9 - dVN10)/T9;
res(32) = VN10 - dVN10;
else
res(31) = VN10dot;
res(32) = VN10 - VN9;
end
%--------------------
if (abs(T9) > 0) 
res(33) = VN11dot - (VN10 - dVN11)/T9;
res(34) = VN11 - dVN11;
else
res(33) = VN11dot;
res(34) = VN11 - VN10;
end

if (abs(M-1.0*(0))<1e-9 && abs(N-1.0*(0))<1e-9) 
res(35) = VN6 - 1;
res(36) = V8 - V7;
else
if (abs(M-1.0*(1))<1e-9) 
res(35) = VN6 - VN1;
if (abs(N-1.0*(1))<1e-9) 
res(36) = V8 - VN1;
else
res(36) = V8 - VN7;
end
else
if (abs(M-1.0*(2))<1e-9) 
res(35) = VN6 - VN2;
if (abs(N-1.0*(1))<1e-9) 
res(36) = V8 - VN2;
else
res(36) = V8 - VN8;
end
else
if (abs(M-1.0*(3))<1e-9) 
res(35) = VN6 - VN3;
if (abs(N-1.0*(1))<1e-9) 
res(36) = V8 - VN3;
else
res(36) = V8 - VN9;
end
else
if (abs(M-1.0*(4))<1e-9) 
res(35) = VN6 - VN4;
if (abs(N-1.0*(1))<1e-9) 
res(36) = V8 - VN4;
else
res(36) = V8 - VN10;
end
else
res(35) = VN6 - VN5;
if (abs(N-1.0*(1))<1e-9) 
res(36) = V8 - VN5;
else
res(36) = V8 - VN11;
end
end
end
end
end
end
%-----------------------
res(37) = V6 - V8 + V9;
%-----------------------
res(38) = V10 - KS1*V9;
%-----------------------
if (abs(T2) > 0) 
if (abs(T1) > 0) 
res(39) = dV11dot - (V11 - dV11)/T1;
else
res(39) = dV11dot - (V10 - dV11)/T2;
end
if (abs(T1) > 0) 
res(40) = V11 - (T1*(V10 + dV11*(T2/T1 - 1)))/T2;
else
res(40) = V11 - dV11;
end
else
%--------------------
res(39) = dV11dot;
res(40) = V11 - V10;
end
%-----------------------
if (abs(T4) > 0) 
if (abs(T3) > 0) 
res(41) = dV12dot - (V12 - dV12)/T3;
else
res(41) = dV12dot - (V11 - dV12)/T4;
end
if (abs(T3) > 0) 
res(42) = V12 - (T3*(V11 + dV12*(T4/T3 - 1)))/T4;
else
res(42) = V12 - dV12;
end
else
%--------------------
res(41) = dV12dot;
res(42) = V12 - V11;
end
%-----------------------
if (t < 0 ) 
res(43) = VPSS - V12;
else
%--------------------
if (ev(1) > 0 ) 
res(43) = VPSS - VSTMAX;
else
if (ev(2) < 0 ) 
res(43) = VPSS - VSTMIN;
else
res(43) = VPSS - V12;
end
end
end
%--------------------------------------------------------------------------
res(44) = VSTMAX - V12 + ev_VPSS_max;
res(45) = VSTMIN - V12 + ev_VPSS_min;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(1) > 0) 
res = [res;[1 1 (1)]];
res = [res;[2 1 (-1)]];
else
end
%-----------------------
if (abs(SWS1-1.0*(1))<1e-9) 
else
if (abs(SWS1-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
else
if (abs(SWS1-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
else
if (abs(SWS1-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
else
if (abs(SWS1-1.0*(5))<1e-9) 
else
end
end
end
end
end

%-----------------------
if (abs(SWS2-1.0*(1))<1e-9) 
else
if (abs(SWS2-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
else
if (abs(SWS2-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
else
if (abs(SWS2-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
else
if (abs(SWS2-1.0*(5))<1e-9) 
else
end
end
end
end
end
%-----------------------
%--------------------
if (abs(TW1) > 0) 
res = [res;[6 2 (1)]];
else
end
%--------------------
if (abs(TW2) > 0) 
res = [res;[7 3 (1)]];
else
end
%--------------------
if (abs(TW3) > 0) 
res = [res;[8 4 (1)]];
else
end
%--------------------
if (abs(TW4) > 0) 
res = [res;[9 5 (1)]];
else
end
%-----------------------
%--------------------
if (abs(TW6) > 0) 
res = [res;[10 6 (1/TW6)]];
res = [res;[11 6 (-1)]];
else
end
%--------------------
if (abs(TW7) > 0) 
res = [res;[12 7 (1/TW7)]];
res = [res;[13 7 (-1)]];
else
end
%-----------------------
%-----------------------
if (abs(T9) > 0) 
if (abs(T8) > 0) 
res = [res;[15 10 (1/T8)]];
else
res = [res;[15 10 (1/T9)]];
end
if (abs(T8) > 0) 
res = [res;[16 10 ((T8 - T9)/T9)]];
else
res = [res;[16 10 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(T9) > 0) 
res = [res;[17 11 (1/T9)]];
res = [res;[18 11 (-1)]];
else
end
%--------------------
if (abs(T9) > 0) 
res = [res;[19 12 (1/T9)]];
res = [res;[20 12 (-1)]];
else
end
%--------------------
if (abs(T9) > 0) 
res = [res;[21 13 (1/T9)]];
res = [res;[22 13 (-1)]];
else
end
%--------------------
if (abs(T9) > 0) 
res = [res;[23 14 (1/T9)]];
res = [res;[24 14 (-1)]];
else
end
if (abs(T9) > 0) 
if (abs(T8) > 0) 
res = [res;[25 15 (1/T8)]];
else
res = [res;[25 15 (1/T9)]];
end
if (abs(T8) > 0) 
res = [res;[26 15 ((T8 - T9)/T9)]];
else
res = [res;[26 15 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(T9) > 0) 
res = [res;[27 16 (1/T9)]];
res = [res;[28 16 (-1)]];
else
end
%--------------------
if (abs(T9) > 0) 
res = [res;[29 17 (1/T9)]];
res = [res;[30 17 (-1)]];
else
end
%--------------------
if (abs(T9) > 0) 
res = [res;[31 18 (1/T9)]];
res = [res;[32 18 (-1)]];
else
end
%--------------------
if (abs(T9) > 0) 
res = [res;[33 19 (1/T9)]];
res = [res;[34 19 (-1)]];
else
end

if (abs(M-1.0*(0))<1e-9 && abs(N-1.0*(0))<1e-9) 
else
if (abs(M-1.0*(1))<1e-9) 
if (abs(N-1.0*(1))<1e-9) 
else
end
else
if (abs(M-1.0*(2))<1e-9) 
if (abs(N-1.0*(1))<1e-9) 
else
end
else
if (abs(M-1.0*(3))<1e-9) 
if (abs(N-1.0*(1))<1e-9) 
else
end
else
if (abs(M-1.0*(4))<1e-9) 
if (abs(N-1.0*(1))<1e-9) 
else
end
else
if (abs(N-1.0*(1))<1e-9) 
else
end
end
end
end
end
end
%-----------------------
%-----------------------
%-----------------------
if (abs(T2) > 0) 
if (abs(T1) > 0) 
res = [res;[39 8 (1/T1)]];
else
res = [res;[39 8 (1/T2)]];
end
if (abs(T1) > 0) 
res = [res;[40 8 ((T1 - T2)/T2)]];
else
res = [res;[40 8 (-1)]];
end
else
%--------------------
end
%-----------------------
if (abs(T4) > 0) 
if (abs(T3) > 0) 
res = [res;[41 9 (1/T3)]];
else
res = [res;[41 9 (1/T4)]];
end
if (abs(T3) > 0) 
res = [res;[42 9 ((T3 - T4)/T4)]];
else
res = [res;[42 9 (-1)]];
end
else
%--------------------
end
%-----------------------
if (t < 0 ) 
else
%--------------------
if (ev(1) > 0 ) 
else
if (ev(2) < 0 ) 
else
end
end
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(1) > 0) 
res = [res;[1 4 (-1)]];
res = [res;[1 36 (1)]];
res = [res;[2 9 (1)]];
else
res = [res;[1 36 (1)]];
res = [res;[2 4 (-1)]];
res = [res;[2 9 (1)]];
end
res = [res;[3 6 (-2*ID)]];
res = [res;[3 7 (-2*IQ)]];
res = [res;[3 35 (2*IBranch)]];
%-----------------------
if (abs(SWS1-1.0*(1))<1e-9) 
res = [res;[4 1 (-1)]];
res = [res;[4 10 (1)]];
else
if (abs(SWS1-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
res = [res;[4 1 (-1)]];
res = [res;[4 10 (1)]];
else
if (abs(SWS1-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
res = [res;[4 2 (-1)]];
res = [res;[4 10 (1)]];
else
if (abs(SWS1-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
res = [res;[4 3 (-1)]];
res = [res;[4 10 (1)]];
else
if (abs(SWS1-1.0*(5))<1e-9) 
res = [res;[4 4 (-1)]];
res = [res;[4 10 (1)]];
else
res = [res;[4 9 (-1)]];
res = [res;[4 10 (1)]];
end
end
end
end
end

%-----------------------
if (abs(SWS2-1.0*(1))<1e-9) 
res = [res;[5 1 (-1)]];
res = [res;[5 11 (1)]];
else
if (abs(SWS2-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
res = [res;[5 1 (-1)]];
res = [res;[5 11 (1)]];
else
if (abs(SWS2-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
res = [res;[5 2 (-1)]];
res = [res;[5 11 (1)]];
else
if (abs(SWS2-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
res = [res;[5 3 (-1)]];
res = [res;[5 11 (1)]];
else
if (abs(SWS2-1.0*(5))<1e-9) 
res = [res;[5 4 (-1)]];
res = [res;[5 11 (1)]];
else
res = [res;[5 9 (-1)]];
res = [res;[5 11 (1)]];
end
end
end
end
end
%-----------------------
%--------------------
if (abs(TW1) > 0) 
res = [res;[6 10 (-1)]];
res = [res;[6 12 (1)]];
else
res = [res;[6 10 (-1)]];
res = [res;[6 12 (1)]];
end
%--------------------
if (abs(TW2) > 0) 
res = [res;[7 12 (-1)]];
res = [res;[7 13 (1)]];
else
res = [res;[7 12 (-1)]];
res = [res;[7 13 (1)]];
end
%--------------------
if (abs(TW3) > 0) 
res = [res;[8 11 (-1)]];
res = [res;[8 14 (1)]];
else
res = [res;[8 11 (-1)]];
res = [res;[8 14 (1)]];
end
%--------------------
if (abs(TW4) > 0) 
res = [res;[9 14 (-1)]];
res = [res;[9 15 (1)]];
else
res = [res;[9 14 (-1)]];
res = [res;[9 15 (1)]];
end
%-----------------------
%--------------------
if (abs(TW6) > 0) 
res = [res;[10 13 (-1/TW6)]];
res = [res;[10 37 (1)]];
res = [res;[11 16 (1)]];
else
res = [res;[10 37 (1)]];
res = [res;[11 13 (-1)]];
res = [res;[11 16 (1)]];
end
%--------------------
if (abs(TW7) > 0) 
res = [res;[12 15 (-KS2/TW7)]];
res = [res;[12 38 (1)]];
res = [res;[13 17 (1)]];
else
res = [res;[12 38 (1)]];
res = [res;[13 15 (-KS2)]];
res = [res;[13 17 (1)]];
end
%-----------------------
res = [res;[14 16 (-1)]];
res = [res;[14 17 (-KS3)]];
res = [res;[14 18 (1)]];
%-----------------------
if (abs(T9) > 0) 
if (abs(T8) > 0) 
res = [res;[15 24 (-1/T8)]];
res = [res;[15 39 (1)]];
else
res = [res;[15 18 (-1/T9)]];
res = [res;[15 39 (1)]];
end
if (abs(T8) > 0) 
res = [res;[16 18 (-T8/T9)]];
res = [res;[16 24 (1)]];
else
res = [res;[16 24 (1)]];
end
else
%--------------------
res = [res;[15 39 (1)]];
res = [res;[16 18 (-1)]];
res = [res;[16 24 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[17 24 (-1/T9)]];
res = [res;[17 40 (1)]];
res = [res;[18 25 (1)]];
else
res = [res;[17 40 (1)]];
res = [res;[18 24 (-1)]];
res = [res;[18 25 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[19 25 (-1/T9)]];
res = [res;[19 41 (1)]];
res = [res;[20 26 (1)]];
else
res = [res;[19 41 (1)]];
res = [res;[20 25 (-1)]];
res = [res;[20 26 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[21 26 (-1/T9)]];
res = [res;[21 42 (1)]];
res = [res;[22 27 (1)]];
else
res = [res;[21 42 (1)]];
res = [res;[22 26 (-1)]];
res = [res;[22 27 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[23 27 (-1/T9)]];
res = [res;[23 43 (1)]];
res = [res;[24 28 (1)]];
else
res = [res;[23 43 (1)]];
res = [res;[24 27 (-1)]];
res = [res;[24 28 (1)]];
end
if (abs(T9) > 0) 
if (abs(T8) > 0) 
res = [res;[25 30 (-1/T8)]];
res = [res;[25 44 (1)]];
else
res = [res;[25 29 (-1/T9)]];
res = [res;[25 44 (1)]];
end
if (abs(T8) > 0) 
res = [res;[26 29 (-T8/T9)]];
res = [res;[26 30 (1)]];
else
res = [res;[26 30 (1)]];
end
else
%--------------------
res = [res;[25 44 (1)]];
res = [res;[26 29 (-1)]];
res = [res;[26 30 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[27 30 (-1/T9)]];
res = [res;[27 45 (1)]];
res = [res;[28 31 (1)]];
else
res = [res;[27 45 (1)]];
res = [res;[28 30 (-1)]];
res = [res;[28 31 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[29 31 (-1/T9)]];
res = [res;[29 46 (1)]];
res = [res;[30 32 (1)]];
else
res = [res;[29 46 (1)]];
res = [res;[30 31 (-1)]];
res = [res;[30 32 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[31 32 (-1/T9)]];
res = [res;[31 47 (1)]];
res = [res;[32 33 (1)]];
else
res = [res;[31 47 (1)]];
res = [res;[32 32 (-1)]];
res = [res;[32 33 (1)]];
end
%--------------------
if (abs(T9) > 0) 
res = [res;[33 33 (-1/T9)]];
res = [res;[33 48 (1)]];
res = [res;[34 34 (1)]];
else
res = [res;[33 48 (1)]];
res = [res;[34 33 (-1)]];
res = [res;[34 34 (1)]];
end

if (abs(M-1.0*(0))<1e-9 && abs(N-1.0*(0))<1e-9) 
res = [res;[35 29 (1)]];
res = [res;[36 18 (-1)]];
res = [res;[36 19 (1)]];
else
if (abs(M-1.0*(1))<1e-9) 
res = [res;[35 24 (-1)]];
res = [res;[35 29 (1)]];
if (abs(N-1.0*(1))<1e-9) 
res = [res;[36 19 (1)]];
res = [res;[36 24 (-1)]];
else
res = [res;[36 19 (1)]];
res = [res;[36 30 (-1)]];
end
else
if (abs(M-1.0*(2))<1e-9) 
res = [res;[35 25 (-1)]];
res = [res;[35 29 (1)]];
if (abs(N-1.0*(1))<1e-9) 
res = [res;[36 19 (1)]];
res = [res;[36 25 (-1)]];
else
res = [res;[36 19 (1)]];
res = [res;[36 31 (-1)]];
end
else
if (abs(M-1.0*(3))<1e-9) 
res = [res;[35 26 (-1)]];
res = [res;[35 29 (1)]];
if (abs(N-1.0*(1))<1e-9) 
res = [res;[36 19 (1)]];
res = [res;[36 26 (-1)]];
else
res = [res;[36 19 (1)]];
res = [res;[36 32 (-1)]];
end
else
if (abs(M-1.0*(4))<1e-9) 
res = [res;[35 27 (-1)]];
res = [res;[35 29 (1)]];
if (abs(N-1.0*(1))<1e-9) 
res = [res;[36 19 (1)]];
res = [res;[36 27 (-1)]];
else
res = [res;[36 19 (1)]];
res = [res;[36 33 (-1)]];
end
else
res = [res;[35 28 (-1)]];
res = [res;[35 29 (1)]];
if (abs(N-1.0*(1))<1e-9) 
res = [res;[36 19 (1)]];
res = [res;[36 28 (-1)]];
else
res = [res;[36 19 (1)]];
res = [res;[36 34 (-1)]];
end
end
end
end
end
end
%-----------------------
res = [res;[37 17 (1)]];
res = [res;[37 19 (-1)]];
res = [res;[37 20 (1)]];
%-----------------------
res = [res;[38 20 (-KS1)]];
res = [res;[38 21 (1)]];
%-----------------------
if (abs(T2) > 0) 
if (abs(T1) > 0) 
res = [res;[39 22 (-1/T1)]];
res = [res;[39 49 (1)]];
else
res = [res;[39 21 (-1/T2)]];
res = [res;[39 49 (1)]];
end
if (abs(T1) > 0) 
res = [res;[40 21 (-T1/T2)]];
res = [res;[40 22 (1)]];
else
res = [res;[40 22 (1)]];
end
else
%--------------------
res = [res;[39 49 (1)]];
res = [res;[40 21 (-1)]];
res = [res;[40 22 (1)]];
end
%-----------------------
if (abs(T4) > 0) 
if (abs(T3) > 0) 
res = [res;[41 23 (-1/T3)]];
res = [res;[41 50 (1)]];
else
res = [res;[41 22 (-1/T4)]];
res = [res;[41 50 (1)]];
end
if (abs(T3) > 0) 
res = [res;[42 22 (-T3/T4)]];
res = [res;[42 23 (1)]];
else
res = [res;[42 23 (1)]];
end
else
%--------------------
res = [res;[41 50 (1)]];
res = [res;[42 22 (-1)]];
res = [res;[42 23 (1)]];
end
%-----------------------
if (t < 0 ) 
res = [res;[43 8 (1)]];
res = [res;[43 23 (-1)]];
else
%--------------------
if (ev(1) > 0 ) 
res = [res;[43 8 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[43 8 (1)]];
else
res = [res;[43 8 (1)]];
res = [res;[43 23 (-1)]];
end
end
end
%--------------------------------------------------------------------------
res = [res;[44 23 (-1)]];
res = [res;[44 51 (1)]];
res = [res;[45 23 (-1)]];
res = [res;[45 52 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:19];[1:19];ones(1,19)]';
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
if  (V12 > VSTMAX  && ((VSTMAX)-(VSTMIN)) > 0)
res = 0;
return;
end
if  (V12 < VSTMIN  && ((VSTMAX)-(VSTMIN)) > 0)
res = 0;
return;
end
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
