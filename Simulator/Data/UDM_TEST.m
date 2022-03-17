%----- Equations f 

function res = UDM_TEST(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: UDM_TEST');
disp('dynamic_states:  dTstart xTIME STATUS y2_state');
disp('external_states:  y1 y2');
disp('internal_states:  TIME');
disp('events:  ev_on ev_y2_hit_min ev_y2_hit_max');
disp('parameters:  Ton K T minval maxval minout maxout');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 4');
disp('Number of y = 6');
disp('Number of f = 4');
disp('Number of g = 6');
disp('Number of p = 7');
disp(' ');
disp(' ');
disp(' ');
res1 = UDM_TEST([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [4 6 0 [4 5 6 ]];
return;
elseif flag == 101
res=[4 6 7 4 6];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dTstart';...
'xTIME';...
'STATUS';...
'y2_state';...
};
algstates = { ... ;
'TIME';...
'y1';...
'y2';...
'ev_on';...
'ev_y2_hit_min';...
'ev_y2_hit_max';...
};
parameters = { ... ;
'Ton';...
'K';...
'T';...
'minval';...
'maxval';...
'minout';...
'maxout';...
};
externalstates = { ... ;
'y1';...
'y2';...
};
internalstates = { ... ;
'TIME';...
};
events = { ... ;
'ev_on';...
'ev_y2_hit_min';...
'ev_y2_hit_max';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,4);
res.y0=zeros(1,6);
res.p0=zeros(1,7);
res.x0(1) = 0; % dTstart 
res.x0(2) = 0; % xTIME 
res.x0(3) = 0; % STATUS 
res.y0(1) = 0; % TIME 
res.y0(2) = 1; % y1 
res.y0(3) = 0; % y2 
res.y0(4) = 0; % ev_on 
res.p0(1) = 1; % Ton 
res.p0(2) = 1; % K 
res.p0(3) = 1; % T 
res.p0(4) = 0; % minval 
res.p0(5) = 0; % maxval 
res.p0(6) = 0; % minout 
res.p0(7) = 0; % maxout 
return;
elseif flag == 110
	res = [1  1  1];
return;
elseif flag == 111
	res = [0 -1  1];
return;
elseif flag == 106
Ton = param(1);
K = param(2);
T = param(3);
minval = param(4);
maxval = param(5);
minout = param(6);
maxout = param(7);
end
%------- map parameters -------------------
Ton = param(1);
K = param(2);
T = param(3);
minval = param(4);
maxval = param(5);
minout = param(6);
maxout = param(7);
%------- map x -------------------
dTstart = x(1);
xTIME = x(2);
STATUS = x(3);
y2_state = x(4);
%------- map y -------------------
TIME = y(1);
y1 = y(2);
y2 = y(3);
ev_on = y(4);
ev_y2_hit_min = y(5);
ev_y2_hit_max = y(6);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
res(1) = 0;
res(3) = 0;
if (t < 0) 
res(2) = 0;
else
res(2) = 1;
end
%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((y1)-(minval)) < 0 )) 
res(4) = y2_state - minout;
else
res(4) = y2_state - maxout;
end
else
res(4) = 0;
end
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
if (t < 0) 
else
end
%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((y1)-(minval)) < 0 )) 
res = [res;[4 4 (1)]];
else
res = [res;[4 4 (1)]];
end
else
end
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------
if (t < 0) 
else
end
%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((y1)-(minval)) < 0 )) 
else
end
else
end
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = Ton - TIME + ev_on;
if (t < 0) 
res(2) = y1;
else
res(2) = y1 - K*STATUS*sin((2*pi*(TIME - Ton))/T);
end
res(3) = TIME - xTIME;
res(4) = y2 - y2_state;

%--------------------------------------------------------------------------
res(5) = ev_y2_hit_min + minval - y1;
res(6) = ev_y2_hit_max + maxval - y1;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
if (t < 0) 
else
res = [res;[2 3 (-K*sin((2*pi*(TIME - Ton))/T))]];
end
res = [res;[3 2 (-1)]];
res = [res;[4 4 (-1)]];

%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-1)]];
res = [res;[1 4 (1)]];
if (t < 0) 
res = [res;[2 2 (1)]];
else
res = [res;[2 1 (-(2*K*STATUS*pi*cos((2*pi*(TIME - Ton))/T))/T)]];
res = [res;[2 2 (1)]];
end
res = [res;[3 1 (1)]];
res = [res;[4 3 (1)]];

%--------------------------------------------------------------------------
res = [res;[5 2 (-1)]];
res = [res;[5 5 (1)]];
res = [res;[6 2 (-1)]];
res = [res;[6 6 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
if (ev==1)
res(1) = TIME;
res(3) = 1;
end
if (ev==2)
res(4) = minout;
end
if (ev==3)
res(4) = maxout;
end
elseif flag == 8
%----- hx 
res = [[1:4];[1:4];ones(1,4)]';
%--------------------------------------------------------------------------
if (ev==1)
end
if (ev==2)
end
if (ev==3)
end
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------
if (ev==1)
res = [res;[1 1 (1)]];
end
if (ev==2)
end
if (ev==3)
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
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
end
