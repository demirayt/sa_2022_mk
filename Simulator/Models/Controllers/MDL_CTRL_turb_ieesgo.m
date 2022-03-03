%----- Equations f 

function res = MDL_CTRL_turb_ieesgo(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_turb_ieesgo');
disp('dynamic_states:  dV2 dV3 dV6 dV7 dV8');
disp('inputs:  W POREF');
disp('external_states:  PMECH');
disp('internal_states:  V1 V2 V3 V4 V5 V6 V7 V8 V2dot dV3dot V6dot V7dot V8dot');
disp('events:  ev_V5_max ev_V5_min');
disp('parameters:  K1 T1 T2 T3 PMIN PMAX T4 K2 T5 K3 T6');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 5');
disp('Number of y = 18');
disp('Number of f = 5');
disp('Number of g = 16');
disp('Number of p = 11');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_turb_ieesgo([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [5 16 0 [17 18 ]];
return;
elseif flag == 101
res=[5 18 11 5 16];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dV2';...
'dV3';...
'dV6';...
'dV7';...
'dV8';...
};
algstates = { ... ;
'W';...
'POREF';...
'PMECH';...
'V1';...
'V2';...
'V3';...
'V4';...
'V5';...
'V6';...
'V7';...
'V8';...
'V2dot';...
'dV3dot';...
'V6dot';...
'V7dot';...
'V8dot';...
'ev_V5_max';...
'ev_V5_min';...
};
parameters = { ... ;
'K1';...
'T1';...
'T2';...
'T3';...
'PMIN';...
'PMAX';...
'T4';...
'K2';...
'T5';...
'K3';...
'T6';...
};
externalstates = { ... ;
'PMECH';...
};
internalstates = { ... ;
'V1';...
'V2';...
'V3';...
'V4';...
'V5';...
'V6';...
'V7';...
'V8';...
'V2dot';...
'dV3dot';...
'V6dot';...
'V7dot';...
'V8dot';...
};
events = { ... ;
'ev_V5_max';...
'ev_V5_min';...
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
res.y0=zeros(1,18);
res.p0=zeros(1,11);
res.x0(1) = 0; % dV2 
res.x0(2) = 0; % dV3 
res.x0(3) = 1; % dV6 
res.x0(4) = 1; % dV7 
res.x0(5) = 1; % dV8 
res.y0(1) = 1; % W 
res.y0(2) = 0; % POREF 
res.y0(3) = 1; % PMECH 
res.y0(4) = 0; % V1 
res.y0(5) = 0; % V2 
res.y0(6) = 0; % V3 
res.y0(7) = 0; % V4 
res.y0(8) = 0; % V5 
res.y0(9) = 1; % V6 
res.y0(10) = 1; % V7 
res.y0(11) = 1; % V8 
res.p0(1) = 1; % K1 
res.p0(2) = 5.000000e-01; % T1 
res.p0(3) = 1; % T2 
res.p0(4) = 5.000000e-01; % T3 
res.p0(5) = -5; % PMIN 
res.p0(6) = 5; % PMAX 
res.p0(7) = 5.000000e-01; % T4 
res.p0(8) = 5.000000e-01; % K2 
res.p0(9) = 5.000000e-01; % T5 
res.p0(10) = 5.000000e-01; % K3 
res.p0(11) = 5.000000e-01; % T6 
return;
elseif flag == 110
	res = [0  0];
return;
elseif flag == 111
	res = [0  0];
return;
elseif flag == 106
K1 = param(1);
T1 = param(2);
T2 = param(3);
T3 = param(4);
PMIN = param(5);
PMAX = param(6);
T4 = param(7);
K2 = param(8);
T5 = param(9);
K3 = param(10);
T6 = param(11);
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
if  T5 == 0 
return;
end
if  T6 == 0 
return;
end
end
%------- map parameters -------------------
K1 = param(1);
T1 = param(2);
T2 = param(3);
T3 = param(4);
PMIN = param(5);
PMAX = param(6);
T4 = param(7);
K2 = param(8);
T5 = param(9);
K3 = param(10);
T6 = param(11);
%------- map x -------------------
dV2 = x(1);
dV3 = x(2);
dV6 = x(3);
dV7 = x(4);
dV8 = x(5);
%------- map y -------------------
W = y(1);
POREF = y(2);
PMECH = y(3);
V1 = y(4);
V2 = y(5);
V3 = y(6);
V4 = y(7);
V5 = y(8);
V6 = y(9);
V7 = y(10);
V8 = y(11);
V2dot = y(12);
dV3dot = y(13);
V6dot = y(14);
V7dot = y(15);
V8dot = y(16);
ev_V5_max = y(17);
ev_V5_min = y(18);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
res(1) = V2dot;
res(2) = dV3dot;
res(3) = V6dot;
res(4) = V7dot;
res(5) = V8dot;
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
res = [res;[1 12 (1)]];
res = [res;[2 13 (1)]];
res = [res;[3 14 (1)]];
res = [res;[4 15 (1)]];
res = [res;[5 16 (1)]];
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
%--------------------
if (abs(T1) > 0) 
res(1) = V2dot + (dV2 - K1*V1)/T1;
res(2) = V2 - dV2;
else
res(1) = V2dot;
res(2) = V2 - K1*V1;
end
if (abs(T3) > 0) 
if (abs(T2) > 0) 
res(3) = dV3dot - (V3 - dV3)/T2;
else
res(3) = dV3dot - (V2 - dV3)/T3;
end
if (abs(T2) > 0) 
res(4) = V3 - (T2*(V2 + dV3*(T3/T2 - 1)))/T3;
else
res(4) = V3 - dV3;
end
else
%--------------------
res(3) = dV3dot;
res(4) = V3 - V2;
end
%--------------------
if (abs(T4) > 0) 
res(5) = V6dot - (V5 - dV6)/T4;
res(6) = V6 - dV6;
else
res(5) = V6dot;
res(6) = V6 - V5;
end
%--------------------
if (abs(T5) > 0) 
res(7) = V7dot + (dV7 - K2*V6)/T5;
res(8) = V7 - dV7;
else
res(7) = V7dot;
res(8) = V7 - K2*V6;
end
%--------------------
if (abs(T6) > 0) 
res(9) = V8dot + (dV8 - K3*V7)/T6;
res(10) = V8 - dV8;
else
res(9) = V8dot;
res(10) = V8 - K3*V7;
end
%-----------------------
res(11) = V1 - W + 1;
%-----------------------
res(12) = V3 - POREF + V4;
%-----------------------
if (t < 0 ) 
res(13) = V5 - V4;
else
%--------------------
if (ev(1) > 0 ) 
res(13) = V5 - PMAX;
else
if (ev(2) < 0 ) 
res(13) = V5 - PMIN;
else
res(13) = V5 - V4;
end
end
end
%-----------------------
res(14) = PMECH - V8 + V6*(K2 - 1) + V7*(K3 - 1);
%--------------------------------------------------------------------------
res(15) = PMAX - V4 + ev_V5_max;
res(16) = PMIN - V4 + ev_V5_min;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(T1) > 0) 
res = [res;[1 1 (1/T1)]];
res = [res;[2 1 (-1)]];
else
end
if (abs(T3) > 0) 
if (abs(T2) > 0) 
res = [res;[3 2 (1/T2)]];
else
res = [res;[3 2 (1/T3)]];
end
if (abs(T2) > 0) 
res = [res;[4 2 ((T2 - T3)/T3)]];
else
res = [res;[4 2 (-1)]];
end
else
%--------------------
end
%--------------------
if (abs(T4) > 0) 
res = [res;[5 3 (1/T4)]];
res = [res;[6 3 (-1)]];
else
end
%--------------------
if (abs(T5) > 0) 
res = [res;[7 4 (1/T5)]];
res = [res;[8 4 (-1)]];
else
end
%--------------------
if (abs(T6) > 0) 
res = [res;[9 5 (1/T6)]];
res = [res;[10 5 (-1)]];
else
end
%-----------------------
%-----------------------
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
%-----------------------
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if (abs(T1) > 0) 
res = [res;[1 4 (-K1/T1)]];
res = [res;[1 12 (1)]];
res = [res;[2 5 (1)]];
else
res = [res;[1 12 (1)]];
res = [res;[2 4 (-K1)]];
res = [res;[2 5 (1)]];
end
if (abs(T3) > 0) 
if (abs(T2) > 0) 
res = [res;[3 6 (-1/T2)]];
res = [res;[3 13 (1)]];
else
res = [res;[3 5 (-1/T3)]];
res = [res;[3 13 (1)]];
end
if (abs(T2) > 0) 
res = [res;[4 5 (-T2/T3)]];
res = [res;[4 6 (1)]];
else
res = [res;[4 6 (1)]];
end
else
%--------------------
res = [res;[3 13 (1)]];
res = [res;[4 5 (-1)]];
res = [res;[4 6 (1)]];
end
%--------------------
if (abs(T4) > 0) 
res = [res;[5 8 (-1/T4)]];
res = [res;[5 14 (1)]];
res = [res;[6 9 (1)]];
else
res = [res;[5 14 (1)]];
res = [res;[6 8 (-1)]];
res = [res;[6 9 (1)]];
end
%--------------------
if (abs(T5) > 0) 
res = [res;[7 9 (-K2/T5)]];
res = [res;[7 15 (1)]];
res = [res;[8 10 (1)]];
else
res = [res;[7 15 (1)]];
res = [res;[8 9 (-K2)]];
res = [res;[8 10 (1)]];
end
%--------------------
if (abs(T6) > 0) 
res = [res;[9 10 (-K3/T6)]];
res = [res;[9 16 (1)]];
res = [res;[10 11 (1)]];
else
res = [res;[9 16 (1)]];
res = [res;[10 10 (-K3)]];
res = [res;[10 11 (1)]];
end
%-----------------------
res = [res;[11 1 (-1)]];
res = [res;[11 4 (1)]];
%-----------------------
res = [res;[12 2 (-1)]];
res = [res;[12 6 (1)]];
res = [res;[12 7 (1)]];
%-----------------------
if (t < 0 ) 
res = [res;[13 7 (-1)]];
res = [res;[13 8 (1)]];
else
%--------------------
if (ev(1) > 0 ) 
res = [res;[13 8 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[13 8 (1)]];
else
res = [res;[13 7 (-1)]];
res = [res;[13 8 (1)]];
end
end
end
%-----------------------
res = [res;[14 3 (1)]];
res = [res;[14 9 (K2 - 1)]];
res = [res;[14 10 (K3 - 1)]];
res = [res;[14 11 (-1)]];
%--------------------------------------------------------------------------
res = [res;[15 7 (-1)]];
res = [res;[15 17 (1)]];
res = [res;[16 7 (-1)]];
res = [res;[16 18 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:5];[1:5];ones(1,5)]';
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
if  (V4 > PMAX  && ((PMAX)-(PMIN)) > 0)
res = 0;
return;
end
if  (V4 < PMIN  && ((PMAX)-(PMIN)) > 0)
res = 0;
return;
end
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
