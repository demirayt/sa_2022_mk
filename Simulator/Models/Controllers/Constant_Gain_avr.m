%----- Equations f 

function res = Constant_Gain_avr(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: Constant_Gain_avr');
disp('dynamic_states:  x1');
disp('inputs:  VT VREF VPSS');
disp('external_states:  EFD');
disp('internal_states:  VF V1');
disp('events:  ev_min ev_max');
disp('parameters:  TR KA EFDMIN EFDMAX');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 1');
disp('Number of y = 8');
disp('Number of f = 1');
disp('Number of g = 5');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = Constant_Gain_avr([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [1 5 0 [7 8 ]];
return;
elseif flag == 101
res=[1 8 4 1 5];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'x1';...
};
algstates = { ... ;
'VT';...
'VREF';...
'VPSS';...
'EFD';...
'VF';...
'V1';...
'ev_min';...
'ev_max';...
};
parameters = { ... ;
'TR';...
'KA';...
'EFDMIN';...
'EFDMAX';...
};
externalstates = { ... ;
'EFD';...
};
internalstates = { ... ;
'VF';...
'V1';...
};
events = { ... ;
'ev_min';...
'ev_max';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,1);
res.y0=zeros(1,8);
res.p0=zeros(1,4);
res.x0(1) = 1; % x1 
res.y0(1) = 1; % VT 
res.y0(2) = 1; % VREF 
res.y0(3) = 0; % VPSS 
res.y0(4) = 1; % EFD 
res.y0(5) = 0; % VF 
res.y0(6) = 0; % V1 
res.y0(7) = 0; % ev_min 
res.y0(8) = 0; % ev_max 
res.p0(1) = 1.000000e-03; % TR 
res.p0(2) = 400; % KA 
res.p0(3) = -5; % EFDMIN 
res.p0(4) = 5; % EFDMAX 
return;
elseif flag == 110
	res = [1  1];
return;
elseif flag == 111
	res = [0  0];
return;
elseif flag == 106
TR = param(1);
KA = param(2);
EFDMIN = param(3);
EFDMAX = param(4);
if ( TR == 0 )
return;
end
end
%------- map parameters -------------------
TR = param(1);
KA = param(2);
EFDMIN = param(3);
EFDMAX = param(4);
%------- map x -------------------
x1 = x(1);
%------- map y -------------------
VT = y(1);
VREF = y(2);
VPSS = y(3);
EFD = y(4);
VF = y(5);
V1 = y(6);
ev_min = y(7);
ev_max = y(8);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
res(1) = (VT - x1)/TR;
%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-1/TR)]];
%--------------------------------------------------------------------------
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (1/TR)]];
%--------------------------------------------------------------------------
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = V1 - KA*(VPSS - VF + VREF);
res(2) = VF - x1;
%--------------------------------------------------------------------------
res(3) = EFDMIN - V1 + ev_min;
res(4) = EFDMAX - V1 + ev_max;
if (t < 0) 
res(5) = EFD - V1;
else
if (ev(1) < 0) 
res(5) = EFD - EFDMIN;
else
if (ev(2) > 0) 
res(5) = EFD - EFDMAX;
else
res(5) = EFD - V1;
end
end
end
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[2 1 (-1)]];
%--------------------------------------------------------------------------
if (t < 0) 
else
if (ev(1) < 0) 
else
if (ev(2) > 0) 
else
end
end
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 2 (-KA)]];
res = [res;[1 3 (-KA)]];
res = [res;[1 5 (KA)]];
res = [res;[1 6 (1)]];
res = [res;[2 5 (1)]];
%--------------------------------------------------------------------------
res = [res;[3 6 (-1)]];
res = [res;[3 7 (1)]];
res = [res;[4 6 (-1)]];
res = [res;[4 8 (1)]];
if (t < 0) 
res = [res;[5 4 (1)]];
res = [res;[5 6 (-1)]];
else
if (ev(1) < 0) 
res = [res;[5 4 (1)]];
else
if (ev(2) > 0) 
res = [res;[5 4 (1)]];
else
res = [res;[5 4 (1)]];
res = [res;[5 6 (-1)]];
end
end
end
%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:1];[1:1];ones(1,1)]';
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
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%%----- Measurements
elseif flag == 105
if EFD > EFDMAX
res = 0;
return;
end
if EFD < EFDMIN
res = 0;
return;
end
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
