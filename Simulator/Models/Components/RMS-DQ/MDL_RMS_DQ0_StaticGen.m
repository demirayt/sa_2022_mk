%----- Equations f 

function res = MDL_RMS_DQ0_StaticGen(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_StaticGen');
disp('inputs:  IPCMD IQCMD VD1 VQ1 VT');
disp('external_states:  ID1 IQ1 P1 Q1');
disp('internal_states:  VD1R VQ1R ID1R IQ1R P1R Q1R IT1R');
disp('parameters:  SR1 SN1 UR1 UN1');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 16');
disp('Number of f = 0');
disp('Number of g = 11');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_StaticGen([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 11 0 []];
return;
elseif flag == 101
res=[0 16 4 0 11];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
};
algstates = { ... ;
'IPCMD';...
'IQCMD';...
'VD1';...
'VQ1';...
'VT';...
'ID1';...
'IQ1';...
'P1';...
'Q1';...
'VD1R';...
'VQ1R';...
'ID1R';...
'IQ1R';...
'P1R';...
'Q1R';...
'IT1R';...
};
parameters = { ... ;
'SR1';...
'SN1';...
'UR1';...
'UN1';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
'P1';...
'Q1';...
};
internalstates = { ... ;
'VD1R';...
'VQ1R';...
'ID1R';...
'IQ1R';...
'P1R';...
'Q1R';...
'IT1R';...
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
res.y0=zeros(1,16);
res.p0=zeros(1,4);
res.y0(1) = 0; % IPCMD 
res.y0(2) = 0; % IQCMD 
res.y0(3) = 1; % VD1 
res.y0(4) = 0; % VQ1 
res.y0(5) = 1; % VT 
res.y0(6) = 0; % ID1 
res.y0(7) = 0; % IQ1 
res.y0(8) = 0; % P1 
res.y0(9) = 0; % Q1 
res.y0(10) = 1; % VD1R 
res.y0(11) = 0; % VQ1R 
res.y0(12) = 0; % ID1R 
res.y0(13) = 0; % IQ1R 
res.y0(14) = 0; % P1R 
res.y0(15) = 0; % Q1R 
res.y0(16) = 1; % IT1R 
res.p0(1) = 100; % SR1 
res.p0(2) = 100; % SN1 
res.p0(3) = 10; % UR1 
res.p0(4) = 10; % UN1 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
SR1 = param(1);
SN1 = param(2);
UR1 = param(3);
UN1 = param(4);
end
%------- map parameters -------------------
SR1 = param(1);
SN1 = param(2);
UR1 = param(3);
UN1 = param(4);
%------- map x -------------------
%------- map y -------------------
IPCMD = y(1);
IQCMD = y(2);
VD1 = y(3);
VQ1 = y(4);
VT = y(5);
ID1 = y(6);
IQ1 = y(7);
P1 = y(8);
Q1 = y(9);
VD1R = y(10);
VQ1R = y(11);
ID1R = y(12);
IQ1R = y(13);
P1R = y(14);
Q1R = y(15);
IT1R = y(16);


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
res(1) = UN1*VD1 - UR1*VD1R;
res(2) = UN1*VQ1 - UR1*VQ1R;
res(3) = (ID1*SN1)/UN1 + (ID1R*SR1)/UR1;
res(4) = (IQ1*SN1)/UN1 + (IQ1R*SR1)/UR1;
%--------------------------------------------------------------------------
res(5) = IPCMD*VD1R + ID1R*VT - IQCMD*VQ1R;
res(6) = IQ1R*VT - IPCMD*VQ1R - IQCMD*VD1R;
res(7) = P1 - ID1*VD1 - IQ1*VQ1;
res(8) = Q1 - ID1*VQ1 + IQ1*VD1;
%--------------------
if ((abs(ID1R)<1e-12 && abs(IQ1R)<1e-12) ) 
res(9) = IT1R - IQ1R - ID1R;
else
res(9) = IT1R - (ID1R^2 + IQ1R^2)^(1/2);
end
res(10) = P1R - ID1R*VD1R - IQ1R*VQ1R;
res(11) = Q1R - ID1R*VQ1R + IQ1R*VD1R;
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------
if ((abs(ID1R)<1e-12 && abs(IQ1R)<1e-12) ) 
else
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 3 (UN1)]];
res = [res;[1 10 (-UR1)]];
res = [res;[2 4 (UN1)]];
res = [res;[2 11 (-UR1)]];
res = [res;[3 6 (SN1/UN1)]];
res = [res;[3 12 (SR1/UR1)]];
res = [res;[4 7 (SN1/UN1)]];
res = [res;[4 13 (SR1/UR1)]];
%--------------------------------------------------------------------------
res = [res;[5 1 (VD1R)]];
res = [res;[5 2 (-VQ1R)]];
res = [res;[5 5 (ID1R)]];
res = [res;[5 10 (IPCMD)]];
res = [res;[5 11 (-IQCMD)]];
res = [res;[5 12 (VT)]];
res = [res;[6 1 (-VQ1R)]];
res = [res;[6 2 (-VD1R)]];
res = [res;[6 5 (IQ1R)]];
res = [res;[6 10 (-IQCMD)]];
res = [res;[6 11 (-IPCMD)]];
res = [res;[6 13 (VT)]];
res = [res;[7 3 (-ID1)]];
res = [res;[7 4 (-IQ1)]];
res = [res;[7 6 (-VD1)]];
res = [res;[7 7 (-VQ1)]];
res = [res;[7 8 (1)]];
res = [res;[8 3 (IQ1)]];
res = [res;[8 4 (-ID1)]];
res = [res;[8 6 (-VQ1)]];
res = [res;[8 7 (VD1)]];
res = [res;[8 9 (1)]];
%--------------------
if ((abs(ID1R)<1e-12 && abs(IQ1R)<1e-12) ) 
res = [res;[9 12 (-1)]];
res = [res;[9 13 (-1)]];
res = [res;[9 16 (1)]];
else
res = [res;[9 12 (-ID1R/(ID1R^2 + IQ1R^2)^(1/2))]];
res = [res;[9 13 (-IQ1R/(ID1R^2 + IQ1R^2)^(1/2))]];
res = [res;[9 16 (1)]];
end
res = [res;[10 10 (-ID1R)]];
res = [res;[10 11 (-IQ1R)]];
res = [res;[10 12 (-VD1R)]];
res = [res;[10 13 (-VQ1R)]];
res = [res;[10 14 (1)]];
res = [res;[11 10 (IQ1R)]];
res = [res;[11 11 (-ID1R)]];
res = [res;[11 12 (-VQ1R)]];
res = [res;[11 13 (VD1R)]];
res = [res;[11 15 (1)]];
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
end
