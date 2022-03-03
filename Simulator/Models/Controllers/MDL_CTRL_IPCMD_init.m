%----- Equations f 

function res = MDL_CTRL_IPCMD_init(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_IPCMD_init');
disp('dynamic_states:  dIPCMD');
disp('inputs:  VQ P');
disp('external_states:  IPCMD');
disp('parameters:  LFTYPE Psetpoint VQsetpoint K');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 1');
disp('Number of y = 3');
disp('Number of f = 1');
disp('Number of g = 1');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_IPCMD_init([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [1 1 0 []];
return;
elseif flag == 101
res=[1 3 4 1 1];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dIPCMD';...
};
algstates = { ... ;
'VQ';...
'P';...
'IPCMD';...
};
parameters = { ... ;
'LFTYPE';...
'Psetpoint';...
'VQsetpoint';...
'K';...
};
externalstates = { ... ;
'IPCMD';...
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
res.x0=zeros(1,1);
res.y0=zeros(1,3);
res.p0=zeros(1,4);
res.x0(1) = 1; % dIPCMD 
res.y0(1) = 0; % VQ 
res.y0(2) = 0; % P 
res.y0(3) = 1.000000e-01; % IPCMD 
res.p0(1) = 1; % LFTYPE 
res.p0(2) = 1; % Psetpoint 
res.p0(3) = 0; % VQsetpoint 
res.p0(4) = 1; % K 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
LFTYPE = param(1);
Psetpoint = param(2);
VQsetpoint = param(3);
K = param(4);
end
%------- map parameters -------------------
LFTYPE = param(1);
Psetpoint = param(2);
VQsetpoint = param(3);
K = param(4);
%------- map x -------------------
dIPCMD = x(1);
%------- map y -------------------
VQ = y(1);
P = y(2);
IPCMD = y(3);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
if (t < 0) 
if ((abs(LFTYPE-1.0*(3))<1e-9)) 
res(1) = VQ - VQsetpoint;
else
res(1) = P - Psetpoint;
end
else
res(1) = 0;;
end

%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
if (t < 0) 
if ((abs(LFTYPE-1.0*(3))<1e-9)) 
else
end
else
end

%--------------------------------------------------------------------------
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------
if (t < 0) 
if ((abs(LFTYPE-1.0*(3))<1e-9)) 
res = [res;[1 1 (1)]];
else
res = [res;[1 2 (1)]];
end
else
end

%--------------------------------------------------------------------------
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = IPCMD - K*dIPCMD;
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-K)]];
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 3 (1)]];
%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:1];[1:1];ones(1,1)]';
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
