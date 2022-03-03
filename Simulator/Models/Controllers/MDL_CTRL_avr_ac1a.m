%----- Equations f 

function res = MDL_CTRL_avr_ac1a(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_avr_ac1a');
disp('dynamic_states:  dV1 dV3 dV4 dVE dVF');
disp('inputs:  VC VPSS VUEL VOEL VREF IFD');
disp('external_states:  EFD');
disp('internal_states:  VE V1 V4 HVout LVout VR FEX V2 V3 V5 VF VFE VX V1dot dV3dot V4dot V4_ULS V4_LLS VEdot VE_LLS');
disp('events:  ev_V4_max ev_V4_min ev_VE_min ev_HVout_max ev_LVout_min ev_VR_max ev_VR_min ev_statexc1 ev_statexc2 ev_statexc3 ev_statexc4 ev_VX_1 ev_VX_2');
disp('parameters:  TR TB TC KA TA VAMAX VAMIN TE KF TF KC KD KE E1 SE1 E2 SE2 VRMAX VRMIN VSTEP HASVUEL HASVOEL FMODE VX_A1 VX_B1');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 5');
disp('Number of y = 40');
disp('Number of f = 5');
disp('Number of g = 34');
disp('Number of p = 25');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_avr_ac1a([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [5 34 0 [26 27 30 31 32 33 34 35 36 37 38 39 40 ]];
return;
elseif flag == 101
res=[5 40 25 5 34];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dV1';...
'dV3';...
'dV4';...
'dVE';...
'dVF';...
};
algstates = { ... ;
'VC';...
'VPSS';...
'VUEL';...
'VOEL';...
'VREF';...
'IFD';...
'EFD';...
'VE';...
'V1';...
'V4';...
'HVout';...
'LVout';...
'VR';...
'FEX';...
'V2';...
'V3';...
'V5';...
'VF';...
'VFE';...
'VX';...
'V1dot';...
'dV3dot';...
'V4dot';...
'V4_ULS';...
'V4_LLS';...
'ev_V4_max';...
'ev_V4_min';...
'VEdot';...
'VE_LLS';...
'ev_VE_min';...
'ev_HVout_max';...
'ev_LVout_min';...
'ev_VR_max';...
'ev_VR_min';...
'ev_statexc1';...
'ev_statexc2';...
'ev_statexc3';...
'ev_statexc4';...
'ev_VX_1';...
'ev_VX_2';...
};
parameters = { ... ;
'TR';...
'TB';...
'TC';...
'KA';...
'TA';...
'VAMAX';...
'VAMIN';...
'TE';...
'KF';...
'TF';...
'KC';...
'KD';...
'KE';...
'E1';...
'SE1';...
'E2';...
'SE2';...
'VRMAX';...
'VRMIN';...
'VSTEP';...
'HASVUEL';...
'HASVOEL';...
'FMODE';...
'VX_A1';...
'VX_B1';...
};
externalstates = { ... ;
'EFD';...
};
internalstates = { ... ;
'VE';...
'V1';...
'V4';...
'HVout';...
'LVout';...
'VR';...
'FEX';...
'V2';...
'V3';...
'V5';...
'VF';...
'VFE';...
'VX';...
'V1dot';...
'dV3dot';...
'V4dot';...
'V4_ULS';...
'V4_LLS';...
'VEdot';...
'VE_LLS';...
};
events = { ... ;
'ev_V4_max';...
'ev_V4_min';...
'ev_VE_min';...
'ev_HVout_max';...
'ev_LVout_min';...
'ev_VR_max';...
'ev_VR_min';...
'ev_statexc1';...
'ev_statexc2';...
'ev_statexc3';...
'ev_statexc4';...
'ev_VX_1';...
'ev_VX_2';...
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
res.y0=zeros(1,40);
res.p0=zeros(1,25);
res.x0(1) = 1; % dV1 
res.x0(2) = 0; % dV3 
res.x0(3) = 0; % dV4 
res.x0(4) = 1; % dVE 
res.x0(5) = 1; % dVF 
res.y0(1) = 1; % VC 
res.y0(2) = 0; % VPSS 
res.y0(3) = -999; % VUEL 
res.y0(4) = 999; % VOEL 
res.y0(5) = 1; % VREF 
res.y0(6) = 30; % IFD 
res.y0(7) = 1; % EFD 
res.y0(8) = 1; % VE 
res.y0(9) = 1; % V1 
res.y0(10) = 0; % V4 
res.y0(11) = 1; % HVout 
res.y0(12) = 1; % LVout 
res.y0(13) = 1; % VR 
res.y0(14) = 1; % FEX 
res.y0(15) = 1; % V2 
res.y0(16) = 1; % V3 
res.y0(17) = 0; % V5 
res.y0(18) = 0; % VF 
res.y0(19) = 0; % VFE 
res.y0(20) = 0; % VX 
res.y0(24) = 1; % V4_ULS 
res.y0(25) = 1; % V4_LLS 
res.y0(29) = 1; % VE_LLS 
res.p0(1) = 1.000000e-04; % TR 
res.p0(2) = 1.000000e-04; % TB 
res.p0(3) = 1.000000e-04; % TC 
res.p0(4) = 400; % KA 
res.p0(5) = 2.000000e-01; % TA 
res.p0(6) = 1.450000e+01; % VAMAX 
res.p0(7) = -1.450000e+01; % VAMIN 
res.p0(8) = 8.000000e-01; % TE 
res.p0(9) = 3.000000e-02; % KF 
res.p0(10) = 1; % TF 
res.p0(11) = 2.000000e-01; % KC 
res.p0(12) = 3.800000e-01; % KD 
res.p0(13) = 1; % KE 
res.p0(14) = 3.135000e+00; % E1 
res.p0(15) = 3.000000e-02; % SE1 
res.p0(16) = 4.180000e+00; % E2 
res.p0(17) = 1.000000e-01; % SE2 
res.p0(18) = 6.030000e+00; % VRMAX 
res.p0(19) = -5.430000e+00; % VRMIN 
res.p0(20) = 0; % VSTEP 
res.p0(21) = 0; % HASVUEL 
res.p0(22) = 0; % HASVOEL 
res.p0(23) = 1; % FMODE 
return;
elseif flag == 110
	res = [1  1  1  1  1  0  0  0  0  0  0  0  0];
return;
elseif flag == 111
	res = [0  0  0  0  0  0  0  0  0  0  0  0  0];
return;
elseif flag == 106
TR = param(1);
TB = param(2);
TC = param(3);
KA = param(4);
TA = param(5);
VAMAX = param(6);
VAMIN = param(7);
TE = param(8);
KF = param(9);
TF = param(10);
KC = param(11);
KD = param(12);
KE = param(13);
E1 = param(14);
SE1 = param(15);
E2 = param(16);
SE2 = param(17);
VRMAX = param(18);
VRMIN = param(19);
VSTEP = param(20);
HASVUEL = param(21);
HASVOEL = param(22);
FMODE = param(23);
VX_A1 = param(24);
VX_B1 = param(25);
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
if  TA == 0 
return;
end
if  TF == 0 
return;
end
end
%------- map parameters -------------------
TR = param(1);
TB = param(2);
TC = param(3);
KA = param(4);
TA = param(5);
VAMAX = param(6);
VAMIN = param(7);
TE = param(8);
KF = param(9);
TF = param(10);
KC = param(11);
KD = param(12);
KE = param(13);
E1 = param(14);
SE1 = param(15);
E2 = param(16);
SE2 = param(17);
VRMAX = param(18);
VRMIN = param(19);
VSTEP = param(20);
HASVUEL = param(21);
HASVOEL = param(22);
FMODE = param(23);
VX_A1 = param(24);
VX_B1 = param(25);
%------- map x -------------------
dV1 = x(1);
dV3 = x(2);
dV4 = x(3);
dVE = x(4);
dVF = x(5);
%------- map y -------------------
VC = y(1);
VPSS = y(2);
VUEL = y(3);
VOEL = y(4);
VREF = y(5);
IFD = y(6);
EFD = y(7);
VE = y(8);
V1 = y(9);
V4 = y(10);
HVout = y(11);
LVout = y(12);
VR = y(13);
FEX = y(14);
V2 = y(15);
V3 = y(16);
V5 = y(17);
VF = y(18);
VFE = y(19);
VX = y(20);
V1dot = y(21);
dV3dot = y(22);
V4dot = y(23);
V4_ULS = y(24);
V4_LLS = y(25);
ev_V4_max = y(26);
ev_V4_min = y(27);
VEdot = y(28);
VE_LLS = y(29);
ev_VE_min = y(30);
ev_HVout_max = y(31);
ev_LVout_min = y(32);
ev_VR_max = y(33);
ev_VR_min = y(34);
ev_statexc1 = y(35);
ev_statexc2 = y(36);
ev_statexc3 = y(37);
ev_statexc4 = y(38);
ev_VX_1 = y(39);
ev_VX_2 = y(40);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res(1) = V1dot;
res(2) = dV3dot;
res(3) = V4_LLS*V4_ULS*V4dot;
if (abs(TF) > 0) 
res(5) = (KF*VFE - TF*dVF)/TF^2;
else
res(5) = 0;
end
res(4) = VE_LLS*VEdot;
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
res = [res;[1 21 (1)]];
res = [res;[2 22 (1)]];
res = [res;[3 23 (V4_LLS*V4_ULS)]];
res = [res;[3 24 (V4_LLS*V4dot)]];
res = [res;[3 25 (V4_ULS*V4dot)]];
if (abs(TF) > 0) 
res = [res;[5 19 (KF/TF^2)]];
else
end
res = [res;[4 28 (VE_LLS)]];
res = [res;[4 29 (VEdot)]];
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
res(3) = dV3dot - (V3 - dV3)/TC;
else
res(3) = dV3dot - (V2 - dV3)/TB;
end
if (abs(TC) > 0) 
res(4) = V3 - (TC*(V2 + dV3*(TB/TC - 1)))/TB;
else
res(4) = V3 - dV3;
end
else
%--------------------
res(3) = dV3dot;
res(4) = V3 - V2;
end
%--------------------
if (abs(TA) > 0) 
res(5) = V4dot + (dV4 - KA*V3)/TA;
res(6) = V4 + VAMIN*(V4_LLS - 1) + VAMAX*(V4_ULS - 1) - V4_LLS*V4_ULS*dV4;
else
%--------------------
if (t < 0 ) 
res(5) = V4dot;
res(6) = V4 - KA*V3;
else
if (ev(1) > 0 ) 
res(5) = V4dot;
res(6) = V4 - VAMAX;
else
if (ev(2) < 0 ) 
res(5) = V4dot;
res(6) = V4 - VAMIN;
else
res(5) = V4dot;
res(6) = V4 - KA*V3;
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_V4_max <= 0 )) 
res(7) = V4_ULS - 1;
else
res(7) = V4_ULS;
end
else
res(7) = V4_ULS;
end
if (abs(TA) > 0) 
if ((t < 0 || ev_V4_min >= 0)) 
res(8) = V4_LLS - 1;
else
res(8) = V4_LLS;
end
else
res(8) = V4_LLS;
end
%--------------------
if (abs(TF) > 0) 
res(9) = VF + dVF - (KF*VFE)/TF;
else
res(9) = VF - (KF*VFE)/TF;
end
%--------------------
res(10) = VEdot - V5/TE;
res(11) = VE + VE_LLS/1000000 - VE_LLS*dVE - 1/1000000;
if ((t < 0 || ev_VE_min >= 0)) 
res(12) = VE_LLS - 1;
else
res(12) = VE_LLS;
end
%--------------------------
res(13) = V1 + V2 + VF - VPSS - VREF - VSTEP;
%--------------------------
if (t < 0 || HASVUEL < 0.5) 
res(14) = HVout - V4;
else
%--------------------
if (ev(4) > 0 ) 
res(14) = HVout - V4;
else
res(14) = HVout - VUEL;
end
end
%--------------------------
if (t < 0 || HASVOEL < 0.5) 
res(15) = LVout - HVout;
else
%--------------------
if (ev(5) < 0 ) 
res(15) = LVout - HVout;
else
res(15) = LVout - VOEL;
end
end
%--------------------------
if (t < 0) 
res(16) = VR - LVout;
else
%--------------------
if (ev(6) > 0 ) 
res(16) = VR - VRMAX;
else
if (ev(7) < 0 ) 
res(16) = VR - VRMIN;
else
res(16) = VR - LVout;
end
end
end
%--------------------------
res(17) = V5 + VFE - VR;
%--------------------------
if (t < -10) 
res(18) = FEX + (IFD*KC)/VE - 1;
else
%--------------------
if (ev(9) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
res(18) = FEX + (29*IFD*KC)/(50*VE) - 1;
else
res(18) = FEX + (2887*IFD*KC)/(5000*VE) - 1;
end
else
if (ev(10) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
res(18) = FEX - (173*((IFD*KC)/VE + 413/50000)^2)/200 - 767/10000;
else
res(18) = FEX^2 + (IFD^2*KC^2)/VE^2 - 3/4;
end
else
if (ev(11) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
res(18) = FEX - (857*IFD*KC)/(500*VE) + 17/25;
else
res(18) = FEX + (433*IFD*KC)/(250*VE) - 433/250;
end
else
res(18) = FEX;
end
end
end
end
%--------------------------
if (abs(E1-1.0*(0.0))<1e-9) 
res(19) = VX - VE;
else
%--------------------
if (ev(12) < 0 ) 
res(19) = VX + VX_A1*(VE + VX_B1)^2;
else
if (ev(13) > 0 ) 
res(19) = VX - VX_A1*(VE - VX_B1)^2;
else
res(19) = VX;
end
end
end
%--------------------------
res(20) = VFE - VX - KE*VE - IFD*KD;
%--------------------------
res(21) = EFD - FEX*VE;
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
res(22) = ev_V4_max - V4_ULS*(V4 - VAMAX) + V4dot*(V4_ULS - 1);
res(23) = ev_V4_min - V4_LLS*(V4 - VAMIN) + V4dot*(V4_LLS - 1);
else
res(22) = VAMAX + ev_V4_max - KA*V3;
res(23) = VAMIN + ev_V4_min - KA*V3;
end
res(24) = ev_VE_min + VEdot*(VE_LLS - 1) - VE_LLS*(VE - 1/1000000);
res(25) = VUEL - V4 + ev_HVout_max;
res(26) = VOEL - HVout + ev_LVout_min;
res(27) = VRMAX - LVout + ev_VR_max;
res(28) = VRMIN - LVout + ev_VR_min;
res(29) = ev_statexc1 - (IFD*KC)/VE;
if (abs(FMODE-1.0*(0))<1e-9) 
res(30) = ev_statexc2 - (IFD*KC)/VE + 51/100;
res(31) = ev_statexc3 - (IFD*KC)/VE + 143/200;
else
res(30) = ev_statexc2 - (IFD*KC)/VE + 433/1000;
res(31) = ev_statexc3 - (IFD*KC)/VE + 3/4;
end
res(32) = ev_statexc4 - (IFD*KC)/VE + 1;
res(33) = ev_VX_1 - VX_B1 - VE;
res(34) = VX_B1 - VE + ev_VX_2;
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
res = [res;[3 2 (1/TC)]];
else
res = [res;[3 2 (1/TB)]];
end
if (abs(TC) > 0) 
res = [res;[4 2 (-(TB - TC)/TB)]];
else
res = [res;[4 2 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(TA) > 0) 
res = [res;[5 3 (1/TA)]];
res = [res;[6 3 (-V4_LLS*V4_ULS)]];
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
if ((t < 0 || ev_V4_max <= 0 )) 
else
end
else
end
if (abs(TA) > 0) 
if ((t < 0 || ev_V4_min >= 0)) 
else
end
else
end
%--------------------
if (abs(TF) > 0) 
res = [res;[9 5 (1)]];
else
end
%--------------------
res = [res;[11 4 (-VE_LLS)]];
if ((t < 0 || ev_VE_min >= 0)) 
else
end
%--------------------------
%--------------------------
if (t < 0 || HASVUEL < 0.5) 
else
%--------------------
if (ev(4) > 0 ) 
else
end
end
%--------------------------
if (t < 0 || HASVOEL < 0.5) 
else
%--------------------
if (ev(5) < 0 ) 
else
end
end
%--------------------------
if (t < 0) 
else
%--------------------
if (ev(6) > 0 ) 
else
if (ev(7) < 0 ) 
else
end
end
end
%--------------------------
%--------------------------
if (t < -10) 
else
%--------------------
if (ev(9) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
else
end
else
if (ev(10) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
else
end
else
if (ev(11) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
else
end
else
end
end
end
end
%--------------------------
if (abs(E1-1.0*(0.0))<1e-9) 
else
%--------------------
if (ev(12) < 0 ) 
else
if (ev(13) > 0 ) 
else
end
end
end
%--------------------------
%--------------------------
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
else
end
if (abs(FMODE-1.0*(0))<1e-9) 
else
end
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(TR) > 0) 
res = [res;[1 1 (-1/TR)]];
res = [res;[1 21 (1)]];
res = [res;[2 9 (1)]];
else
res = [res;[1 21 (1)]];
res = [res;[2 1 (-1)]];
res = [res;[2 9 (1)]];
end
if (abs(TB) > 0) 
if (abs(TC) > 0) 
res = [res;[3 16 (-1/TC)]];
res = [res;[3 22 (1)]];
else
res = [res;[3 15 (-1/TB)]];
res = [res;[3 22 (1)]];
end
if (abs(TC) > 0) 
res = [res;[4 15 (-TC/TB)]];
res = [res;[4 16 (1)]];
else
res = [res;[4 16 (1)]];
end
else
%--------------------
res = [res;[3 22 (1)]];
res = [res;[4 15 (-1)]];
res = [res;[4 16 (1)]];
end
%--------------------
if (abs(TA) > 0) 
res = [res;[5 16 (-KA/TA)]];
res = [res;[5 23 (1)]];
res = [res;[6 10 (1)]];
res = [res;[6 24 (VAMAX - V4_LLS*dV4)]];
res = [res;[6 25 (VAMIN - V4_ULS*dV4)]];
else
%--------------------
if (t < 0 ) 
res = [res;[5 23 (1)]];
res = [res;[6 10 (1)]];
res = [res;[6 16 (-KA)]];
else
if (ev(1) > 0 ) 
res = [res;[5 23 (1)]];
res = [res;[6 10 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[5 23 (1)]];
res = [res;[6 10 (1)]];
else
res = [res;[5 23 (1)]];
res = [res;[6 10 (1)]];
res = [res;[6 16 (-KA)]];
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_V4_max <= 0 )) 
res = [res;[7 24 (1)]];
else
res = [res;[7 24 (1)]];
end
else
res = [res;[7 24 (1)]];
end
if (abs(TA) > 0) 
if ((t < 0 || ev_V4_min >= 0)) 
res = [res;[8 25 (1)]];
else
res = [res;[8 25 (1)]];
end
else
res = [res;[8 25 (1)]];
end
%--------------------
if (abs(TF) > 0) 
res = [res;[9 18 (1)]];
res = [res;[9 19 (-KF/TF)]];
else
res = [res;[9 18 (1)]];
res = [res;[9 19 (-KF/TF)]];
end
%--------------------
res = [res;[10 17 (-1/TE)]];
res = [res;[10 28 (1)]];
res = [res;[11 8 (1)]];
res = [res;[11 29 (1/1000000 - dVE)]];
if ((t < 0 || ev_VE_min >= 0)) 
res = [res;[12 29 (1)]];
else
res = [res;[12 29 (1)]];
end
%--------------------------
res = [res;[13 2 (-1)]];
res = [res;[13 5 (-1)]];
res = [res;[13 9 (1)]];
res = [res;[13 15 (1)]];
res = [res;[13 18 (1)]];
%--------------------------
if (t < 0 || HASVUEL < 0.5) 
res = [res;[14 10 (-1)]];
res = [res;[14 11 (1)]];
else
%--------------------
if (ev(4) > 0 ) 
res = [res;[14 10 (-1)]];
res = [res;[14 11 (1)]];
else
res = [res;[14 3 (-1)]];
res = [res;[14 11 (1)]];
end
end
%--------------------------
if (t < 0 || HASVOEL < 0.5) 
res = [res;[15 11 (-1)]];
res = [res;[15 12 (1)]];
else
%--------------------
if (ev(5) < 0 ) 
res = [res;[15 11 (-1)]];
res = [res;[15 12 (1)]];
else
res = [res;[15 4 (-1)]];
res = [res;[15 12 (1)]];
end
end
%--------------------------
if (t < 0) 
res = [res;[16 12 (-1)]];
res = [res;[16 13 (1)]];
else
%--------------------
if (ev(6) > 0 ) 
res = [res;[16 13 (1)]];
else
if (ev(7) < 0 ) 
res = [res;[16 13 (1)]];
else
res = [res;[16 12 (-1)]];
res = [res;[16 13 (1)]];
end
end
end
%--------------------------
res = [res;[17 13 (-1)]];
res = [res;[17 17 (1)]];
res = [res;[17 19 (1)]];
%--------------------------
if (t < -10) 
res = [res;[18 6 (KC/VE)]];
res = [res;[18 8 (-(IFD*KC)/VE^2)]];
res = [res;[18 14 (1)]];
else
%--------------------
if (ev(9) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
res = [res;[18 6 ((29*KC)/(50*VE))]];
res = [res;[18 8 (-(29*IFD*KC)/(50*VE^2))]];
res = [res;[18 14 (1)]];
else
res = [res;[18 6 ((2887*KC)/(5000*VE))]];
res = [res;[18 8 (-(2887*IFD*KC)/(5000*VE^2))]];
res = [res;[18 14 (1)]];
end
else
if (ev(10) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
res = [res;[18 6 (-(173*KC*(413*VE + 50000*IFD*KC))/(5000000*VE^2))]];
res = [res;[18 8 ((173*IFD*KC*(413*VE + 50000*IFD*KC))/(5000000*VE^3))]];
res = [res;[18 14 (1)]];
else
res = [res;[18 6 ((2*IFD*KC^2)/VE^2)]];
res = [res;[18 8 (-(2*IFD^2*KC^2)/VE^3)]];
res = [res;[18 14 (2*FEX)]];
end
else
if (ev(11) < 0  ) 
if (abs(FMODE-1.0*(0))<1e-9) 
res = [res;[18 6 (-(857*KC)/(500*VE))]];
res = [res;[18 8 ((857*IFD*KC)/(500*VE^2))]];
res = [res;[18 14 (1)]];
else
res = [res;[18 6 ((433*KC)/(250*VE))]];
res = [res;[18 8 (-(433*IFD*KC)/(250*VE^2))]];
res = [res;[18 14 (1)]];
end
else
res = [res;[18 14 (1)]];
end
end
end
end
%--------------------------
if (abs(E1-1.0*(0.0))<1e-9) 
res = [res;[19 8 (-1)]];
res = [res;[19 20 (1)]];
else
%--------------------
if (ev(12) < 0 ) 
res = [res;[19 8 (VX_A1*(2*VE + 2*VX_B1))]];
res = [res;[19 20 (1)]];
else
if (ev(13) > 0 ) 
res = [res;[19 8 (-2*VX_A1*(VE - VX_B1))]];
res = [res;[19 20 (1)]];
else
res = [res;[19 20 (1)]];
end
end
end
%--------------------------
res = [res;[20 6 (-KD)]];
res = [res;[20 8 (-KE)]];
res = [res;[20 19 (1)]];
res = [res;[20 20 (-1)]];
%--------------------------
res = [res;[21 7 (1)]];
res = [res;[21 8 (-FEX)]];
res = [res;[21 14 (-VE)]];
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
res = [res;[22 10 (-V4_ULS)]];
res = [res;[22 23 (V4_ULS - 1)]];
res = [res;[22 24 (V4dot - V4 + VAMAX)]];
res = [res;[22 26 (1)]];
res = [res;[23 10 (-V4_LLS)]];
res = [res;[23 23 (V4_LLS - 1)]];
res = [res;[23 25 (V4dot - V4 + VAMIN)]];
res = [res;[23 27 (1)]];
else
res = [res;[22 16 (-KA)]];
res = [res;[22 26 (1)]];
res = [res;[23 16 (-KA)]];
res = [res;[23 27 (1)]];
end
res = [res;[24 8 (-VE_LLS)]];
res = [res;[24 28 (VE_LLS - 1)]];
res = [res;[24 29 (VEdot - VE + 1/1000000)]];
res = [res;[24 30 (1)]];
res = [res;[25 3 (1)]];
res = [res;[25 10 (-1)]];
res = [res;[25 31 (1)]];
res = [res;[26 4 (1)]];
res = [res;[26 11 (-1)]];
res = [res;[26 32 (1)]];
res = [res;[27 12 (-1)]];
res = [res;[27 33 (1)]];
res = [res;[28 12 (-1)]];
res = [res;[28 34 (1)]];
res = [res;[29 6 (-KC/VE)]];
res = [res;[29 8 ((IFD*KC)/VE^2)]];
res = [res;[29 35 (1)]];
if (abs(FMODE-1.0*(0))<1e-9) 
res = [res;[30 6 (-KC/VE)]];
res = [res;[30 8 ((IFD*KC)/VE^2)]];
res = [res;[30 36 (1)]];
res = [res;[31 6 (-KC/VE)]];
res = [res;[31 8 ((IFD*KC)/VE^2)]];
res = [res;[31 37 (1)]];
else
res = [res;[30 6 (-KC/VE)]];
res = [res;[30 8 ((IFD*KC)/VE^2)]];
res = [res;[30 36 (1)]];
res = [res;[31 6 (-KC/VE)]];
res = [res;[31 8 ((IFD*KC)/VE^2)]];
res = [res;[31 37 (1)]];
end
res = [res;[32 6 (-KC/VE)]];
res = [res;[32 8 ((IFD*KC)/VE^2)]];
res = [res;[32 38 (1)]];
res = [res;[33 8 (-1)]];
res = [res;[33 39 (1)]];
res = [res;[34 8 (-1)]];
res = [res;[34 40 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TA) > 0)
if (ev==1)
res(3) = V4;
end
end
if (abs(TA) > 0)
if (ev==2)
res(3) = V4;
end
end
if (ev==3)
res(4) = VE;
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
if (ev==3)
end
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TA) > 0)
if (ev==1)
res = [res;[3 10 (1)]];
end
end
if (abs(TA) > 0)
if (ev==2)
res = [res;[3 10 (1)]];
end
end
if (ev==3)
res = [res;[4 8 (1)]];
end
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
if  V4 > VAMAX
res = 0;
return;
end
if V4 < VAMIN
res = 0;
return;
end
if  VR > VRMAX
res = 0;
return;
end
if VR < VRMIN
res = 0;
return;
end
if VE < 0
res = 0;
return;
end
if abs(TA) > 0
res = 0;
if  dV4 > VAMAX 
res = 0;
return;
end
if  V4 > VAMAX 
res = 0;
return;
end
return;
end
if abs(TA) > 0
res = 0;
if  dV4 < VAMIN 
res = 0;
return;
end
if  V4 < VAMIN 
res = 0;
return;
end
return;
end
if  dVE < 1e-6 
res = 0;
return;
end
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
VX_A1=((SE2)*pow((sqrt(E2)-sqrt((E1)*(SE1)/(SE2))),2)/pow((E2)-(E1),2));
VX_B1=(sqrt((E1)*(E2))*(sqrt(E1)-sqrt((E2)*(SE1)/(SE2)))/(sqrt(E2)-sqrt((E1)*(SE1)/(SE2))));
end
