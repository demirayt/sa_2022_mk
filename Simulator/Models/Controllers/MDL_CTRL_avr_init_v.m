%----- Equations f 

function res = MDL_CTRL_avr_init_v(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_avr_init_v');
disp('dynamic_states:  dEfd');
disp('inputs:  VT');
disp('external_states:  EFD');
disp('parameters:  Vsetpoint');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 1');
disp('Number of y = 2');
disp('Number of f = 1');
disp('Number of g = 1');
disp('Number of p = 1');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_avr_init_v([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [1 1 0 []];
return;
elseif flag == 101
res=[1 2 1 1 1];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dEfd';...
};
algstates = { ... ;
'VT';...
'EFD';...
};
parameters = { ... ;
'Vsetpoint';...
};
externalstates = { ... ;
'EFD';...
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
res.y0=zeros(1,2);
res.p0=zeros(1,1);
res.x0(1) = 1; % dEfd 
res.y0(1) = 1; % VT 
res.y0(2) = 1; % EFD 
res.p0(1) = 1; % Vsetpoint 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
Vsetpoint = param(1);
end
%------- map parameters -------------------
Vsetpoint = param(1);
%------- map x -------------------
dEfd = x(1);
%------- map y -------------------
VT = y(1);
EFD = y(2);


if flag == 1
%----- f 
res = empty;
%-----------------------
if  ( t < 0 ) 
res(1) = VT - Vsetpoint;
else
res(1) = 0;
end
%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------
if  ( t < 0 ) 
else
end
%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------
if  ( t < 0 ) 
res = [res;[1 1 (1)]];
else
end
%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
res(1) = EFD - dEfd;
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
res = [res;[1 1 (-1)]];
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
res = [res;[1 2 (1)]];
%-----------------------
elseif flag == 7
%----- h 
res = x;
elseif flag == 8
%----- hx 
res = [[1:1];[1:1];ones(1,1)]';
elseif flag == 9
%----- hy 
res = empty3;
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
