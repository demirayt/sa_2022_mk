%----- Equations f 

function res = MDL_CTRL_avr_sexs(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_avr_sexs');
disp('dynamic_states:  dV2 dV3');
disp('inputs:  VT VPSS VUEL VOEL VREF');
disp('external_states:  EFD');
disp('internal_states:  VS V1 V2 dV2dot EFDdot EFD_ULS EFD_LLS');
disp('events:  ev_EFD_max ev_EFD_min');
disp('parameters:  TATB TB K TE EMIN EMAX VSTEP');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 2');
disp('Number of y = 15');
disp('Number of f = 2');
disp('Number of g = 10');
disp('Number of p = 7');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_avr_sexs([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [2 10 0 [14 15 ]];
return;
elseif flag == 101
res=[2 15 7 2 10];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dV2';...
'dV3';...
};
algstates = { ... ;
'VT';...
'VPSS';...
'VUEL';...
'VOEL';...
'VREF';...
'EFD';...
'VS';...
'V1';...
'V2';...
'dV2dot';...
'EFDdot';...
'EFD_ULS';...
'EFD_LLS';...
'ev_EFD_max';...
'ev_EFD_min';...
};
parameters = { ... ;
'TATB';...
'TB';...
'K';...
'TE';...
'EMIN';...
'EMAX';...
'VSTEP';...
};
externalstates = { ... ;
'EFD';...
};
internalstates = { ... ;
'VS';...
'V1';...
'V2';...
'dV2dot';...
'EFDdot';...
'EFD_ULS';...
'EFD_LLS';...
};
events = { ... ;
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
res.x0=zeros(1,2);
res.y0=zeros(1,15);
res.p0=zeros(1,7);
res.x0(1) = 0; % dV2 
res.x0(2) = 0; % dV3 
res.y0(1) = 1; % VT 
res.y0(2) = 0; % VPSS 
res.y0(3) = -999; % VUEL 
res.y0(4) = 999; % VOEL 
res.y0(5) = 1; % VREF 
res.y0(6) = 1; % EFD 
res.y0(7) = 0; % VS 
res.y0(8) = 1; % V1 
res.y0(9) = 1; % V2 
res.y0(12) = 1; % EFD_ULS 
res.y0(13) = 1; % EFD_LLS 
res.p0(1) = 3.000000e-01; % TATB 
res.p0(2) = 10; % TB 
res.p0(3) = 200; % K 
res.p0(4) = 5.000000e-02; % TE 
res.p0(5) = 0; % EMIN 
res.p0(6) = 4; % EMAX 
res.p0(7) = 0; % VSTEP 
return;
elseif flag == 110
	res = [1  1];
return;
elseif flag == 111
	res = [0  0];
return;
elseif flag == 106
TATB = param(1);
TB = param(2);
K = param(3);
TE = param(4);
EMIN = param(5);
EMAX = param(6);
VSTEP = param(7);
if  (TATB*TB) == 0 
return;
end
if  TB == 0 
return;
end
if  TE == 0 
return;
end
end
%------- map parameters -------------------
TATB = param(1);
TB = param(2);
K = param(3);
TE = param(4);
EMIN = param(5);
EMAX = param(6);
VSTEP = param(7);
%------- map x -------------------
dV2 = x(1);
dV3 = x(2);
%------- map y -------------------
VT = y(1);
VPSS = y(2);
VUEL = y(3);
VOEL = y(4);
VREF = y(5);
EFD = y(6);
VS = y(7);
V1 = y(8);
V2 = y(9);
dV2dot = y(10);
EFDdot = y(11);
EFD_ULS = y(12);
EFD_LLS = y(13);
ev_EFD_max = y(14);
ev_EFD_min = y(15);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res(1) = dV2dot;
res(2) = EFDdot*EFD_LLS*EFD_ULS;
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res = [res;[1 10 (1)]];
res = [res;[2 11 (EFD_LLS*EFD_ULS)]];
res = [res;[2 12 (EFDdot*EFD_LLS)]];
res = [res;[2 13 (EFDdot*EFD_ULS)]];
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = VS - VPSS - VOEL - VUEL;
res(2) = V1 - VREF - VS - VSTEP + VT;
if (abs(TB) > 0) 
if (abs((TATB*TB)) > 0) 
res(3) = dV2dot - (V2 - dV2)/(TATB*TB);
else
res(3) = dV2dot - (V1 - dV2)/TB;
end
if (abs((TATB*TB)) > 0) 
res(4) = V2 - TATB*(V1 + dV2*(1/TATB - 1));
else
res(4) = V2 - dV2;
end
else
%--------------------
res(3) = dV2dot;
res(4) = V2 - V1;
end
%--------------------
if (abs(TE) > 0) 
res(5) = EFDdot + (dV3 - K*V2)/TE;
res(6) = EFD + EMAX*(EFD_ULS - 1) + EMIN*(EFD_LLS - 1) - EFD_LLS*EFD_ULS*dV3;
else
%--------------------
if (t < 0 ) 
res(5) = EFDdot;
res(6) = EFD - K*V2;
else
if (ev(1) > 0 ) 
res(5) = EFDdot;
res(6) = EFD - EMAX;
else
if (ev(2) < 0 ) 
res(5) = EFDdot;
res(6) = EFD - EMIN;
else
res(5) = EFDdot;
res(6) = EFD - K*V2;
end
end
end
end
if (abs(TE) > 0) 
if ((t < 0 || ev_EFD_max <= 0 )) 
res(7) = EFD_ULS - 1;
else
res(7) = EFD_ULS;
end
else
res(7) = EFD_ULS;
end
if (abs(TE) > 0) 
if ((t < 0 || ev_EFD_min >= 0)) 
res(8) = EFD_LLS - 1;
else
res(8) = EFD_LLS;
end
else
res(8) = EFD_LLS;
end


if (abs(TE) > 0) 
res(9) = ev_EFD_max + EFDdot*(EFD_ULS - 1) - EFD_ULS*(EFD - EMAX);
res(10) = ev_EFD_min + EFDdot*(EFD_LLS - 1) - EFD_LLS*(EFD - EMIN);
else
res(9) = EMAX + ev_EFD_max - K*V2;
res(10) = EMIN + ev_EFD_min - K*V2;
end
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
if (abs(TB) > 0) 
if (abs((TATB*TB)) > 0) 
res = [res;[3 1 (1/(TATB*TB))]];
else
res = [res;[3 1 (1/TB)]];
end
if (abs((TATB*TB)) > 0) 
res = [res;[4 1 (TATB - 1)]];
else
res = [res;[4 1 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(TE) > 0) 
res = [res;[5 2 (1/TE)]];
res = [res;[6 2 (-EFD_LLS*EFD_ULS)]];
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
if (abs(TE) > 0) 
if ((t < 0 || ev_EFD_max <= 0 )) 
else
end
else
end
if (abs(TE) > 0) 
if ((t < 0 || ev_EFD_min >= 0)) 
else
end
else
end


if (abs(TE) > 0) 
else
end
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 2 (-1)]];
res = [res;[1 3 (-1)]];
res = [res;[1 4 (-1)]];
res = [res;[1 7 (1)]];
res = [res;[2 1 (1)]];
res = [res;[2 5 (-1)]];
res = [res;[2 7 (-1)]];
res = [res;[2 8 (1)]];
if (abs(TB) > 0) 
if (abs((TATB*TB)) > 0) 
res = [res;[3 9 (-1/(TATB*TB))]];
res = [res;[3 10 (1)]];
else
res = [res;[3 8 (-1/TB)]];
res = [res;[3 10 (1)]];
end
if (abs((TATB*TB)) > 0) 
res = [res;[4 8 (-TATB)]];
res = [res;[4 9 (1)]];
else
res = [res;[4 9 (1)]];
end
else
%--------------------
res = [res;[3 10 (1)]];
res = [res;[4 8 (-1)]];
res = [res;[4 9 (1)]];
end
%--------------------
if (abs(TE) > 0) 
res = [res;[5 9 (-K/TE)]];
res = [res;[5 11 (1)]];
res = [res;[6 6 (1)]];
res = [res;[6 12 (EMAX - EFD_LLS*dV3)]];
res = [res;[6 13 (EMIN - EFD_ULS*dV3)]];
else
%--------------------
if (t < 0 ) 
res = [res;[5 11 (1)]];
res = [res;[6 6 (1)]];
res = [res;[6 9 (-K)]];
else
if (ev(1) > 0 ) 
res = [res;[5 11 (1)]];
res = [res;[6 6 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[5 11 (1)]];
res = [res;[6 6 (1)]];
else
res = [res;[5 11 (1)]];
res = [res;[6 6 (1)]];
res = [res;[6 9 (-K)]];
end
end
end
end
if (abs(TE) > 0) 
if ((t < 0 || ev_EFD_max <= 0 )) 
res = [res;[7 12 (1)]];
else
res = [res;[7 12 (1)]];
end
else
res = [res;[7 12 (1)]];
end
if (abs(TE) > 0) 
if ((t < 0 || ev_EFD_min >= 0)) 
res = [res;[8 13 (1)]];
else
res = [res;[8 13 (1)]];
end
else
res = [res;[8 13 (1)]];
end


if (abs(TE) > 0) 
res = [res;[9 6 (-EFD_ULS)]];
res = [res;[9 11 (EFD_ULS - 1)]];
res = [res;[9 12 (EFDdot - EFD + EMAX)]];
res = [res;[9 14 (1)]];
res = [res;[10 6 (-EFD_LLS)]];
res = [res;[10 11 (EFD_LLS - 1)]];
res = [res;[10 13 (EFDdot - EFD + EMIN)]];
res = [res;[10 15 (1)]];
else
res = [res;[9 9 (-K)]];
res = [res;[9 14 (1)]];
res = [res;[10 9 (-K)]];
res = [res;[10 15 (1)]];
end
elseif flag == 7
%----- h 
res = x;
if (abs(TE) > 0)
if (ev==1)
res(2) = EFD;
end
end
if (abs(TE) > 0)
if (ev==2)
res(2) = EFD;
end
end
elseif flag == 8
%----- hx 
res = [[1:2];[1:2];ones(1,2)]';
if (abs(TE) > 0)
if (ev==1)
end
end
if (abs(TE) > 0)
if (ev==2)
end
end
elseif flag == 9
%----- hy 
res = empty3;
if (abs(TE) > 0)
if (ev==1)
res = [res;[2 6 (1)]];
end
end
if (abs(TE) > 0)
if (ev==2)
res = [res;[2 6 (1)]];
end
end
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
if abs(TE) > 0
res = 0;
if  dV3 > EMAX 
res = 0;
return;
end
if  EFD > EMAX 
res = 0;
return;
end
return;
end
if abs(TE) > 0
res = 0;
if  dV3 < EMIN 
res = 0;
return;
end
if  EFD < EMIN 
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
end
