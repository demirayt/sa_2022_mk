%----- Equations f 

function res = Stromrelais_v1(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: Stromrelais_v1');
disp('dynamic_states:  Stufe1_state Stufe2_state xTrigger1_timer xTrigger1_timerstatus xTrigger1_state xTrigger2_timer xTrigger2_timerstatus xTrigger2_state');
disp('inputs:  u1');
disp('external_states:  yTrigger1 yTrigger2');
disp('internal_states:  du1 Stufe1 Stufe2 xTrigger1 xTrigger2');
disp('events:  ev_Stufe1_hit_min ev_Stufe1_hit_max ev_Stufe2_hit_min ev_Stufe2_hit_max ev_xTrigger1_pickup_start ev_xTrigger1_pickup_timer ev_xTrigger2_pickup_start ev_xTrigger2_pickup_timer');
disp('parameters:  Ts1 Ts2 df1 df2');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 8');
disp('Number of y = 16');
disp('Number of f = 8');
disp('Number of g = 15');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = Stromrelais_v1([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [8 15 0 [9 10 11 12 13 14 15 16 ]];
return;
elseif flag == 101
res=[8 16 4 8 15];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'Stufe1_state';...
'Stufe2_state';...
'xTrigger1_timer';...
'xTrigger1_timerstatus';...
'xTrigger1_state';...
'xTrigger2_timer';...
'xTrigger2_timerstatus';...
'xTrigger2_state';...
};
algstates = { ... ;
'u1';...
'du1';...
'Stufe1';...
'Stufe2';...
'xTrigger1';...
'xTrigger2';...
'yTrigger1';...
'yTrigger2';...
'ev_Stufe1_hit_min';...
'ev_Stufe1_hit_max';...
'ev_Stufe2_hit_min';...
'ev_Stufe2_hit_max';...
'ev_xTrigger1_pickup_start';...
'ev_xTrigger1_pickup_timer';...
'ev_xTrigger2_pickup_start';...
'ev_xTrigger2_pickup_timer';...
};
parameters = { ... ;
'Ts1';...
'Ts2';...
'df1';...
'df2';...
};
externalstates = { ... ;
'yTrigger1';...
'yTrigger2';...
};
internalstates = { ... ;
'du1';...
'Stufe1';...
'Stufe2';...
'xTrigger1';...
'xTrigger2';...
};
events = { ... ;
'ev_Stufe1_hit_min';...
'ev_Stufe1_hit_max';...
'ev_Stufe2_hit_min';...
'ev_Stufe2_hit_max';...
'ev_xTrigger1_pickup_start';...
'ev_xTrigger1_pickup_timer';...
'ev_xTrigger2_pickup_start';...
'ev_xTrigger2_pickup_timer';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,8);
res.y0=zeros(1,16);
res.p0=zeros(1,4);
res.y0(1) = 1; % u1 
res.y0(2) = 0; % du1 
res.y0(3) = 0; % Stufe1 
res.y0(4) = 0; % Stufe2 
res.y0(5) = 0; % xTrigger1 
res.y0(6) = 0; % xTrigger2 
res.y0(7) = 0; % yTrigger1 
res.y0(8) = 0; % yTrigger2 
res.p0(1) = 2.000000e-01; % Ts1 
res.p0(2) = 2.000000e-01; % Ts2 
res.p0(3) = 9.960000e-01; % df1 
res.p0(4) = 9.940000e-01; % df2 
return;
elseif flag == 110
	res = [1  1  1  1  1  1  1  1];
return;
elseif flag == 111
	res = [-1  1 -1  1  1  1  1  1];
return;
elseif flag == 106
Ts1 = param(1);
Ts2 = param(2);
df1 = param(3);
df2 = param(4);
end
%------- map parameters -------------------
Ts1 = param(1);
Ts2 = param(2);
df1 = param(3);
df2 = param(4);
%------- map x -------------------
Stufe1_state = x(1);
Stufe2_state = x(2);
xTrigger1_timer = x(3);
xTrigger1_timerstatus = x(4);
xTrigger1_state = x(5);
xTrigger2_timer = x(6);
xTrigger2_timerstatus = x(7);
xTrigger2_state = x(8);
%------- map y -------------------
u1 = y(1);
du1 = y(2);
Stufe1 = y(3);
Stufe2 = y(4);
xTrigger1 = y(5);
xTrigger2 = y(6);
yTrigger1 = y(7);
yTrigger2 = y(8);
ev_Stufe1_hit_min = y(9);
ev_Stufe1_hit_max = y(10);
ev_Stufe2_hit_min = y(11);
ev_Stufe2_hit_max = y(12);
ev_xTrigger1_pickup_start = y(13);
ev_xTrigger1_pickup_timer = y(14);
ev_xTrigger2_pickup_start = y(15);
ev_xTrigger2_pickup_timer = y(16);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((du1)-(df1)) < 0 )) 
res(1) = Stufe1_state - 1;
else
res(1) = Stufe1_state;
end
else
res(1) = 0;
end
if ((t < 0 )) 
if ((((du1)-(df2)) < 0 )) 
res(2) = Stufe2_state - 1;
else
res(2) = Stufe2_state;
end
else
res(2) = 0;
end
if ((t < 0 )) 
res(3) = xTrigger1_timer;
else
res(3) = xTrigger1_timerstatus;
end
res(4) = 0;
res(5) = 0;
if ((t < 0 )) 
res(6) = xTrigger2_timer;
else
res(6) = xTrigger2_timerstatus;
end
res(7) = 0;
res(8) = 0;
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((du1)-(df1)) < 0 )) 
res = [res;[1 1 (1)]];
else
res = [res;[1 1 (1)]];
end
else
end
if ((t < 0 )) 
if ((((du1)-(df2)) < 0 )) 
res = [res;[2 2 (1)]];
else
res = [res;[2 2 (1)]];
end
else
end
if ((t < 0 )) 
res = [res;[3 3 (1)]];
else
res = [res;[3 4 (1)]];
end
if ((t < 0 )) 
res = [res;[6 6 (1)]];
else
res = [res;[6 7 (1)]];
end
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
if ((t < 0 )) 
if ((((du1)-(df1)) < 0 )) 
else
end
else
end
if ((t < 0 )) 
if ((((du1)-(df2)) < 0 )) 
else
end
else
end
if ((t < 0 )) 
else
end
if ((t < 0 )) 
else
end
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = Stufe1 - Stufe1_state;
res(2) = Stufe2 - Stufe2_state;
res(3) = ev_xTrigger1_pickup_start - Stufe1 + 1/2;
res(4) = Ts1 + ev_xTrigger1_pickup_timer - xTrigger1_timer;
res(5) = xTrigger1 - Stufe1*xTrigger1_state;
res(6) = ev_xTrigger2_pickup_start - Stufe2 + 1/2;
res(7) = Ts2 + ev_xTrigger2_pickup_timer - xTrigger2_timer;
res(8) = xTrigger2 - Stufe2*xTrigger2_state;

