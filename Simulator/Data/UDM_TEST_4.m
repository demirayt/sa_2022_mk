%----- Equations f 

function res = UDM_TEST_4(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: UDM_TEST_4');
disp('dynamic_states:  dPloss Counter1 Counter2 CounterStatus1 CounterStatus2 Counter3 Counter4 CounterStatus3 CounterStatus4');
disp('inputs:  u1');
disp('external_states:  y2');
disp('internal_states:  du1');
disp('events:  ev_Stufe1 ev_Stufe2 ev_Zeit1 ev_Zeit2 ev_Stufe3 ev_Stufe4 ev_Zeit3 ev_Zeit4');
disp('parameters:  Ts1 Ts2 df1 df2');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 9');
disp('Number of y = 11');
disp('Number of f = 9');
disp('Number of g = 10');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = UDM_TEST_4([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [9 10 0 [4 5 6 7 8 9 10 11 ]];
return;
elseif flag == 101
res=[9 11 4 9 10];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dPloss';...
'Counter1';...
'Counter2';...
'CounterStatus1';...
'CounterStatus2';...
'Counter3';...
'Counter4';...
'CounterStatus3';...
'CounterStatus4';...
};
algstates = { ... ;
'u1';...
'du1';...
'y2';...
'ev_Stufe1';...
'ev_Stufe2';...
'ev_Zeit1';...
'ev_Zeit2';...
'ev_Stufe3';...
'ev_Stufe4';...
'ev_Zeit3';...
'ev_Zeit4';...
};
parameters = { ... ;
'Ts1';...
'Ts2';...
'df1';...
'df2';...
};
externalstates = { ... ;
'y2';...
};
internalstates = { ... ;
'du1';...
};
events = { ... ;
'ev_Stufe1';...
'ev_Stufe2';...
'ev_Zeit1';...
'ev_Zeit2';...
'ev_Stufe3';...
'ev_Stufe4';...
'ev_Zeit3';...
'ev_Zeit4';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,9);
res.y0=zeros(1,11);
res.p0=zeros(1,4);
res.x0(1) = 0; % dPloss 
res.x0(2) = 0; % Counter1 
res.x0(3) = 0; % Counter2 
res.x0(4) = 0; % CounterStatus1 
res.x0(5) = 0; % CounterStatus2 
res.x0(6) = 0; % Counter3 
res.x0(7) = 0; % Counter4 
res.x0(8) = 0; % CounterStatus3 
res.x0(9) = 0; % CounterStatus4 
res.y0(1) = 1; % u1 
res.y0(2) = 0; % du1 
res.y0(3) = 0; % y2 
res.y0(4) = 0; % ev_Stufe1 
res.y0(5) = 0; % ev_Stufe2 
res.y0(6) = 0; % ev_Zeit1 
res.y0(7) = 0; % ev_Zeit2 
res.y0(8) = 0; % ev_Stufe3 
res.y0(9) = 0; % ev_Stufe4 
res.y0(10) = 0; % ev_Zeit3 
res.y0(11) = 0; % ev_Zeit4 
res.p0(1) = 2.000000e-01; % Ts1 
res.p0(2) = 2.000000e-01; % Ts2 
res.p0(3) = 2.000000e-01; % df1 
res.p0(4) = 4.000000e-01; % df2 
return;
elseif flag == 110
	res = [1  1  1  1  1  1  1  1];
return;
elseif flag == 111
	res = [-1 -1  1  1  1  1  1  1];
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
dPloss = x(1);
Counter1 = x(2);
Counter2 = x(3);
CounterStatus1 = x(4);
CounterStatus2 = x(5);
Counter3 = x(6);
Counter4 = x(7);
CounterStatus3 = x(8);
CounterStatus4 = x(9);
%------- map y -------------------
u1 = y(1);
du1 = y(2);
y2 = y(3);
ev_Stufe1 = y(4);
ev_Stufe2 = y(5);
ev_Zeit1 = y(6);
ev_Zeit2 = y(7);
ev_Stufe3 = y(8);
ev_Stufe4 = y(9);
ev_Zeit3 = y(10);
ev_Zeit4 = y(11);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
res(1) = 0;
res(4) = 0;
res(2) = CounterStatus1;
res(5) = 0;
res(3) = CounterStatus2;
res(8) = 0;
res(6) = CounterStatus3;
res(9) = 0;
res(7) = CounterStatus4;

%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[2 4 (1)]];
res = [res;[3 5 (1)]];
res = [res;[6 8 (1)]];
res = [res;[7 9 (1)]];

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
res(3) = df2 - du1 + ev_Stufe3;
res(4) = df1 - du1 + ev_Stufe4;
res(5) = Ts1 - Counter1 + ev_Zeit1;
res(6) = Ts2 - Counter2 + ev_Zeit2;
res(7) = Ts2 - Counter3 + ev_Zeit3;
res(8) = Ts1 - Counter4 + ev_Zeit4;

res(9) = du1 - u1;

res(10) = y2 - dPloss;

%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[5 2 (-1)]];
res = [res;[6 3 (-1)]];
res = [res;[7 6 (-1)]];
res = [res;[8 7 (-1)]];


res = [res;[10 1 (-1)]];

%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 2 (-1)]];
res = [res;[1 4 (1)]];
res = [res;[2 2 (-1)]];
res = [res;[2 5 (1)]];
res = [res;[3 2 (-1)]];
res = [res;[3 8 (1)]];
res = [res;[4 2 (-1)]];
res = [res;[4 9 (1)]];
res = [res;[5 6 (1)]];
res = [res;[6 7 (1)]];
res = [res;[7 10 (1)]];
res = [res;[8 11 (1)]];

res = [res;[9 1 (-1)]];
res = [res;[9 2 (1)]];

res = [res;[10 3 (1)]];

%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
if (ev==1)
res(2) = 0;
res(4) = 1;
end
if (ev==3)
res(2) = 0;
res(4) = 0;
res(1) = dPloss + 1/20;
end
if (ev==2)
res(3) = 0;
res(5) = 1;
end
if (ev==4)
res(3) = 0;
res(5) = 0;
res(1) = dPloss + 1/10;
end
if (ev==5)
res(6) = 0;
res(8) = 1;
end
if (ev==7)
res(6) = 0;
res(8) = 0;
res(1) = dPloss - 1/20;
end
if (ev==6)
res(7) = 0;
res(9) = 1;
end
if (ev==8)
res(7) = 0;
res(9) = 0;
res(1) = dPloss - 1/10;
end
elseif flag == 8
%----- hx 
res = [[1:9];[1:9];ones(1,9)]';
%--------------------------------------------------------------------------
if (ev==1)
end
if (ev==3)
res = [res;[1 1 (1)]];
end
if (ev==2)
end
if (ev==4)
res = [res;[1 1 (1)]];
end
if (ev==5)
end
if (ev==7)
res = [res;[1 1 (1)]];
end
if (ev==6)
end
if (ev==8)
res = [res;[1 1 (1)]];
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
if (ev==5)
end
if (ev==7)
end
if (ev==6)
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
