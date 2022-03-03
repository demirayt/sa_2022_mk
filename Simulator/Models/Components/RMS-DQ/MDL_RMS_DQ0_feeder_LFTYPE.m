%----- Equations f 

function res = MDL_RMS_DQ0_feeder_LFTYPE(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_feeder_LFTYPE');
disp('dynamic_states:  Xp Xq');
disp('inputs:  VD1 VQ1 VT');
disp('external_states:  ID1 IQ1');
disp('internal_states:  P1 Q1');
disp('parameters:  SBASE UBASE P0 Q0 V0 VQ0 nP nQ LFTYPE');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 2');
disp('Number of y = 7');
disp('Number of f = 2');
disp('Number of g = 4');
disp('Number of p = 9');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_feeder_LFTYPE([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [2 4 0 []];
return;
elseif flag == 101
res=[2 7 9 2 4];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'Xp';...
'Xq';...
};
algstates = { ... ;
'VD1';...
'VQ1';...
'VT';...
'P1';...
'Q1';...
'ID1';...
'IQ1';...
};
parameters = { ... ;
'SBASE';...
'UBASE';...
'P0';...
'Q0';...
'V0';...
'VQ0';...
'nP';...
'nQ';...
'LFTYPE';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
};
internalstates = { ... ;
'P1';...
'Q1';...
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
res.x0=zeros(1,2);
res.y0=zeros(1,7);
res.p0=zeros(1,9);
res.x0(1) = 0; % Xp 
res.x0(2) = 0; % Xq 
res.y0(1) = 1; % VD1 
res.y0(2) = 0; % VQ1 
res.y0(3) = 1; % VT 
res.y0(4) = 1; % P1 
res.y0(5) = 0; % Q1 
res.y0(6) = 0; % ID1 
res.y0(7) = 0; % IQ1 
res.p0(1) = 100; % SBASE 
res.p0(2) = 10; % UBASE 
res.p0(3) = 1000; % P0 
res.p0(4) = 1; % Q0 
res.p0(5) = 10; % V0 
res.p0(6) = 10; % VQ0 
res.p0(7) = 2; % nP 
res.p0(8) = 2; % nQ 
res.p0(9) = 1; % LFTYPE 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
SBASE = param(1);
UBASE = param(2);
P0 = param(3);
Q0 = param(4);
V0 = param(5);
VQ0 = param(6);
nP = param(7);
nQ = param(8);
LFTYPE = param(9);
end
%------- map parameters -------------------
SBASE = param(1);
UBASE = param(2);
P0 = param(3);
Q0 = param(4);
V0 = param(5);
VQ0 = param(6);
nP = param(7);
nQ = param(8);
LFTYPE = param(9);
%------- map x -------------------
Xp = x(1);
Xq = x(2);
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
VT = y(3);
P1 = y(4);
Q1 = y(5);
ID1 = y(6);
IQ1 = y(7);


if flag == 1
%----- f 
res = empty;
%-------------------------------------------------------------------------------------------------
if (t < 0) 
if ((abs(LFTYPE-1.0*(1))<1e-9)) 
res(1) = P1 - P0/(1000*SBASE);
res(2) = Q1 - Q0/(1000*SBASE);
else
if ((abs(LFTYPE-1.0*(2))<1e-9)) 
res(1) = P1 - P0/(1000*SBASE);
res(2) = VT - V0/UBASE;
else
res(1) = VQ1 - VQ0/UBASE;
res(2) = VT - V0/UBASE;
end
end
else
res(1) = 0;
res(2) = 0;
end
%-------------------------------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%-------------------------------------------------------------------------------------------------
if (t < 0) 
if ((abs(LFTYPE-1.0*(1))<1e-9)) 
else
if ((abs(LFTYPE-1.0*(2))<1e-9)) 
else
end
end
else
end
%-------------------------------------------------------------------------------------------------
elseif flag == 3
%----- fy 
res = empty3;
%-------------------------------------------------------------------------------------------------
if (t < 0) 
if ((abs(LFTYPE-1.0*(1))<1e-9)) 
res = [res;[1 4 (1)]];
res = [res;[2 5 (1)]];
else
if ((abs(LFTYPE-1.0*(2))<1e-9)) 
res = [res;[1 4 (1)]];
res = [res;[2 3 (1)]];
else
res = [res;[1 2 (1)]];
res = [res;[2 3 (1)]];
end
end
else
end
%-------------------------------------------------------------------------------------------------
elseif flag == 4
%----- g 
res = empty;
%-------------------------------------------------------------------------------------------------
res(1) = VT^nP*Xp - P1;
res(2) = VT^nQ*Xq - Q1;
res(3) = P1 + ID1*VD1 + IQ1*VQ1;
res(4) = Q1 + ID1*VQ1 - IQ1*VD1;
%-------------------------------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%-------------------------------------------------------------------------------------------------
res = [res;[1 1 (VT^nP)]];
res = [res;[2 2 (VT^nQ)]];
%-------------------------------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%-------------------------------------------------------------------------------------------------
res = [res;[1 3 (VT^(nP - 1)*Xp*nP)]];
res = [res;[1 4 (-1)]];
res = [res;[2 3 (VT^(nQ - 1)*Xq*nQ)]];
res = [res;[2 5 (-1)]];
res = [res;[3 1 (ID1)]];
res = [res;[3 2 (IQ1)]];
res = [res;[3 4 (1)]];
res = [res;[3 6 (VD1)]];
res = [res;[3 7 (VQ1)]];
res = [res;[4 1 (-IQ1)]];
res = [res;[4 2 (ID1)]];
res = [res;[4 5 (1)]];
res = [res;[4 6 (VQ1)]];
res = [res;[4 7 (-VD1)]];
%-------------------------------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%-------------------------------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:2];[1:2];ones(1,2)]';
%-------------------------------------------------------------------------------------------------
elseif flag == 9
%----- hy 
res = empty3;
%-------------------------------------------------------------------------------------------------
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
elseif flag == 107
res.x0=x;
res.y0=y;
%-------------------------------------------------------------------------------------------------
%-------------------------------------------------------------------------------------------------
end
