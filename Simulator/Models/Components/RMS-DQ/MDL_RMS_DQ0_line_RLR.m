%----- Equations f 

function res = MDL_RMS_DQ0_line_RLR(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_line_RLR');
disp('inputs:  VD1 VQ1 VD2 VQ2');
disp('external_states:  ID1 IQ1 ID2 IQ2');
disp('internal_states:  FlxD FlxQ VRD VRQ ILD ILQ');
disp('parameters:  Ra La ws Rinf');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 14');
disp('Number of f = 0');
disp('Number of g = 10');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_line_RLR([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 10 0 []];
return;
elseif flag == 101
res=[0 14 4 0 10];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
};
algstates = { ... ;
'VD1';...
'VQ1';...
'VD2';...
'VQ2';...
'ID1';...
'IQ1';...
'ID2';...
'IQ2';...
'FlxD';...
'FlxQ';...
'VRD';...
'VRQ';...
'ILD';...
'ILQ';...
};
parameters = { ... ;
'Ra';...
'La';...
'ws';...
'Rinf';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
'ID2';...
'IQ2';...
};
internalstates = { ... ;
'FlxD';...
'FlxQ';...
'VRD';...
'VRQ';...
'ILD';...
'ILQ';...
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
res.x0=zeros(1,0);
res.y0=zeros(1,14);
res.p0=zeros(1,4);
res.y0(1) = 1; % VD1 
res.y0(3) = 1; % VD2 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
Ra = param(1);
La = param(2);
ws = param(3);
Rinf = param(4);
end
%------- map parameters -------------------
Ra = param(1);
La = param(2);
ws = param(3);
Rinf = param(4);
%------- map x -------------------
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
VD2 = y(3);
VQ2 = y(4);
ID1 = y(5);
IQ1 = y(6);
ID2 = y(7);
IQ2 = y(8);
FlxD = y(9);
FlxQ = y(10);
VRD = y(11);
VRQ = y(12);
ILD = y(13);
ILQ = y(14);


if flag == 1
%----- f 
res = empty;
%-----------------------

%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------

%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------

%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
res(1) = FlxD - ILD*La;
res(2) = FlxQ - ILQ*La;
res(3) = VRD - ID1*Ra;
res(4) = VRQ - IQ1*Ra;
res(5) = ID1 + ID2;
res(6) = IQ1 + IQ2;
res(7) = ILD - ID1 - (VD2 - VD1 + VRD)/Rinf;
res(8) = ILQ - IQ1 - (VQ2 - VQ1 + VRQ)/Rinf;
res(9) = ws*(FlxQ + VD1 - VD2 - VRD);
res(10) = -ws*(FlxD - VQ1 + VQ2 + VRQ);

%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------

%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
res = [res;[1 9 (1)]];
res = [res;[1 13 (-La)]];
res = [res;[2 10 (1)]];
res = [res;[2 14 (-La)]];
res = [res;[3 5 (-Ra)]];
res = [res;[3 11 (1)]];
res = [res;[4 6 (-Ra)]];
res = [res;[4 12 (1)]];
res = [res;[5 5 (1)]];
res = [res;[5 7 (1)]];
res = [res;[6 6 (1)]];
res = [res;[6 8 (1)]];
res = [res;[7 1 (1/Rinf)]];
res = [res;[7 3 (-1/Rinf)]];
res = [res;[7 5 (-1)]];
res = [res;[7 11 (-1/Rinf)]];
res = [res;[7 13 (1)]];
res = [res;[8 2 (1/Rinf)]];
res = [res;[8 4 (-1/Rinf)]];
res = [res;[8 6 (-1)]];
res = [res;[8 12 (-1/Rinf)]];
res = [res;[8 14 (1)]];
res = [res;[9 1 (ws)]];
res = [res;[9 3 (-ws)]];
res = [res;[9 10 (ws)]];
res = [res;[9 11 (-ws)]];
res = [res;[10 2 (ws)]];
res = [res;[10 4 (-ws)]];
res = [res;[10 9 (-ws)]];
res = [res;[10 12 (-ws)]];

%-----------------------
elseif flag == 7
%----- h 
res = x;
%-----------------------
elseif flag == 8
%----- hx 
res = empty3;
%-----------------------
elseif flag == 9
%----- hy 
res = empty3;
%-----------------------
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
