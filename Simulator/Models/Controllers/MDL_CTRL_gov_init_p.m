%----- Equations f 
% 	 d(Torder)/dt = 0 

%----- Equations g 
% 	 TMECH-Torder = 0


function res = MDL_CTRL_gov_init_p(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_gov_init_p');
disp('dynamic_states:  Torder');
disp('external_states:  P1 TMECH W');
disp('parameters:  Setpoint');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 1');
disp('Number of y = 3');
disp('Number of f = 1');
disp('Number of g = 1');
disp('Number of p = 1');
disp(' ');
disp(' ');
disp(' ');
return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [1 1 0 []];
return;
elseif flag == 101
res=[1 3 1 1 1];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'Torder';...
};
algstates = { ... ;
'P1';...
'TMECH';...
'W';...
};
parameters = { ... ;
'Setpoint';...
};
externalstates = { ... ;
'P1';...
'TMECH';...
'W';...
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
res.p0=zeros(1,1);
res.x0(1) = 1; % Torder 
res.y0(1) = 1; % P1 
res.y0(2) = 1; % TMECH 
res.y0(3) = 1; % W 
res.p0(1) = 1; % Setpoint 
return;
end
%------- map parameters -------------------
Setpoint = param(1);
%------- map x -------------------
Torder = x(1);
%------- map y -------------------
P1 = y(1);
TMECH = y(2);
W = y(3);


%----------------------- ;
%-----------------------;
if flag == 1
%----- f 
res = empty;
%----------------------- 
if t < 0
res(1) = P1-Setpoint;
else
res(1) = 0;
end
%----------------------- 
elseif flag == 2
%----- fx 
res = empty3;
%----------------------- 
if t < 0
else
end
%----------------------- 
elseif flag == 3
%----- fy 
res = empty3;
%----------------------- 
if t < 0
res = [res;[1 1 1]];
else
end
%----------------------- 
elseif flag == 4
%----- g 
res = empty;
%-----------------------
res(1) = TMECH-Torder;
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
res = [res;[1 1 -1]];
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
res = [res;[1 2 1]];
%-----------------------
elseif flag == 7
%----- h 
res = x;
%-----------------------
elseif flag == 8
%----- hx 
res = [[1:1];[1:1];ones(1,1)]';
%-----------------------
elseif flag == 9
%----- hy 
res = empty3;
%-----------------------
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%-----------------------
%-----------------------
%%----- Measurements
elseif flag == 105
elseif flag == 110
	res = [];
elseif flag == 111
	res = [];
end