res(9) = du1 - u1;
res(10) = yTrigger1 - xTrigger1;
res(11) = yTrigger2 - xTrigger2;
%--------------------------------------------------------------------------
res(12) = df1 - du1 + ev_Stufe1_hit_min;
res(13) = df1 - du1 + ev_Stufe1_hit_max;
res(14) = df2 - du1 + ev_Stufe2_hit_min;
res(15) = df2 - du1 + ev_Stufe2_hit_max;
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-1)]];
res = [res;[2 2 (-1)]];
res = [res;[4 3 (-1)]];
res = [res;[5 5 (-Stufe1)]];
res = [res;[7 6 (-1)]];
res = [res;[8 8 (-Stufe2)]];

%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 3 (1)]];
res = [res;[2 4 (1)]];
res = [res;[3 3 (-1)]];
res = [res;[3 13 (1)]];
res = [res;[4 14 (1)]];
res = [res;[5 3 (-xTrigger1_state)]];
res = [res;[5 5 (1)]];
res = [res;[6 4 (-1)]];
res = [res;[6 15 (1)]];
res = [res;[7 16 (1)]];
res = [res;[8 4 (-xTrigger2_state)]];
res = [res;[8 6 (1)]];

res = [res;[9 1 (-1)]];
res = [res;[9 2 (1)]];
res = [res;[10 5 (-1)]];
res = [res;[10 7 (1)]];
res = [res;[11 6 (-1)]];
res = [res;[11 8 (1)]];
%--------------------------------------------------------------------------
res = [res;[12 2 (-1)]];
res = [res;[12 9 (1)]];
res = [res;[13 2 (-1)]];
res = [res;[13 10 (1)]];
res = [res;[14 2 (-1)]];
res = [res;[14 11 (1)]];
res = [res;[15 2 (-1)]];
res = [res;[15 12 (1)]];
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
if (ev==1)
res(1) = 1;
end
if (ev==2)
res(1) = 0;
end
if (ev==3)
res(2) = 1;
end
if (ev==4)
res(2) = 0;
end
if (ev==5)
res(3) = 0.0;
res(4) = 1.0;
res(5) = 0.0;
end
if (ev==6)
res(5) = 1.0;
end
if (ev==7)
res(6) = 0.0;
res(7) = 1.0;
res(8) = 0.0;
end
if (ev==8)
res(8) = 1.0;
end
elseif flag == 8
%----- hx 
res = [[1:8];[1:8];ones(1,8)]';
%--------------------------------------------------------------------------
if (ev==1)
end
if (ev==2)
end
if (ev==3)
end
if (ev==4)
end
if (ev==5)
end
if (ev==6)
end
if (ev==7)
end
if (ev==8)
end
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------
if (ev==1)
end
if (ev==2)
end
if (ev==3)
end
if (ev==4)
end
if (ev==5)
end
if (ev==6)
end
if (ev==7)
end
if (ev==8)
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
