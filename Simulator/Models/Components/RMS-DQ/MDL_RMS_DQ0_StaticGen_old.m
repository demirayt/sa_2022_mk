%----- Equations f 

function res = MDL_RMS_DQ0_StaticGen(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_StaticGen');
disp('inputs:  IPCMD IQCMD VD1 VQ1 VT');
disp('external_states:  ID1 IQ1 P1 Q1 IT');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 10');
disp('Number of f = 0');
disp('Number of g = 5');
disp('Number of p = 0');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_StaticGen([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 5 0 []];
return;
elseif flag == 101
res=[0 10 0 0 5];
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
'IT';...
};
parameters = { ... ;
};
externalstates = { ... ;
'ID1';...
'IQ1';...
'P1';...
'Q1';...
'IT';...
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
res.y0=zeros(1,10);
res.p0=zeros(1,0);
res.y0(1) = 0; % IPCMD 
res.y0(2) = 0; % IQCMD 
res.y0(3) = 1; % VD1 
res.y0(4) = 0; % VQ1 
res.y0(5) = 1; % VT 
res.y0(6) = 0; % ID1 
res.y0(7) = 0; % IQ1 
res.y0(8) = 0; % P1 
res.y0(9) = 0; % Q1 
res.y0(10) = 1; % IT 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
end
%------- map parameters -------------------
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
IT = y(10);


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
res(1) = ID1*VT - IPCMD*VD1 + IQCMD*VQ1;
res(2) = IQ1*VT - IPCMD*VQ1 - IQCMD*VD1;
res(3) = P1 - ID1*VD1 - IQ1*VQ1;
res(4) = Q1 - ID1*VQ1 + IQ1*VD1;
%--------------------
if ((abs(ID1)<1e-12 && abs(IQ1)<1e-12) ) 
res(5) = IT - IQ1 - ID1;
else
res(5) = IT - (ID1^2 + IQ1^2)^(1/2);
end
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
%--------------------
if ((abs(ID1)<1e-12 && abs(IQ1)<1e-12) ) 
else
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-VD1)]];
res = [res;[1 2 (VQ1)]];
res = [res;[1 3 (-IPCMD)]];
res = [res;[1 4 (IQCMD)]];
res = [res;[1 5 (ID1)]];
res = [res;[1 6 (VT)]];
res = [res;[2 1 (-VQ1)]];
res = [res;[2 2 (-VD1)]];
res = [res;[2 3 (-IQCMD)]];
res = [res;[2 4 (-IPCMD)]];
res = [res;[2 5 (IQ1)]];
res = [res;[2 7 (VT)]];
res = [res;[3 3 (-ID1)]];
res = [res;[3 4 (-IQ1)]];
res = [res;[3 6 (-VD1)]];
res = [res;[3 7 (-VQ1)]];
res = [res;[3 8 (1)]];
res = [res;[4 3 (IQ1)]];
res = [res;[4 4 (-ID1)]];
res = [res;[4 6 (-VQ1)]];
res = [res;[4 7 (VD1)]];
res = [res;[4 9 (1)]];
%--------------------
if ((abs(ID1)<1e-12 && abs(IQ1)<1e-12) ) 
res = [res;[5 6 (-1)]];
res = [res;[5 7 (-1)]];
res = [res;[5 10 (1)]];
else
res = [res;[5 6 (-ID1/(ID1^2 + IQ1^2)^(1/2))]];
res = [res;[5 7 (-IQ1/(ID1^2 + IQ1^2)^(1/2))]];
res = [res;[5 10 (1)]];
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
