%----- Equations f 

function res = MDL_CTRL_avr_ieeet1(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_avr_ieeet1');
disp('dynamic_states:  dV1 dVR ddEFD dVF');
disp('inputs:  VC VPSS VUEL VOEL VREF');
disp('external_states:  EFD');
disp('internal_states:  VS V1 V2 VR V3 dEFD VF VX V4 V1dot VRdot VR_ULS VR_LLS dEFDdot');
disp('events:  ev_VR_max ev_VR_min ev_VX_1 ev_VX_2');
disp('parameters:  TR KA TA VRMIN VRMAX KE TE KF TF E1 SE1 E2 SE2 VSTEP HASVUEL HASVOEL VX_A1 VX_B1');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 4');
disp('Number of y = 24');
disp('Number of f = 4');
disp('Number of g = 19');
disp('Number of p = 18');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_avr_ieeet1([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [4 19 0 [20 21 23 24 ]];
return;
elseif flag == 101
res=[4 24 18 4 19];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dV1';...
'dVR';...
'ddEFD';...
'dVF';...
};
algstates = { ... ;
'VC';...
'VPSS';...
'VUEL';...
'VOEL';...
'VREF';...
'EFD';...
'VS';...
'V1';...
'V2';...
'VR';...
'V3';...
'dEFD';...
'VF';...
'VX';...
'V4';...
'V1dot';...
'VRdot';...
'VR_ULS';...
'VR_LLS';...
'ev_VR_max';...
'ev_VR_min';...
'dEFDdot';...
'ev_VX_1';...
'ev_VX_2';...
};
parameters = { ... ;
'TR';...
'KA';...
'TA';...
'VRMIN';...
'VRMAX';...
'KE';...
'TE';...
'KF';...
'TF';...
'E1';...
'SE1';...
'E2';...
'SE2';...
'VSTEP';...
'HASVUEL';...
'HASVOEL';...
'VX_A1';...
'VX_B1';...
};
externalstates = { ... ;
'EFD';...
};
internalstates = { ... ;
'VS';...
'V1';...
'V2';...
'VR';...
'V3';...
'dEFD';...
'VF';...
'VX';...
'V4';...
'V1dot';...
'VRdot';...
'VR_ULS';...
'VR_LLS';...
'dEFDdot';...
};
events = { ... ;
'ev_VR_max';...
'ev_VR_min';...
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
res.x0=zeros(1,4);
res.y0=zeros(1,24);
res.p0=zeros(1,18);
res.x0(1) = 1; % dV1 
res.x0(2) = 0; % dVR 
res.x0(3) = 1; % ddEFD 
res.x0(4) = 0; % dVF 
res.y0(1) = 1; % VC 
res.y0(2) = 0; % VPSS 
res.y0(3) = -999; % VUEL 
res.y0(4) = 999; % VOEL 
res.y0(5) = 1; % VREF 
res.y0(6) = 1; % EFD 
res.y0(7) = 0; % VS 
res.y0(8) = 1; % V1 
res.y0(9) = 1; % V2 
res.y0(10) = 0; % VR 
res.y0(11) = 1; % V3 
res.y0(12) = 1; % dEFD 
res.y0(13) = 0; % VF 
res.y0(14) = 0; % VX 
res.y0(15) = 0; % V4 
res.y0(18) = 1; % VR_ULS 
res.y0(19) = 1; % VR_LLS 
res.p0(1) = 1.000000e-03; % TR 
res.p0(2) = 400; % KA 
res.p0(3) = 4.000000e-01; % TA 
res.p0(4) = -10; % VRMIN 
res.p0(5) = 10; % VRMAX 
res.p0(6) = 1; % KE 
res.p0(7) = 2.000000e-01; % TE 
res.p0(8) = 1; % KF 
res.p0(9) = 2; % TF 
res.p0(10) = 3.135000e+00; % E1 
res.p0(11) = 3.000000e-02; % SE1 
res.p0(12) = 4.180000e+00; % E2 
res.p0(13) = 1.000000e-01; % SE2 
res.p0(14) = 0; % VSTEP 
res.p0(15) = 0; % HASVUEL 
res.p0(16) = 0; % HASVOEL 
return;
elseif flag == 110
	res = [1  1  0  0];
return;
elseif flag == 111
	res = [0  0  0  0];
return;
elseif flag == 106
TR = param(1);
KA = param(2);
TA = param(3);
VRMIN = param(4);
VRMAX = param(5);
KE = param(6);
TE = param(7);
KF = param(8);
TF = param(9);
E1 = param(10);
SE1 = param(11);
E2 = param(12);
SE2 = param(13);
VSTEP = param(14);
HASVUEL = param(15);
HASVOEL = param(16);
VX_A1 = param(17);
VX_B1 = param(18);
if ( TF == 0 )
return;
end
if ( TE == 0 )
return;
end
if ( KE == 0 )
return;
end
if  TR == 0 
return;
end
if  TA == 0 
return;
end
if  (TE/KE) == 0 
return;
end
if  TF == 0 
return;
end
end
%------- map parameters -------------------
TR = param(1);
KA = param(2);
TA = param(3);
VRMIN = param(4);
VRMAX = param(5);
KE = param(6);
TE = param(7);
KF = param(8);
TF = param(9);
E1 = param(10);
SE1 = param(11);
E2 = param(12);
SE2 = param(13);
VSTEP = param(14);
HASVUEL = param(15);
HASVOEL = param(16);
VX_A1 = param(17);
VX_B1 = param(18);
%------- map x -------------------
dV1 = x(1);
dVR = x(2);
ddEFD = x(3);
dVF = x(4);
%------- map y -------------------
VC = y(1);
VPSS = y(2);
VUEL = y(3);
VOEL = y(4);
VREF = y(5);
EFD = y(6);
VS = y(7);
V1 = y(8);
V2 = y(9);
VR = y(10);
V3 = y(11);
dEFD = y(12);
VF = y(13);
VX = y(14);
V4 = y(15);
V1dot = y(16);
VRdot = y(17);
VR_ULS = y(18);
VR_LLS = y(19);
ev_VR_max = y(20);
ev_VR_min = y(21);
dEFDdot = y(22);
ev_VX_1 = y(23);
ev_VX_2 = y(24);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res(1) = V1dot;
res(2) = VR_LLS*VR_ULS*VRdot;
res(3) = dEFDdot;
if (abs(TF) > 0) 
res(4) = -(TF*dVF - EFD*KF)/TF^2;
else
res(4) = 0;
end
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TF) > 0) 
res = [res;[4 4 (-1/TF)]];
else
end
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res = [res;[1 16 (1)]];
res = [res;[2 17 (VR_LLS*VR_ULS)]];
res = [res;[2 18 (VR_LLS*VRdot)]];
res = [res;[2 19 (VR_ULS*VRdot)]];
res = [res;[3 22 (1)]];
if (abs(TF) > 0) 
res = [res;[4 6 (KF/TF^2)]];
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
%--------------------
if (abs(TA) > 0) 
res(3) = VRdot + (dVR - KA*V2)/TA;
res(4) = VR + VRMIN*(VR_LLS - 1) + VRMAX*(VR_ULS - 1) - VR_LLS*VR_ULS*dVR;
else
%--------------------
if (t < 0 ) 
res(3) = VRdot;
res(4) = VR - KA*V2;
else
if (ev(1) > 0 ) 
res(3) = VRdot;
res(4) = VR - VRMAX;
else
if (ev(2) < 0 ) 
res(3) = VRdot;
res(4) = VR - VRMIN;
else
res(3) = VRdot;
res(4) = VR - KA*V2;
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VR_max <= 0 )) 
res(5) = VR_ULS - 1;
else
res(5) = VR_ULS;
end
else
res(5) = VR_ULS;
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VR_min >= 0)) 
res(6) = VR_LLS - 1;
else
res(6) = VR_LLS;
end
else
res(6) = VR_LLS;
end
%--------------------
if (abs((TE/KE)) > 0) 
res(7) = (KE*ddEFD - V3 + TE*dEFDdot)/TE;
res(8) = dEFD - ddEFD;
else
res(7) = dEFDdot;
res(8) = dEFD - V3/KE;
end
%--------------------
if (abs(TF) > 0) 
res(9) = VF + dVF - (EFD*KF)/TF;
else
res(9) = VF - (EFD*KF)/TF;
end
%-----------------------
res(10) = VS - VPSS - VOEL - VUEL;
%-----------------------
res(11) = V1 + V2 + VF - VREF - VS - VSTEP;
%-----------------------
res(12) = V3 + V4 - VR;
%-----------------------
res(13) = EFD - dEFD;
%-----------------------
%--------------------
if (ev(3) < 0 ) 
res(14) = VX + VX_A1*(EFD + VX_B1)^2;
else
if (ev(4) > 0 ) 
res(14) = VX - VX_A1*(EFD - VX_B1)^2;
else
res(14) = VX;
end
end
%-----------------------
res(15) = V4 - EFD*VX;
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
res(16) = ev_VR_max - VR_ULS*(VR - VRMAX) + VRdot*(VR_ULS - 1);
res(17) = ev_VR_min - VR_LLS*(VR - VRMIN) + VRdot*(VR_LLS - 1);
else
res(16) = VRMAX + ev_VR_max - KA*V2;
res(17) = VRMIN + ev_VR_min - KA*V2;
end
res(18) = ev_VX_1 - VX_B1 - EFD;
res(19) = VX_B1 - EFD + ev_VX_2;
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
%--------------------
if (abs(TA) > 0) 
res = [res;[3 2 (1/TA)]];
res = [res;[4 2 (-VR_LLS*VR_ULS)]];
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
if ((t < 0 || ev_VR_max <= 0 )) 
else
end
else
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VR_min >= 0)) 
else
end
else
end
%--------------------
if (abs((TE/KE)) > 0) 
res = [res;[7 3 (KE/TE)]];
res = [res;[8 3 (-1)]];
else
end
%--------------------
if (abs(TF) > 0) 
res = [res;[9 4 (1)]];
else
end
%-----------------------
%-----------------------
%-----------------------
%-----------------------
%-----------------------
%--------------------
if (ev(3) < 0 ) 
else
if (ev(4) > 0 ) 
else
end
end
%-----------------------
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
res = [res;[1 1 (-1/TR)]];
res = [res;[1 16 (1)]];
res = [res;[2 8 (1)]];
else
res = [res;[1 16 (1)]];
res = [res;[2 1 (-1)]];
res = [res;[2 8 (1)]];
end
%--------------------
if (abs(TA) > 0) 
res = [res;[3 9 (-KA/TA)]];
res = [res;[3 17 (1)]];
res = [res;[4 10 (1)]];
res = [res;[4 18 (VRMAX - VR_LLS*dVR)]];
res = [res;[4 19 (VRMIN - VR_ULS*dVR)]];
else
%--------------------
if (t < 0 ) 
res = [res;[3 17 (1)]];
res = [res;[4 9 (-KA)]];
res = [res;[4 10 (1)]];
else
if (ev(1) > 0 ) 
res = [res;[3 17 (1)]];
res = [res;[4 10 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[3 17 (1)]];
res = [res;[4 10 (1)]];
else
res = [res;[3 17 (1)]];
res = [res;[4 9 (-KA)]];
res = [res;[4 10 (1)]];
end
end
end
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VR_max <= 0 )) 
res = [res;[5 18 (1)]];
else
res = [res;[5 18 (1)]];
end
else
res = [res;[5 18 (1)]];
end
if (abs(TA) > 0) 
if ((t < 0 || ev_VR_min >= 0)) 
res = [res;[6 19 (1)]];
else
res = [res;[6 19 (1)]];
end
else
res = [res;[6 19 (1)]];
end
%--------------------
if (abs((TE/KE)) > 0) 
res = [res;[7 11 (-1/TE)]];
res = [res;[7 22 (1)]];
res = [res;[8 12 (1)]];
else
res = [res;[7 22 (1)]];
res = [res;[8 11 (-1/KE)]];
res = [res;[8 12 (1)]];
end
%--------------------
if (abs(TF) > 0) 
res = [res;[9 6 (-KF/TF)]];
res = [res;[9 13 (1)]];
else
res = [res;[9 6 (-KF/TF)]];
res = [res;[9 13 (1)]];
end
%-----------------------
res = [res;[10 2 (-1)]];
res = [res;[10 3 (-1)]];
res = [res;[10 4 (-1)]];
res = [res;[10 7 (1)]];
%-----------------------
res = [res;[11 5 (-1)]];
res = [res;[11 7 (-1)]];
res = [res;[11 8 (1)]];
res = [res;[11 9 (1)]];
res = [res;[11 13 (1)]];
%-----------------------
res = [res;[12 10 (-1)]];
res = [res;[12 11 (1)]];
res = [res;[12 15 (1)]];
%-----------------------
res = [res;[13 6 (1)]];
res = [res;[13 12 (-1)]];
%-----------------------
%--------------------
if (ev(3) < 0 ) 
res = [res;[14 6 (VX_A1*(2*EFD + 2*VX_B1))]];
res = [res;[14 14 (1)]];
else
if (ev(4) > 0 ) 
res = [res;[14 6 (-2*VX_A1*(EFD - VX_B1))]];
res = [res;[14 14 (1)]];
else
res = [res;[14 14 (1)]];
end
end
%-----------------------
res = [res;[15 6 (-VX)]];
res = [res;[15 14 (-EFD)]];
res = [res;[15 15 (1)]];
%--------------------------------------------------------------------------
if (abs(TA) > 0) 
res = [res;[16 10 (-VR_ULS)]];
res = [res;[16 17 (VR_ULS - 1)]];
res = [res;[16 18 (VRMAX - VR + VRdot)]];
res = [res;[16 20 (1)]];
res = [res;[17 10 (-VR_LLS)]];
res = [res;[17 17 (VR_LLS - 1)]];
res = [res;[17 19 (VRMIN - VR + VRdot)]];
res = [res;[17 21 (1)]];
else
res = [res;[16 9 (-KA)]];
res = [res;[16 20 (1)]];
res = [res;[17 9 (-KA)]];
res = [res;[17 21 (1)]];
end
res = [res;[18 6 (-1)]];
res = [res;[18 23 (1)]];
res = [res;[19 6 (-1)]];
res = [res;[19 24 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if (abs(TA) > 0)
if (ev==1)
res(2) = VR;
end
end
if (abs(TA) > 0)
if (ev==2)
res(2) = VR;
end
end
elseif flag == 8
%----- hx 
res = [[1:4];[1:4];ones(1,4)]';
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
res = [res;[2 10 (1)]];
end
end
if (abs(TA) > 0)
if (ev==2)
res = [res;[2 10 (1)]];
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
if  dVR > VRMAX 
res = 0;
return;
end
if  VR > VRMAX 
res = 0;
return;
end
return;
end
if abs(TA) > 0
res = 0;
if  dVR < VRMIN 
res = 0;
return;
end
if  VR < VRMIN 
res = 0;
return;
end
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
