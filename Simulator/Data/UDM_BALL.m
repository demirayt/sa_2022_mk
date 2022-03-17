%----- Equations f 

function res = UDM_BALL(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: UDM_BALL');
disp('dynamic_states:  s v');
disp('events:  ev_displacement ev_displacement2');
disp('parameters:  r v0 s0 pos2 g');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 2');
disp('Number of y = 2');
disp('Number of f = 2');
disp('Number of g = 2');
disp('Number of p = 5');
disp(' ');
disp(' ');
disp(' ');
res1 = UDM_BALL([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [2 2 0 [1 2 ]];
return;
elseif flag == 101
res=[2 2 5 2 2];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
's';...
'v';...
};
algstates = { ... ;
'ev_displacement';...
'ev_displacement2';...
};
parameters = { ... ;
'r';...
'v0';...
's0';...
'pos2';...
'g';...
};
externalstates = { ... ;
};
internalstates = { ... ;
};
events = { ... ;
'ev_displacement';...
'ev_displacement2';...
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
res.y0=zeros(1,2);
res.p0=zeros(1,5);
res.x0(1) = 0; % s 
res.x0(2) = 0; % v 
res.y0(1) = 0; % ev_displacement 
res.y0(2) = 0; % ev_displacement2 
res.p0(1) = 9.000000e-01; % r 
res.p0(2) = 0; % v0 
res.p0(3) = 0; % s0 
res.p0(4) = 1.500000e+00; % pos2 
res.p0(5) = 9.810000e+00; % g 
return;
elseif flag == 110
	res = [1  1];
return;
elseif flag == 111
	res = [0  0];
return;
elseif flag == 106
r = param(1);
v0 = param(2);
s0 = param(3);
pos2 = param(4);
g = param(5);
end
%------- map parameters -------------------
r = param(1);
v0 = param(2);
s0 = param(3);
pos2 = param(4);
g = param(5);
%------- map x -------------------
s = x(1);
v = x(2);
%------- map y -------------------
ev_displacement = y(1);
ev_displacement2 = y(2);


if flag == 1
%----- f 
res = empty;
%-----------------------
if (t < 0) 
res(2) = v - v0;
res(1) = s - s0;
else
res(2) = -g;
res(1) = v;
end
%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------
if (t < 0) 
res = [res;[2 2 (1)]];
res = [res;[1 1 (1)]];
else
res = [res;[1 2 (1)]];
end
%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------
if (t < 0) 
else
end
%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
res(1) = ev_displacement - s;
res(2) = ev_displacement2 + pos2 - s;
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
res = [res;[1 1 (-1)]];
res = [res;[2 1 (-1)]];
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
res = [res;[1 1 (1)]];
res = [res;[2 2 (1)]];
%-----------------------
elseif flag == 7
%----- h 
res = x;
%-----------------------
if (ev==1)
res(2) = -r*v;
end

if (ev==2)
res(2) = -r*v;
end
elseif flag == 8
%----- hx 
res = [[1:2];[1:2];ones(1,2)]';
%-----------------------
if (ev==1)
res = [res;[2 2 (-r)]];
end

if (ev==2)
res = [res;[2 2 (-r)]];
end
elseif flag == 9
%----- hy 
res = empty3;
%-----------------------
if (ev==1)
end

if (ev==2)
end
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
