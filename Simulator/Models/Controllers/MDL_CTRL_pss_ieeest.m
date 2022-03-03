%----- Equations f 

function res = MDL_CTRL_pss_ieeest(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_pss_ieeest');
disp('dynamic_states:  dVT x1 x2 x3 x4 dV2 dV3 dV4');
disp('inputs:  W P VT IFD');
disp('external_states:  VPSS');
disp('internal_states:  derVT VIN1 V1 V1a V2 V3 V4 VSS dV2dot dV3dot');
disp('events:  ev_VCL ev_VCU ev_VSS_max ev_VSS_min');
disp('parameters:  A1 A2 A3 A4 A5 A6 T1 T2 T3 T4 T5 T6 KS LSMIN LSMAX VCL VCU SWS1');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 8');
disp('Number of y = 19');
disp('Number of f = 8');
disp('Number of g = 15');
disp('Number of p = 18');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_pss_ieeest([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [8 15 0 [14 15 18 19 ]];
return;
elseif flag == 101
res=[8 19 18 8 15];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dVT';...
'x1';...
'x2';...
'x3';...
'x4';...
'dV2';...
'dV3';...
'dV4';...
};
algstates = { ... ;
'W';...
'P';...
'VT';...
'IFD';...
'VPSS';...
'derVT';...
'VIN1';...
'V1';...
'V1a';...
'V2';...
'V3';...
'V4';...
'VSS';...
'ev_VCL';...
'ev_VCU';...
'dV2dot';...
'dV3dot';...
'ev_VSS_max';...
'ev_VSS_min';...
};
parameters = { ... ;
'A1';...
'A2';...
'A3';...
'A4';...
'A5';...
'A6';...
'T1';...
'T2';...
'T3';...
'T4';...
'T5';...
'T6';...
'KS';...
'LSMIN';...
'LSMAX';...
'VCL';...
'VCU';...
'SWS1';...
};
externalstates = { ... ;
'VPSS';...
};
internalstates = { ... ;
'derVT';...
'VIN1';...
'V1';...
'V1a';...
'V2';...
'V3';...
'V4';...
'VSS';...
'dV2dot';...
'dV3dot';...
};
events = { ... ;
'ev_VCL';...
'ev_VCU';...
'ev_VSS_max';...
'ev_VSS_min';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,8);
res.y0=zeros(1,19);
res.p0=zeros(1,18);
res.x0(1) = 0; % dVT 
res.x0(2) = 0; % x1 
res.x0(3) = 0; % x2 
res.x0(4) = 0; % x3 
res.x0(5) = 0; % x4 
res.x0(6) = 0; % dV2 
res.x0(7) = 0; % dV3 
res.x0(8) = 0; % dV4 
res.y0(1) = 1; % W 
res.y0(2) = 1; % P 
res.y0(3) = 1; % VT 
res.y0(4) = 1; % IFD 
res.y0(5) = 1; % VPSS 
res.y0(6) = 1; % derVT 
res.y0(7) = 1; % VIN1 
res.y0(8) = 1; % V1 
res.y0(9) = 1; % V1a 
res.y0(10) = 1; % V2 
res.y0(11) = 1; % V3 
res.y0(12) = 1; % V4 
res.y0(13) = 1; % VSS 
res.y0(14) = 0; % ev_VCL 
res.y0(15) = 0; % ev_VCU 
res.p0(1) = 1; % A1 
res.p0(2) = 2; % A2 
res.p0(3) = 3; % A3 
res.p0(4) = 4; % A4 
res.p0(5) = 5; % A5 
res.p0(6) = 6; % A6 
res.p0(7) = 1; % T1 
res.p0(8) = 1; % T2 
res.p0(9) = 3; % T3 
res.p0(10) = 4; % T4 
res.p0(11) = 3; % T5 
res.p0(12) = 2; % T6 
res.p0(13) = 1; % KS 
res.p0(14) = -10; % LSMIN 
res.p0(15) = 10; % LSMAX 
res.p0(16) = -1000000; % VCL 
res.p0(17) = 1000000; % VCU 
res.p0(18) = 1; % SWS1 
return;
elseif flag == 110
	res = [1  1  0  0];
return;
elseif flag == 111
	res = [0  0  0  0];
return;
elseif flag == 106
A1 = param(1);
A2 = param(2);
A3 = param(3);
A4 = param(4);
A5 = param(5);
A6 = param(6);
T1 = param(7);
T2 = param(8);
T3 = param(9);
T4 = param(10);
T5 = param(11);
T6 = param(12);
KS = param(13);
LSMIN = param(14);
LSMAX = param(15);
VCL = param(16);
VCU = param(17);
SWS1 = param(18);
if ( A2 == 0 )
return;
end
if ( A4 == 0 )
return;
end
if ( T6 == 0 )
return;
end
if  0.0001 == 0 
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
if  T6 == 0 
return;
end
end
%------- map parameters -------------------
A1 = param(1);
A2 = param(2);
A3 = param(3);
A4 = param(4);
A5 = param(5);
A6 = param(6);
T1 = param(7);
T2 = param(8);
T3 = param(9);
T4 = param(10);
T5 = param(11);
T6 = param(12);
KS = param(13);
LSMIN = param(14);
LSMAX = param(15);
VCL = param(16);
VCU = param(17);
SWS1 = param(18);
%------- map x -------------------
dVT = x(1);
x1 = x(2);
x2 = x(3);
x3 = x(4);
x4 = x(5);
dV2 = x(6);
dV3 = x(7);
dV4 = x(8);
%------- map y -------------------
W = y(1);
P = y(2);
VT = y(3);
IFD = y(4);
VPSS = y(5);
derVT = y(6);
VIN1 = y(7);
V1 = y(8);
V1a = y(9);
V2 = y(10);
V3 = y(11);
V4 = y(12);
VSS = y(13);
ev_VCL = y(14);
ev_VCU = y(15);
dV2dot = y(16);
dV3dot = y(17);
ev_VSS_max = y(18);
ev_VSS_min = y(19);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(0.0001) > 0) 
res(1) = 100000000*VT - 10000*dVT;
else
res(1) = 0;
end
res(2) = -(x2 - VIN1 + A3*x1)/A4;
res(3) = x1;
res(4) = -(x4 - V1a + A1*x3)/A2;
res(5) = x3;
res(6) = dV2dot;
res(7) = dV3dot;
if (abs(T6) > 0) 
res(8) = -(T6*dV4 - KS*T5*V3)/T6^2;
else
res(8) = 0;
end
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(0.0001) > 0) 
res = [res;[1 1 (-10000)]];
else
end
res = [res;[2 2 (-A3/A4)]];
res = [res;[2 3 (-1/A4)]];
res = [res;[3 2 (1)]];
res = [res;[4 4 (-A1/A2)]];
res = [res;[4 5 (-1/A2)]];
res = [res;[5 4 (1)]];
if (abs(T6) > 0) 
res = [res;[8 8 (-1/T6)]];
else
end
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(0.0001) > 0) 
res = [res;[1 3 (100000000)]];
else
end
res = [res;[2 7 (1/A4)]];
res = [res;[4 9 (1/A2)]];
res = [res;[6 16 (1)]];
res = [res;[7 17 (1)]];
if (abs(T6) > 0) 
res = [res;[8 11 ((KS*T5)/T6^2)]];
else
end
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
%--------------------
if (abs(0.0001) > 0) 
res(1) = dVT - 10000*VT + derVT;
else
res(1) = derVT - 10000*VT;
end
%--------------------
res(2) = V1a - x2;
%--------------------
res(3) = V1 + x4*(A6/A2 - 1) - x3*(A5 - (A1*A6)/A2) - (A6*V1a)/A2;
if (abs(T2) > 0) 
if (abs(T1) > 0) 
res(4) = dV2dot - (V2 - dV2)/T1;
else
res(4) = dV2dot - (V1 - dV2)/T2;
end
if (abs(T1) > 0) 
res(5) = V2 - (T1*(V1 + dV2*(T2/T1 - 1)))/T2;
else
res(5) = V2 - dV2;
end
else
%--------------------
res(4) = dV2dot;
res(5) = V2 - V1;
end
if (abs(T4) > 0) 
if (abs(T3) > 0) 
res(6) = dV3dot - (V3 - dV3)/T3;
else
res(6) = dV3dot - (V2 - dV3)/T4;
end
if (abs(T3) > 0) 
res(7) = V3 - (T3*(V2 + dV3*(T4/T3 - 1)))/T4;
else
res(7) = V3 - dV3;
end
else
%--------------------
res(6) = dV3dot;
res(7) = V3 - V2;
end
%--------------------
if (abs(T6) > 0) 
res(8) = V4 + dV4 - (KS*T5*V3)/T6;
else
res(8) = V4 - (KS*T5*V3)/T6;
end
%-----------------------
if (abs(SWS1-1.0*(0))<1e-9) 
res(9) = VIN1 - W;
else
if (abs(SWS1-1.0*(1))<1e-9) 
res(9) = VIN1 - W + 1;
else
if (abs(SWS1-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
res(9) = VIN1 - W;
else
if (abs(SWS1-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
res(9) = VIN1 - W + 1;
else
if (abs(SWS1-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
res(9) = VIN1 - P;
else
if (abs(SWS1-1.0*(5))<1e-9) 
%-- in CIM the Generator Accelereting Power is selected, we are using the Active Power (P) instead of it
res(9) = VIN1 - P;
else
if (abs(SWS1-1.0*(6))<1e-9) 
res(9) = VIN1 - VT;
else
if (abs(SWS1-1.0*(7))<1e-9) 
res(9) = VIN1 - derVT;
else
if (abs(SWS1-1.0*(9))<1e-9) 
res(9) = VIN1 - IFD;
end
end
end
end
end
end
end
end
end
%------------------
if (t < 0 ) 
res(10) = VSS - V4;
else
%--------------------
if (ev(3) > 0 ) 
res(10) = VSS - LSMAX;
else
if (ev(4) < 0 ) 
res(10) = VSS - LSMIN;
else
res(10) = VSS - V4;
end
end
end
%-----------------------
if (t < 0) 
res(11) = VPSS - VSS;
else
if (( abs(VCL-1.0*(0))<1e-9 & abs(VCU-1.0*(0))<1e-9 )) 
res(11) = VPSS - VSS;
else
if (( ev(2) < 0 & ev_VCL > 0 )) 
res(11) = VPSS - VSS;
else
res(11) = VPSS;
end
end
end

res(12) = VCL - VT + ev_VCL;
res(13) = VCU - VT + ev_VCU;


%--------------------------------------------------------------------------
res(14) = LSMAX - V4 + ev_VSS_max;
res(15) = LSMIN - V4 + ev_VSS_min;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(0.0001) > 0) 
res = [res;[1 1 (1)]];
else
end
%--------------------
res = [res;[2 3 (-1)]];
%--------------------
res = [res;[3 4 ((A1*A6)/A2 - A5)]];
res = [res;[3 5 (A6/A2 - 1)]];
if (abs(T2) > 0) 
if (abs(T1) > 0) 
res = [res;[4 6 (1/T1)]];
else
res = [res;[4 6 (1/T2)]];
end
if (abs(T1) > 0) 
res = [res;[5 6 ((T1 - T2)/T2)]];
else
res = [res;[5 6 (-1)]];
end
else
%--------------------
end
if (abs(T4) > 0) 
if (abs(T3) > 0) 
res = [res;[6 7 (1/T3)]];
else
res = [res;[6 7 (1/T4)]];
end
if (abs(T3) > 0) 
res = [res;[7 7 ((T3 - T4)/T4)]];
else
res = [res;[7 7 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(T6) > 0) 
res = [res;[8 8 (1)]];
else
end
%-----------------------
if (abs(SWS1-1.0*(0))<1e-9) 
else
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
%-- in CIM the Generator Accelereting Power is selected, we are using the Active Power (P) instead of it
else
if (abs(SWS1-1.0*(6))<1e-9) 
else
if (abs(SWS1-1.0*(7))<1e-9) 
else
if (abs(SWS1-1.0*(9))<1e-9) 
end
end
end
end
end
end
end
end
end
%------------------
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
if (t < 0) 
else
if (( abs(VCL-1.0*(0))<1e-9 & abs(VCU-1.0*(0))<1e-9 )) 
else
if (( ev(2) < 0 & ev_VCL > 0 )) 
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
if (abs(0.0001) > 0) 
res = [res;[1 3 (-10000)]];
res = [res;[1 6 (1)]];
else
res = [res;[1 3 (-10000)]];
res = [res;[1 6 (1)]];
end
%--------------------
res = [res;[2 9 (1)]];
%--------------------
res = [res;[3 8 (1)]];
res = [res;[3 9 (-A6/A2)]];
if (abs(T2) > 0) 
if (abs(T1) > 0) 
res = [res;[4 10 (-1/T1)]];
res = [res;[4 16 (1)]];
else
res = [res;[4 8 (-1/T2)]];
res = [res;[4 16 (1)]];
end
if (abs(T1) > 0) 
res = [res;[5 8 (-T1/T2)]];
res = [res;[5 10 (1)]];
else
res = [res;[5 10 (1)]];
end
else
%--------------------
res = [res;[4 16 (1)]];
res = [res;[5 8 (-1)]];
res = [res;[5 10 (1)]];
end
if (abs(T4) > 0) 
if (abs(T3) > 0) 
res = [res;[6 11 (-1/T3)]];
res = [res;[6 17 (1)]];
else
res = [res;[6 10 (-1/T4)]];
res = [res;[6 17 (1)]];
end
if (abs(T3) > 0) 
res = [res;[7 10 (-T3/T4)]];
res = [res;[7 11 (1)]];
else
res = [res;[7 11 (1)]];
end
else
%--------------------
res = [res;[6 17 (1)]];
res = [res;[7 10 (-1)]];
res = [res;[7 11 (1)]];
end
%--------------------
if (abs(T6) > 0) 
res = [res;[8 11 (-(KS*T5)/T6)]];
res = [res;[8 12 (1)]];
else
res = [res;[8 11 (-(KS*T5)/T6)]];
res = [res;[8 12 (1)]];
end
%-----------------------
if (abs(SWS1-1.0*(0))<1e-9) 
res = [res;[9 1 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(1))<1e-9) 
res = [res;[9 1 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(2))<1e-9) 
%-- in CIM the busFrequency is selected, we are using the rotor speed (W) instead of it
res = [res;[9 1 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(3))<1e-9) 
%-- in CIM the busFrequency Deviation is selected, we are using the rotor speed deviation (W-1) instead of it
res = [res;[9 1 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(4))<1e-9) 
%-- Active Power (P), i.e. Generator Electrical Power
res = [res;[9 2 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(5))<1e-9) 
%-- in CIM the Generator Accelereting Power is selected, we are using the Active Power (P) instead of it
res = [res;[9 2 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(6))<1e-9) 
res = [res;[9 3 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(7))<1e-9) 
res = [res;[9 6 (-1)]];
res = [res;[9 7 (1)]];
else
if (abs(SWS1-1.0*(9))<1e-9) 
res = [res;[9 4 (-1)]];
res = [res;[9 7 (1)]];
end
end
end
end
end
end
end
end
end
%------------------
if (t < 0 ) 
res = [res;[10 12 (-1)]];
res = [res;[10 13 (1)]];
else
%--------------------
if (ev(3) > 0 ) 
res = [res;[10 13 (1)]];
else
if (ev(4) < 0 ) 
res = [res;[10 13 (1)]];
else
res = [res;[10 12 (-1)]];
res = [res;[10 13 (1)]];
end
end
end
%-----------------------
if (t < 0) 
res = [res;[11 5 (1)]];
res = [res;[11 13 (-1)]];
else
if (( abs(VCL-1.0*(0))<1e-9 & abs(VCU-1.0*(0))<1e-9 )) 
res = [res;[11 5 (1)]];
res = [res;[11 13 (-1)]];
else
if (( ev(2) < 0 & ev_VCL > 0 )) 
res = [res;[11 5 (1)]];
res = [res;[11 13 (-1)]];
else
res = [res;[11 5 (1)]];
end
end
end

res = [res;[12 3 (-1)]];
res = [res;[12 14 (1)]];
res = [res;[13 3 (-1)]];
res = [res;[13 15 (1)]];


%--------------------------------------------------------------------------
res = [res;[14 12 (-1)]];
res = [res;[14 18 (1)]];
res = [res;[15 12 (-1)]];
res = [res;[15 19 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:8];[1:8];ones(1,8)]';
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
if  (V4 > LSMAX  && ((LSMAX)-(LSMIN)) > 0)
res = 0;
return;
end
if  (V4 < LSMIN  && ((LSMAX)-(LSMIN)) > 0)
res = 0;
return;
end
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
