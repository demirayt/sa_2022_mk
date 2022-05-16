%----- Equations f 

function res = UDM_TEST_6(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: UDM_TEST_6');
disp('dynamic_states:  xTrigger1 xTrigger2 Counter1 Counter2 CounterStatus1 CounterStatus2');
disp('inputs:  u1');
disp('external_states:  yTrigger1 yTrigger2');
disp('internal_states:  du1');
disp('events:  ev_Stufe1 ev_Stufe2 ev_Zeit1 ev_Zeit2');
disp('parameters:  Ts1 Ts2 df1 df2');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 6');
disp('Number of y = 8');
disp('Number of f = 6');
disp('Number of g = 7');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = UDM_TEST_6([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [6 7 0 [5 6 7 8 ]];
return;
elseif flag == 101
res=[6 8 4 6 7];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'xTrigger1';...
'xTrigger2';...
'Counter1';...
'Counter2';...
'CounterStatus1';...
'CounterStatus2';...
};
algstates = { ... ;
'u1';...
'du1';...
'yTrigger1';...
'yTrigger2';...
'ev_Stufe1';...
'ev_Stufe2';...
'ev_Zeit1';...
'ev_Zeit2';...
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
};
events = { ... ;
'ev_Stufe1';...
'ev_Stufe2';...
'ev_Zeit1';...
'ev_Zeit2';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,6);
res.y0=zeros(1,8);
res.p0=zeros(1,4);
res.x0(1) = 0; % xTrigger1 
res.x0(2) = 0; % xTrigger2 
res.x0(3) = 0; % Counter1 
res.x0(4) = 0; % Counter2 
res.x0(5) = 0; % CounterStatus1 
res.x0(6) = 0; % CounterStatus2 
res.y0(1) = 1; % u1 
res.y0(2) = 0; % du1 
res.y0(3) = 0; % yTrigger1 
res.y0(4) = 0; % yTrigger2 
res.y0(5) = 0; % ev_Stufe1 
res.y0(6) = 0; % ev_Stufe2 
res.y0(7) = 0; % ev_Zeit1 
res.y0(8) = 0; % ev_Zeit2 
res.p0(1) = 2.000000e-01; % Ts1 
res.p0(2) = 2.000000e-01; % Ts2 
res.p0(3) = 9.960000e-01; % df1 
res.p0(4) = 9.940000e-01; % df2 
return;
elseif flag == 110
	res = [1  1  1  1];
return;
elseif flag == 111
	res = [-1 -1  1  1];
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
xTrigger1 = x(1);
xTrigger2 = x(2);
Counter1 = x(3);
Counter2 = x(4);
CounterStatus1 = x(5);
CounterStatus2 = x(6);
%------- map y -------------------
u1 = y(1);
du1 = y(2);
yTrigger1 = y(3);
yTrigger2 = y(4);
ev_Stufe1 = y(5);
ev_Stufe2 = y(6);
ev_Zeit1 = y(7);
ev_Zeit2 = y(8);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
res(1) = 0;
res(2) = 0;
res(5) = 0;
res(3) = CounterStatus1;
res(6) = 0;
res(4) = CounterStatus2;

%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[3 5 (1)]];
res = [res;[4 6 (1)]];

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
res(1) = df2 - du1 + ev_Stufe1;
res(2) = df1 - du1 + ev_Stufe2;
res(3) = Ts1 - Counter1 + ev_Zeit1;
res(4) = Ts2 - Counter2 + ev_Zeit2;

res(5) = du1 - u1;


res(6) = yTrigger1 - xTrigger1;
res(7) = yTrigger2 - xTrigger2;

%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[3 3 (-1)]];
res = [res;[4 4 (-1)]];



res = [res;[6 1 (-1)]];
res = [res;[7 2 (-1)]];

%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 2 (-1)]];
res = [res;[1 5 (1)]];
res = [res;[2 2 (-1)]];
res = [res;[2 6 (1)]];
res = [res;[3 7 (1)]];
res = [res;[4 8 (1)]];

res = [res;[5 1 (-1)]];
res = [res;[5 2 (1)]];


res = [res;[6 3 (1)]];
res = [res;[7 4 (1)]];

%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
if (ev==1)
res(3) = 0;
res(5) = 1;
end
if (ev==3)
res(3) = 0;
res(5) = 0;
res(1) = 1;
end
if (ev==2)
res(4) = 0;
res(6) = 1;
end
if (ev==4)
res(4) = 0;
res(6) = 0;
res(2) = 1;
end
elseif flag == 8
%----- hx 
res = [[1:6];[1:6];ones(1,6)]';
%--------------------------------------------------------------------------
if (ev==1)
end
if (ev==3)
end
if (ev==2)
end
if (ev==4)
end
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------
if (ev==1)
end
if (ev==3)
end
if (ev==2)
end
if (ev==4)
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
