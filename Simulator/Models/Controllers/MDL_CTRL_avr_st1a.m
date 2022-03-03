%----- Equations f 

function res = MDL_CTRL_avr_st1a(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_avr_st1a');
disp('dynamic_states:  dV1 dV3 dV31 dVA dVF');
disp('inputs:  VT VC VPSS IFD VUEL VOEL VREF');
disp('external_states:  EFD');
disp('internal_states:  V1 V2 VI HVout V31 V3 VA V4 HVout2 V5 VF V7 VUEL2 V1dot dV31dot dV3dot VAdot VA_ULS VA_LLS');
disp('events:  ev_VA_max ev_VA_min ev_VI_max ev_VI_min ev_HVout_max ev_HVout2_max ev_V5_min ev_V7_min ev_EFD_max ev_EFD_min');
disp('parameters:  VOS UEL TR VIMAX VIMIN TB TC TC1 TB1 KA TA VAMAX VAMIN KLR ILR KF TF VRMAX VRMIN KC VSTEP HASVUEL HASVOEL');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 5');
disp('Number of y = 37');
disp('Number of f = 5');
disp('Number of g = 30');
disp('Number of p = 23');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_avr_st1a([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [5 30 0 [28 29 30 31 32 33 34 35 36 37 ]];
return;
elseif flag == 101
res=[5 37 23 5 30];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dV1';...
'dV3';...
'dV31';...
'dVA';...
'dVF';...
};
algstates = { ... ;
'VT';...
'VC';...
'VPSS';...
'IFD';...
'VUEL';...
'VOEL';...
'VREF';...
'EFD';...
'V1';...
'V2';...
'VI';...
'HVout';...
'V31';...
'V3';...
'VA';...
'V4';...
'HVout2';...
'V5';...
'VF';...
'V7';...
'VUEL2';...
'V1dot';...
'dV31dot';...
'dV3dot';...
'VAdot';...
'VA_ULS';...
'VA_LLS';...
'ev_VA_max';...
'ev_VA_min';...
'ev_VI_max';...
'ev_VI_min';...
'ev_HVout_max';...
'ev_HVout2_max';...
'ev_V5_min';...
'ev_V7_min';...
'ev_EFD_max';...
'ev_EFD_min';...
};
parameters = { ... ;
'VOS';...
'UEL';...
'TR';...
'VIMAX';...
'VIMIN';...
'TB';...
'TC';...
'TC1';...
'TB1';...
'KA';...
'TA';...
'VAMAX';...
'VAMIN';...
'KLR';...
'ILR';...
'KF';...
'TF';...
'VRMAX';...
'VRMIN';...
'KC';...
'VSTEP';...
'HASVUEL';...
'HASVOEL';...
};
externalstates = { ... ;
'EFD';...
};
internalstates = { ... ;
'V1';...
'V2';...
'VI';...
'HVout';...
'V31';...
'V3';...
'VA';...
'V4';...
'HVout2';...
'V5';...
'VF';...
'V7';...
'VUEL2';...
'V1dot';...
'dV31dot';...
'dV3dot';...
'VAdot';...
'VA_ULS';...
'VA_LLS';...
};
events = { ... ;
'ev_VA_max';...
'ev_VA_min';...
'ev_VI_max';...
'ev_VI_min';...
'ev_HVout_max';...
'ev_HVout2_max';...
'ev_V5_min';...
'ev_V7_min';...
'ev_EFD_max';...
'ev_EFD_min';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,5);
res.y0=zeros(1,37);
res.p0=zeros(1,23);
res.x0(1) = 1; % dV1 
res.x0(2) = 0; % dV3 
res.x0(3) = 0; % dV31 
res.x0(4) = 0; % dVA 
res.x0(5) = 0; % dVF 
res.y0(1) = 1; % VT 
res.y0(2) = 1; % VC 
res.y0(3) = 0; % VPSS 
res.y0(4) = 30; % IFD 
res.y0(5) = -999; % VUEL 
res.y0(6) = 999; % VOEL 
res.y0(7) = 1; % VREF 
res.y0(8) = 1; % EFD 
res.y0(9) = 1; % V1 
res.y0(10) = 0; % V2 
res.y0(11) = 0; % VI 
res.y0(12) = 1; % HVout 
res.y0(13) = 1; % V31 
res.y0(14) = 1; % V3 
res.y0(15) = 0; % VA 
res.y0(16) = 1; % V4 
res.y0(17) = 1; % HVout2 
res.y0(18) = 1; % V5 
res.y0(19) = 0; % VF 
res.y0(20) = 0; % V7 
res.y0(21) = 0; % VUEL2 
res.y0(26) = 1; % VA_ULS 
res.y0(27) = 1; % VA_LLS 
res.p0(1) = 1; % VOS 
res.p0(2) = 0; % UEL 
res.p0(3) = 1.000000e-03; % TR 
res.p0(4) = 999; % VIMAX 
res.p0(5) = -999; % VIMIN 
res.p0(6) = 10; % TB 
res.p0(7) = 1; % TC 
res.p0(8) = 0; % TC1 
res.p0(9) = 0; % TB1 
res.p0(10) = 190; % KA 
res.p0(11) = 0; % TA 
res.p0(12) = 1.450000e+01; % VAMAX 
res.p0(13) = -1.450000e+01; % VAMIN 
res.p0(14) = 0; % KLR 
res.p0(15) = 0; % ILR 
res.p0(16) = 0; % KF 
res.p0(17) = 1; % TF 
res.p0(18) = 7.800000e+00; % VRMAX 
res.p0(19) = -6.700000e+00; % VRMIN 
res.p0(20) = 8.000000e-02; % KC 
res.p0(21) = 0; % VSTEP 
res.p0(22) = 0; % HASVUEL 
res.p0(23) = 0; % HASVOEL 
return;
elseif flag == 110
	res = [1  1  0  0  1  1  1  0  0  0];
return;
elseif flag == 111
	res = [0  0  0  0  0  0  0  0  0  0];
return;
elseif flag == 106
VOS = param(1);
UEL = param(2);
TR = param(3);
VIMAX = param(4);
VIMIN = param(5);
TB = param(6);
TC = param(7);
TC1 = param(8);
TB1 = param(9);
KA = param(10);
TA = param(11);
VAMAX = param(12);
VAMIN = param(13);
KLR = param(14);
ILR = param(15);
KF = param(16);
TF = param(17);
VRMAX = param(18);
VRMIN = param(19);
KC = param(20);
VSTEP = param(21);
HASVUEL = param(22);
HASVOEL = param(23);
if ( TF == 0 )
return;
end
if  TR == 0 
return;
end
if  TC == 0 
return;
end
if  TB == 0 
return;
end
if  TC1 == 0 
return;
end
if  TB1 == 0 
return;
end
if  TA == 0 
return;
end
if  TF == 0 
return;
end
end
%------- map parameters -------------------
VOS = param(1);
UEL = param(2);
TR = param(3);
VIMAX = param(4);
VIMIN = param(5);
TB = param(6);
TC = param(7);
TC1 = param(8);
TB1 = param(9);
KA = param(10);
TA = param(11);
VAMAX = param(12);
VAMIN = param(13);
KLR = param(14);
ILR = param(15);
KF = param(16);
TF = param(17);
VRMAX = param(18);
VRMIN = param(19);
KC = param(20);
VSTEP = param(21);
HASVUEL = param(22);
HASVOEL = param(23);
%------- map x -------------------
dV1 = x(1);
dV3 = x(2);
dV31 = x(3);
dVA = x(4);
dVF = x(5);
%------- map y -------------------
VT = y(1);
VC = y(2);
VPSS = y(3);
IFD = y(4);
VUEL = y(5);
VOEL = y(6);
VREF = y(7);
EFD = y(8);
V1 = y(9);
V2 = y(10);
VI = y(11);
HVout = y(12);
V31 = y(13);
V3 = y(14);
VA = y(15);
V4 = y(16);
HVout2 = y(17);
V5 = y(18);
VF = y(19);
V7 = y(20);
VUEL2 = y(21);
V1dot = y(22);
dV31dot = y(23);
dV3dot = y(24);
VAdot = y(25);
VA_ULS = y(26);
VA_LLS = y(27);
ev_VA_max = y(28);
ev_VA_min = y(29);
ev_VI_max = y(30);
ev_VI_min = y(31);
ev_HVout_max = y(32);
ev_HVout2_max = y(33);
ev_V5_min = y(34);
ev_V7_min = y(35);
ev_EFD_max = y(36);
ev_EFD_min = y(37);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res(1) = V1dot;
res(3) = dV31dot;
res(2) = dV3dot;
res(4) = VA_LLS*VA_ULS*VAdot;
if (abs(TF) > 0) 
res(5) = (KF*V5 - TF*dVF)/TF^2;
else
res(5) = 0;
end
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TF) > 0) 
res = [res;[5 5 (-1/TF)]];
else
end
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res = [res;[1 22 (1)]];
res = [res;[3 23 (1)]];
res = [res;[2 24 (1)]];
res = [res;[4 25 (VA_LLS*VA_ULS)]];
res = [res;[4 26 (VA_LLS*VAdot)]];
res = [res;[4 27 (VA_ULS*VAdot)]];
if (abs(TF) > 0) 
res = [res;[5 18 (KF/TF^2)]];
else
end
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
%--------------------
if (abs(TR) > 0) 
res(1) = V1dot - (VC - dV1)/TR;
res(2) = V1 - dV1;
else
res(1) = V1dot;
res(2) = V1 - VC;
end
if (abs(TB) > 0) 
if (abs(TC) > 0) 
res(3) = dV31dot - (V31 - dV31)/TC;
else
res(3) = dV31dot - (HVout - dV31)/TB;
end
if (abs(TC) > 0) 
res(4) = V31 - (TC*(HVout + dV31*(TB/TC - 1)))/TB;
else
res(4) = V31 - dV31;
end
else
%--------------------
res(3) = dV31dot;
res(4) = V31 - HVout;
end
if (abs(TB1) > 0) 
if (abs(TC1) > 0) 
res(5) = dV3dot - (V3 - dV3)/TC1;
else
res(5) = dV3dot - (V31 - dV3)/TB1;
end
if (abs(TC1) > 0) 
res(6) = V3 - (TC1*(V31 + dV3*(TB1/TC1 - 1)))/TB1;
else
res(6) = V3 - dV3;
end
else
%--------------------
res(5) = dV3dot;
res(6) = V3 - V31;
end
%--------------------
if (abs(TA) > 0) 
res(7) = VAdot + (dVA - KA*V3)/TA;
res(8) = VA + VAMIN*(VA_LLS - 1) + VAMAX*(VA_ULS - 1) - VA_LLS*VA_ULS*dVA;
else
%--------------------
if (t < 0 ) 
res(7) = VAdot;
res(8) = VA - KA*V3;
else
if (ev(1) > 0 ) 
res(7) = VAdot;
res(8) = VA - VAMAX;
else
if (ev(2) < 0 ) 
res(7) = VAdot;
res(8) = VA - VAMIN;
else
res(7) = VAdot;
res(8) = VA - KA*V3;
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VA_max <= 0 )) 
res(9) = VA_ULS - 1;
else
res(9) = VA_ULS;
end
else
res(9) = VA_ULS;
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VA_min >= 0)) 
res(10) = VA_LLS - 1;
else
res(10) = VA_LLS;
end
else
res(10) = VA_LLS;
end
%--------------------
if (abs(TF) > 0) 
res(11) = VF + dVF - (KF*V5)/TF;
else
res(11) = VF - (KF*V5)/TF;
end
if (abs(UEL-1.0*(0))<1e-9) 
res(12) = VUEL2;
else
res(12) = VUEL2 - VUEL;
end
%-----------------------
if (abs(UEL-1.0*(3))<1e-9) 
if (abs(VOS-1.0*(1))<1e-9) 
res(13) = V1 + V2 + VF - VPSS - VREF - VSTEP - VUEL2;
else
res(13) = V1 + V2 + VF - VREF - VSTEP - VUEL2;
end
else
if (abs(VOS-1.0*(1))<1e-9) 
res(13) = V1 + V2 + VF - VPSS - VREF - VSTEP;
else
res(13) = V1 + V2 + VF - VREF - VSTEP;
end
end
%-----------------------
if (t < 0 ) 
res(14) = VI - V2;
else
%--------------------
if (ev(3) > 0 ) 
res(14) = VI - VIMAX;
else
if (ev(4) < 0 ) 
res(14) = VI - VIMIN;
else
res(14) = VI - V2;
end
end
end
%-----------------------
if (abs(UEL-1.0*(2))<1e-9) 
if (t < 0 || HASVUEL < 0.5) 
res(15) = HVout - VI;
else
%--------------------
if (ev(5) > 0 ) 
res(15) = HVout - VI;
else
res(15) = HVout - VUEL2;
end
end
else
res(15) = HVout - VI;
end
%-----------------------
if (abs(VOS-1.0*(0))<1e-9) 
res(16) = V4 + V7 - VA - VPSS;
else
res(16) = V4 + V7 - VA;
end
%-----------------------
if (abs(UEL-1.0*(1))<1e-9) 
if (t < 0 || HASVUEL < 0.5) 
res(17) = HVout2 - V4;
else
%--------------------
if (ev(6) > 0 ) 
res(17) = HVout2 - V4;
else
res(17) = HVout2 - VUEL2;
end
end
else
res(17) = HVout2 - V4;
end
%-----------------------
if (t < 0 || HASVOEL < 0.5) 
res(18) = V5 - HVout2;
else
%--------------------
if (ev(7) < 0 ) 
res(18) = V5 - HVout2;
else
res(18) = V5 - VOEL;
end
end
%-----------------------
if (t < 0 ) 
res(19) = V7 - KLR*(IFD - ILR);
else
%--------------------
if (ev(8) < 0 ) 
res(19) = V7;
else
res(19) = V7 - KLR*(IFD - ILR);
end
end
%-----------------------
if (t < 0 ) 
res(20) = EFD - V5;
else
%--------------------
if (ev(9) > 0 ) 
res(20) = EFD - VRMAX*VT - IFD*KC;
else
if (ev(10) < 0 ) 
res(20) = EFD - VRMIN*VT;
else
res(20) = EFD - V5;
end
end
end
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
res(21) = ev_VA_max - VA_ULS*(VA - VAMAX) + VAdot*(VA_ULS - 1);
res(22) = ev_VA_min - VA_LLS*(VA - VAMIN) + VAdot*(VA_LLS - 1);
else
res(21) = VAMAX + ev_VA_max - KA*V3;
res(22) = VAMIN + ev_VA_min - KA*V3;
end
res(23) = VIMAX - V2 + ev_VI_max;
res(24) = VIMIN - V2 + ev_VI_min;
res(25) = VUEL2 - VI + ev_HVout_max;
res(26) = VUEL2 - V4 + ev_HVout2_max;
res(27) = VOEL - HVout2 + ev_V5_min;
res(28) = ev_V7_min - KLR*(IFD - ILR);
res(29) = ev_EFD_max - V5 + VRMAX*VT - IFD*KC;
res(30) = ev_EFD_min - V5 + VRMIN*VT;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(TR) > 0) 
res = [res;[1 1 (1/TR)]];
res = [res;[2 1 (-1)]];
else
end
if (abs(TB) > 0) 
if (abs(TC) > 0) 
res = [res;[3 3 (1/TC)]];
else
res = [res;[3 3 (1/TB)]];
end
if (abs(TC) > 0) 
res = [res;[4 3 (-(TB - TC)/TB)]];
else
res = [res;[4 3 (-1)]];
end
else
%--------------------
end
if (abs(TB1) > 0) 
if (abs(TC1) > 0) 
res = [res;[5 2 (1/TC1)]];
else
res = [res;[5 2 (1/TB1)]];
end
if (abs(TC1) > 0) 
res = [res;[6 2 (-(TB1 - TC1)/TB1)]];
else
res = [res;[6 2 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(TA) > 0) 
res = [res;[7 4 (1/TA)]];
res = [res;[8 4 (-VA_LLS*VA_ULS)]];
else
%--------------------
if (t < 0 ) 
else
if (ev(1) > 0 ) 
else
if (ev(2) < 0 ) 
else
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VA_max <= 0 )) 
else
end
else
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VA_min >= 0)) 
else
end
else
end
%--------------------
if (abs(TF) > 0) 
res = [res;[11 5 (1)]];
else
end
if (abs(UEL-1.0*(0))<1e-9) 
else
end
%-----------------------
if (abs(UEL-1.0*(3))<1e-9) 
if (abs(VOS-1.0*(1))<1e-9) 
else
end
else
if (abs(VOS-1.0*(1))<1e-9) 
else
end
end
%-----------------------
if (t < 0 ) 
else
%--------------------
if (ev(3) > 0 ) 
else
if (ev(4) < 0 ) 
else
end
end
end
%-----------------------
if (abs(UEL-1.0*(2))<1e-9) 
if (t < 0 || HASVUEL < 0.5) 
else
%--------------------
if (ev(5) > 0 ) 
else
end
end
else
end
%-----------------------
if (abs(VOS-1.0*(0))<1e-9) 
else
end
%-----------------------
if (abs(UEL-1.0*(1))<1e-9) 
if (t < 0 || HASVUEL < 0.5) 
else
%--------------------
if (ev(6) > 0 ) 
else
end
end
else
end
%-----------------------
if (t < 0 || HASVOEL < 0.5) 
else
%--------------------
if (ev(7) < 0 ) 
else
end
end
%-----------------------
if (t < 0 ) 
else
%--------------------
if (ev(8) < 0 ) 
else
end
end
%-----------------------
if (t < 0 ) 
else
%--------------------
if (ev(9) > 0 ) 
else
if (ev(10) < 0 ) 
else
end
end
end
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
else
end
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(TR) > 0) 
res = [res;[1 2 (-1/TR)]];
res = [res;[1 22 (1)]];
res = [res;[2 9 (1)]];
else
res = [res;[1 22 (1)]];
res = [res;[2 2 (-1)]];
res = [res;[2 9 (1)]];
end
if (abs(TB) > 0) 
if (abs(TC) > 0) 
res = [res;[3 13 (-1/TC)]];
res = [res;[3 23 (1)]];
else
res = [res;[3 12 (-1/TB)]];
res = [res;[3 23 (1)]];
end
if (abs(TC) > 0) 
res = [res;[4 12 (-TC/TB)]];
res = [res;[4 13 (1)]];
else
res = [res;[4 13 (1)]];
end
else
%--------------------
res = [res;[3 23 (1)]];
res = [res;[4 12 (-1)]];
res = [res;[4 13 (1)]];
end
if (abs(TB1) > 0) 
if (abs(TC1) > 0) 
res = [res;[5 14 (-1/TC1)]];
res = [res;[5 24 (1)]];
else
res = [res;[5 13 (-1/TB1)]];
res = [res;[5 24 (1)]];
end
if (abs(TC1) > 0) 
res = [res;[6 13 (-TC1/TB1)]];
res = [res;[6 14 (1)]];
else
res = [res;[6 14 (1)]];
end
else
%--------------------
res = [res;[5 24 (1)]];
res = [res;[6 13 (-1)]];
res = [res;[6 14 (1)]];
end
%--------------------
if (abs(TA) > 0) 
res = [res;[7 14 (-KA/TA)]];
res = [res;[7 25 (1)]];
res = [res;[8 15 (1)]];
res = [res;[8 26 (VAMAX - VA_LLS*dVA)]];
res = [res;[8 27 (VAMIN - VA_ULS*dVA)]];
else
%--------------------
if (t < 0 ) 
res = [res;[7 25 (1)]];
res = [res;[8 14 (-KA)]];
res = [res;[8 15 (1)]];
else
if (ev(1) > 0 ) 
res = [res;[7 25 (1)]];
res = [res;[8 15 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[7 25 (1)]];
res = [res;[8 15 (1)]];
else
res = [res;[7 25 (1)]];
res = [res;[8 14 (-KA)]];
res = [res;[8 15 (1)]];
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VA_max <= 0 )) 
res = [res;[9 26 (1)]];
else
res = [res;[9 26 (1)]];
end
else
res = [res;[9 26 (1)]];
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VA_min >= 0)) 
res = [res;[10 27 (1)]];
else
res = [res;[10 27 (1)]];
end
else
res = [res;[10 27 (1)]];
end
%--------------------
if (abs(TF) > 0) 
res = [res;[11 18 (-KF/TF)]];
res = [res;[11 19 (1)]];
else
res = [res;[11 18 (-KF/TF)]];
res = [res;[11 19 (1)]];
end
if (abs(UEL-1.0*(0))<1e-9) 
res = [res;[12 21 (1)]];
else
res = [res;[12 5 (-1)]];
res = [res;[12 21 (1)]];
end
%-----------------------
if (abs(UEL-1.0*(3))<1e-9) 
if (abs(VOS-1.0*(1))<1e-9) 
res = [res;[13 3 (-1)]];
res = [res;[13 7 (-1)]];
res = [res;[13 9 (1)]];
res = [res;[13 10 (1)]];
res = [res;[13 19 (1)]];
res = [res;[13 21 (-1)]];
else
res = [res;[13 7 (-1)]];
res = [res;[13 9 (1)]];
res = [res;[13 10 (1)]];
res = [res;[13 19 (1)]];
res = [res;[13 21 (-1)]];
end
else
if (abs(VOS-1.0*(1))<1e-9) 
res = [res;[13 3 (-1)]];
res = [res;[13 7 (-1)]];
res = [res;[13 9 (1)]];
res = [res;[13 10 (1)]];
res = [res;[13 19 (1)]];
else
res = [res;[13 7 (-1)]];
res = [res;[13 9 (1)]];
res = [res;[13 10 (1)]];
res = [res;[13 19 (1)]];
end
end
%-----------------------
if (t < 0 ) 
res = [res;[14 10 (-1)]];
res = [res;[14 11 (1)]];
else
%--------------------
if (ev(3) > 0 ) 
res = [res;[14 11 (1)]];
else
if (ev(4) < 0 ) 
res = [res;[14 11 (1)]];
else
res = [res;[14 10 (-1)]];
res = [res;[14 11 (1)]];
end
end
end
%-----------------------
if (abs(UEL-1.0*(2))<1e-9) 
if (t < 0 || HASVUEL < 0.5) 
res = [res;[15 11 (-1)]];
res = [res;[15 12 (1)]];
else
%--------------------
if (ev(5) > 0 ) 
res = [res;[15 11 (-1)]];
res = [res;[15 12 (1)]];
else
res = [res;[15 12 (1)]];
res = [res;[15 21 (-1)]];
end
end
else
res = [res;[15 11 (-1)]];
res = [res;[15 12 (1)]];
end
%-----------------------
if (abs(VOS-1.0*(0))<1e-9) 
res = [res;[16 3 (-1)]];
res = [res;[16 15 (-1)]];
res = [res;[16 16 (1)]];
res = [res;[16 20 (1)]];
else
res = [res;[16 15 (-1)]];
res = [res;[16 16 (1)]];
res = [res;[16 20 (1)]];
end
%-----------------------
if (abs(UEL-1.0*(1))<1e-9) 
if (t < 0 || HASVUEL < 0.5) 
res = [res;[17 16 (-1)]];
res = [res;[17 17 (1)]];
else
%--------------------
if (ev(6) > 0 ) 
res = [res;[17 16 (-1)]];
res = [res;[17 17 (1)]];
else
res = [res;[17 17 (1)]];
res = [res;[17 21 (-1)]];
end
end
else
res = [res;[17 16 (-1)]];
res = [res;[17 17 (1)]];
end
%-----------------------
if (t < 0 || HASVOEL < 0.5) 
res = [res;[18 17 (-1)]];
res = [res;[18 18 (1)]];
else
%--------------------
if (ev(7) < 0 ) 
res = [res;[18 17 (-1)]];
res = [res;[18 18 (1)]];
else
res = [res;[18 6 (-1)]];
res = [res;[18 18 (1)]];
end
end
%-----------------------
if (t < 0 ) 
res = [res;[19 4 (-KLR)]];
res = [res;[19 20 (1)]];
else
%--------------------
if (ev(8) < 0 ) 
res = [res;[19 20 (1)]];
else
res = [res;[19 4 (-KLR)]];
res = [res;[19 20 (1)]];
end
end
%-----------------------
if (t < 0 ) 
res = [res;[20 8 (1)]];
res = [res;[20 18 (-1)]];
else
%--------------------
if (ev(9) > 0 ) 
res = [res;[20 1 (-VRMAX)]];
res = [res;[20 4 (-KC)]];
res = [res;[20 8 (1)]];
else
if (ev(10) < 0 ) 
res = [res;[20 1 (-VRMIN)]];
res = [res;[20 8 (1)]];
else
res = [res;[20 8 (1)]];
res = [res;[20 18 (-1)]];
end
end
end
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
res = [res;[21 15 (-VA_ULS)]];
res = [res;[21 25 (VA_ULS - 1)]];
res = [res;[21 26 (VAMAX - VA + VAdot)]];
res = [res;[21 28 (1)]];
res = [res;[22 15 (-VA_LLS)]];
res = [res;[22 25 (VA_LLS - 1)]];
res = [res;[22 27 (VAMIN - VA + VAdot)]];
res = [res;[22 29 (1)]];
else
res = [res;[21 14 (-KA)]];
res = [res;[21 28 (1)]];
res = [res;[22 14 (-KA)]];
res = [res;[22 29 (1)]];
end
res = [res;[23 10 (-1)]];
res = [res;[23 30 (1)]];
res = [res;[24 10 (-1)]];
res = [res;[24 31 (1)]];
res = [res;[25 11 (-1)]];
res = [res;[25 21 (1)]];
res = [res;[25 32 (1)]];
res = [res;[26 16 (-1)]];
res = [res;[26 21 (1)]];
res = [res;[26 33 (1)]];
res = [res;[27 6 (1)]];
res = [res;[27 17 (-1)]];
res = [res;[27 34 (1)]];
res = [res;[28 4 (-KLR)]];
res = [res;[28 35 (1)]];
res = [res;[29 1 (VRMAX)]];
res = [res;[29 4 (-KC)]];
res = [res;[29 18 (-1)]];
res = [res;[29 36 (1)]];
res = [res;[30 1 (VRMIN)]];
res = [res;[30 18 (-1)]];
res = [res;[30 37 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TA) > 0)
if (ev==1)
res(4) = VA;
end
end
if (abs(TA) > 0)
if (ev==2)
res(4) = VA;
end
end
elseif flag == 8
%----- hx 
res = [[1:5];[1:5];ones(1,5)]';
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TA) > 0)
if (ev==1)
end
end
if (abs(TA) > 0)
if (ev==2)
end
end
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TA) > 0)
if (ev==1)
res = [res;[4 15 (1)]];
end
end
if (abs(TA) > 0)
if (ev==2)
res = [res;[4 15 (1)]];
end
end
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
if abs(TA) > 0
res = 0;
if  dVA > VAMAX 
res = 0;
return;
end
if  VA > VAMAX 
res = 0;
return;
end
return;
end
if abs(TA) > 0
res = 0;
if  dVA < VAMIN 
res = 0;
return;
end
if  VA < VAMIN 
res = 0;
return;
end
return;
end
if  (V2 > VIMAX  && ((VIMAX)-(VIMIN)) > 0)
res = 0;
return;
end
if  (V2 < VIMIN  && ((VIMAX)-(VIMIN)) > 0)
res = 0;
return;
end
if  (KLR*(IFD-ILR) < 0)
res = 0;
return;
end
if  (V5 > VT*VRMAX-IFD*KC  && ((VT*VRMAX-IFD*KC)-(VT*VRMIN)) > 0)
res = 0;
return;
end
if  (V5 < VT*VRMIN  && ((VT*VRMAX-IFD*KC)-(VT*VRMIN)) > 0)
res = 0;
return;
end
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
