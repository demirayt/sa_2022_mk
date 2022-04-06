%----- Equations f 

function res = UDM_TEST_2(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: UDM_TEST_2');
disp('dynamic_states:  M S Status xTime y2_state');
disp('external_states:  y1 y2');
disp('events:  ev_yab ev_yauf ev_on ev_y2_hit_min ev_y2_hit_max');
disp('parameters:  ymax ymin Ton m_auf m_ab minval maxval minout maxout');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 5');
disp('Number of y = 7');
disp('Number of f = 5');
disp('Number of g = 7');
disp('Number of p = 9');
disp(' ');
disp(' ');
disp(' ');
res1 = UDM_TEST_2([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [5 7 0 [3 4 5 6 7 ]];
return;
elseif flag == 101
res=[5 7 9 5 7];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'M';...
'S';...
'Status';...
'xTime';...
'y2_state';...
};
algstates = { ... ;
'y1';...
'y2';...
'ev_yab';...
'ev_yauf';...
'ev_on';...
'ev_y2_hit_min';...
'ev_y2_hit_max';...
};
parameters = { ... ;
'ymax';...
'ymin';...
'Ton';...
'm_auf';...
'm_ab';...
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
};
events = { ... ;
'ev_yab';...
'ev_yauf';...
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
res.x0=zeros(1,5);
res.y0=zeros(1,7);
res.p0=zeros(1,9);
res.x0(1) = 0; % M 
res.x0(2) = 0; % S 
res.x0(3) = 0; % Status 
res.x0(4) = 0; % xTime 
res.y0(1) = 1; % y1 
res.y0(2) = 0; % y2 
res.y0(3) = 0; % ev_yab 
res.y0(4) = 0; % ev_yauf 
res.y0(5) = 0; % ev_on 
res.p0(1) = 1; % ymax 
res.p0(2) = 0; % ymin 
res.p0(3) = 1; % Ton 
res.p0(4) = 1; % m_auf 
res.p0(5) = -1; % m_ab 
res.p0(6) = 0; % minval 
res.p0(7) = 0; % maxval 
res.p0(8) = 0; % minout 
res.p0(9) = 0; % maxout 
return;
elseif flag == 110
	res = [1  1  1  1  1];
return;
elseif flag == 111
	res = [0  0  0 -1  1];
return;
elseif flag == 106
ymax = param(1);
ymin = param(2);
Ton = param(3);
m_auf = param(4);
m_ab = param(5);
minval = param(6);
maxval = param(7);
minout = param(8);
maxout = param(9);
end
%------- map parameters -------------------
ymax = param(1);
ymin = param(2);
Ton = param(3);
m_auf = param(4);
m_ab = param(5);
minval = param(6);
maxval = param(7);
minout = param(8);
maxout = param(9);
%------- map x -------------------
M = x(1);
S = x(2);
Status = x(3);
xTime = x(4);
y2_state = x(5);
%------- map y -------------------
y1 = y(1);
y2 = y(2);
ev_yab = y(3);
ev_yauf = y(4);
ev_on = y(5);
ev_y2_hit_min = y(6);
ev_y2_hit_max = y(7);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
res(2) = 0;
res(3) = 0;
if (t < 0) 
res(1) = 0;
res(4) = 0;
else
res(1) = S;
res(4) = 1;
end
%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((y1)-(minval)) < 0 )) 
res(5) = y2_state - minout;
else
res(5) = y2_state - maxout;
end
else
res(5) = 0;
end
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
if (t < 0) 
else
res = [res;[1 2 (1)]];
end
%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((y1)-(minval)) < 0 )) 
res = [res;[5 5 (1)]];
else
res = [res;[5 5 (1)]];
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
res(1) = Ton + ev_on - xTime;
res(2) = M + ev_yauf - ymin;
res(3) = M + ev_yab - ymax;
if (t < 0) 
res(4) = y1;
else
res(4) = y1 - M*Status;
end
res(5) = y2 - y2_state;
%--------------------------------------------------------------------------
res(6) = ev_y2_hit_min + minval - y1;
res(7) = ev_y2_hit_max + maxval - y1;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 4 (-1)]];
res = [res;[2 1 (1)]];
res = [res;[3 1 (1)]];
if (t < 0) 
else
res = [res;[4 1 (-Status)]];
res = [res;[4 3 (-M)]];
end
res = [res;[5 5 (-1)]];
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 5 (1)]];
res = [res;[2 4 (1)]];
res = [res;[3 3 (1)]];
if (t < 0) 
res = [res;[4 1 (1)]];
else
res = [res;[4 1 (1)]];
end
res = [res;[5 2 (1)]];
%--------------------------------------------------------------------------
res = [res;[6 1 (-1)]];
res = [res;[6 6 (1)]];
res = [res;[7 1 (-1)]];
res = [res;[7 7 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
if (ev==3)
res(3) = 1;
res(2) = m_auf;
end
if (ev==1)
res(2) = m_ab;
end
if (ev==2)
res(2) = m_auf;
end
if (ev==4)
res(5) = minout;
end
if (ev==5)
res(5) = maxout;
end
elseif flag == 8
%----- hx 
res = [[1:5];[1:5];ones(1,5)]';
%--------------------------------------------------------------------------
if (ev==3)
end
if (ev==1)
end
if (ev==2)
end
if (ev==4)
end
if (ev==5)
end
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------
if (ev==3)
end
if (ev==1)
end
if (ev==2)
end
if (ev==4)
end
if (ev==5)
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
