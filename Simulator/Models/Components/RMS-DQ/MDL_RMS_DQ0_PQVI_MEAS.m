%----- Equations f 

function res = MDL_RMS_DQ0_PQVI_MEAS(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_PQVI_MEAS');
disp('inputs:  ID IQ VD VQ');
disp('external_states:  P Q Imag Vmag');
disp('parameters:  SR SN UR UN');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 8');
disp('Number of f = 0');
disp('Number of g = 4');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_PQVI_MEAS([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 4 0 []];
return;
elseif flag == 101
res=[0 8 4 0 4];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
};
algstates = { ... ;
'ID';...
'IQ';...
'VD';...
'VQ';...
'P';...
'Q';...
'Imag';...
'Vmag';...
};
parameters = { ... ;
'SR';...
'SN';...
'UR';...
'UN';...
};
externalstates = { ... ;
'P';...
'Q';...
'Imag';...
'Vmag';...
};
internalstates = { ... ;
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
res.y0=zeros(1,8);
res.p0=zeros(1,4);
res.y0(1) = 0; % ID 
res.y0(2) = 0; % IQ 
res.y0(3) = 1; % VD 
res.y0(4) = 0; % VQ 
res.y0(5) = 0; % P 
res.y0(6) = 0; % Q 
res.y0(7) = 0; % Imag 
res.y0(8) = 0; % Vmag 
res.p0(1) = 100; % SR 
res.p0(2) = 100; % SN 
res.p0(3) = 10; % UR 
res.p0(4) = 10; % UN 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
SR = param(1);
SN = param(2);
UR = param(3);
UN = param(4);
end
%------- map parameters -------------------
SR = param(1);
SN = param(2);
UR = param(3);
UN = param(4);
%------- map x -------------------
%------- map y -------------------
ID = y(1);
IQ = y(2);
VD = y(3);
VQ = y(4);
P = y(5);
Q = y(6);
Imag = y(7);
Vmag = y(8);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
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
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = P - (SN*(ID*VD + IQ*VQ))/SR;
res(2) = Q - (SN*(ID*VQ - IQ*VD))/SR;
%--------------------
if ((abs(ID)<1e-12 && abs(IQ)<1e-12) ) 
res(3) = Imag - (SN*UR*(ID + IQ))/(SR*UN);
else
res(3) = Imag - (SN*UR*(ID^2 + IQ^2)^(1/2))/(SR*UN);
end
%--------------------
if ((abs(VD)<1e-12 && abs(VQ)<1e-12) ) 
res(4) = Vmag - (UN*(VD + VQ))/UR;
else
res(4) = Vmag - (UN*(VD^2 + VQ^2)^(1/2))/UR;
end
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if ((abs(ID)<1e-12 && abs(IQ)<1e-12) ) 
else
end
%--------------------
if ((abs(VD)<1e-12 && abs(VQ)<1e-12) ) 
else
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-(SN*VD)/SR)]];
res = [res;[1 2 (-(SN*VQ)/SR)]];
res = [res;[1 3 (-(ID*SN)/SR)]];
res = [res;[1 4 (-(IQ*SN)/SR)]];
res = [res;[1 5 (1)]];
res = [res;[2 1 (-(SN*VQ)/SR)]];
res = [res;[2 2 ((SN*VD)/SR)]];
res = [res;[2 3 ((IQ*SN)/SR)]];
res = [res;[2 4 (-(ID*SN)/SR)]];
res = [res;[2 6 (1)]];
%--------------------
if ((abs(ID)<1e-12 && abs(IQ)<1e-12) ) 
res = [res;[3 1 (-(SN*UR)/(SR*UN))]];
res = [res;[3 2 (-(SN*UR)/(SR*UN))]];
res = [res;[3 7 (1)]];
else
res = [res;[3 1 (-(ID*SN*UR)/(SR*UN*(ID^2 + IQ^2)^(1/2)))]];
res = [res;[3 2 (-(IQ*SN*UR)/(SR*UN*(ID^2 + IQ^2)^(1/2)))]];
res = [res;[3 7 (1)]];
end
%--------------------
if ((abs(VD)<1e-12 && abs(VQ)<1e-12) ) 
res = [res;[4 3 (-UN/UR)]];
res = [res;[4 4 (-UN/UR)]];
res = [res;[4 8 (1)]];
else
res = [res;[4 3 (-(UN*VD)/(UR*(VD^2 + VQ^2)^(1/2)))]];
res = [res;[4 4 (-(UN*VQ)/(UR*(VD^2 + VQ^2)^(1/2)))]];
res = [res;[4 8 (1)]];
end
%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = empty3;
%--------------------------------------------------------------------------
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%%----- Measurements
elseif flag == 105
elseif flag == 107
res.x0=x;
res.y0=y;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
