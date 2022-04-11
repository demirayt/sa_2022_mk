%----- Equations f 

function res = UDM_TEST_4(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: UDM_TEST_4');
disp('dynamic_states:  dPloss Counter1 Counter2 Counter3 Counter4 CounterStatus1 CounterStatus2 CounterStatus3 CounterStatus4');
disp('inputs:  u1');
disp('external_states:  y2');
disp('internal_states:  du1');
disp('events:  ev_Stufe1 ev_Stufe2 ev_Stufe1n ev_Stufe2n ev_Zeit1 ev_Zeit2 ev_Stufe3 ev_Stufe3n ev_Zeit3 ev_Stufe4 ev_Stufe4n ev_Zeit4');
disp('parameters:  Ts1 Ts2 df1 df2');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 9');
disp('Number of y = 15');
disp('Number of f = 9');
disp('Number of g = 14');
disp('Number of p = 4');
disp(' ');
disp(' ');
disp(' ');
res1 = UDM_TEST_4([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [9 14 0 [4 5 6 7 8 9 10 11 12 13 14 15 ]];
return;
elseif flag == 101
res=[9 15 4 9 14];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dPloss';...
'Counter1';...
'Counter2';...
'Counter3';...
'Counter4';...
'CounterStatus1';...
'CounterStatus2';...
'CounterStatus3';...
'CounterStatus4';...
};
algstates = { ... ;
'u1';...
'du1';...
'y2';...
'ev_Stufe1';...
'ev_Stufe2';...
'ev_Stufe1n';...
'ev_Stufe2n';...
'ev_Zeit1';...
'ev_Zeit2';...
'ev_Stufe3';...
'ev_Stufe3n';...
'ev_Zeit3';...
'ev_Stufe4';...
'ev_Stufe4n';...
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
'ev_Stufe1n';...
'ev_Stufe2n';...
'ev_Zeit1';...
'ev_Zeit2';...
'ev_Stufe3';...
'ev_Stufe3n';...
'ev_Zeit3';...
'ev_Stufe4';...
'ev_Stufe4n';...
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
res.y0=zeros(1,15);
res.p0=zeros(1,4);
res.x0(1) = 0; % dPloss 
res.x0(2) = 0; % Counter1 
res.x0(3) = 0; % Counter2 
res.x0(4) = 0; % Counter3 
res.x0(5) = 0; % Counter4 
res.x0(6) = 0; % CounterStatus1 
res.x0(7) = 0; % CounterStatus2 
res.x0(8) = 0; % CounterStatus3 
res.x0(9) = 0; % CounterStatus4 
res.y0(1) = 1; % u1 
res.y0(2) = 0; % du1 
res.y0(3) = 0; % y2 
res.y0(4) = 0; % ev_Stufe1 
res.y0(5) = 0; % ev_Stufe2 
res.y0(6) = 0; % ev_Stufe1n 
res.y0(7) = 0; % ev_Stufe2n 
res.y0(8) = 0; % ev_Zeit1 
res.y0(9) = 0; % ev_Zeit2 
res.y0(10) = 0; % ev_Stufe3 
res.y0(11) = 0; % ev_Stufe3n 
res.y0(12) = 0; % ev_Zeit3 
res.y0(13) = 0; % ev_Stufe4 
res.y0(14) = 0; % ev_Stufe4n 
res.y0(15) = 0; % ev_Zeit4 
res.p0(1) = 2.000000e-01; % Ts1 
res.p0(2) = 2.000000e-01; % Ts2 
res.p0(3) = 2.000000e-01; % df1 
res.p0(4) = 4.000000e-01; % df2 
return;
elseif flag == 110
	res = [1  1  1  1  1  1  1  1  1  1  1  1];
return;
elseif flag == 111
	res = [1  1 -1 -1  1  1 -1  1  1 -1  1  1];
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
Counter3 = x(4);
Counter4 = x(5);
CounterStatus1 = x(6);
CounterStatus2 = x(7);
CounterStatus3 = x(8);
CounterStatus4 = x(9);
%------- map y -------------------
u1 = y(1);
du1 = y(2);
y2 = y(3);
ev_Stufe1 = y(4);
ev_Stufe2 = y(5);
ev_Stufe1n = y(6);
ev_Stufe2n = y(7);
ev_Zeit1 = y(8);
ev_Zeit2 = y(9);
ev_Stufe3 = y(10);
ev_Stufe3n = y(11);
ev_Zeit3 = y(12);
ev_Stufe4 = y(13);
ev_Stufe4n = y(14);
ev_Zeit4 = y(15);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
res(1) = 0;
res(6) = 0;
res(2) = CounterStatus1;
res(7) = 0;
res(3) = CounterStatus2;
res(8) = 0;
res(4) = CounterStatus3;
res(9) = 0;
res(5) = CounterStatus4;

%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[2 6 (1)]];
res = [res;[3 7 (1)]];
res = [res;[4 8 (1)]];
res = [res;[5 9 (1)]];

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
res(1) = df1 - du1 + ev_Stufe1;
res(2) = df2 - du1 + ev_Stufe2;
res(3) = df1 - du1 + ev_Stufe3;
res(4) = df2 - du1 + ev_Stufe4;
res(5) = ev_Stufe1n - du1 - df1;
res(6) = ev_Stufe2n - du1 - df2;
res(7) = ev_Stufe3n - du1 - df1;
res(8) = ev_Stufe4n - du1 - df2;
res(9) = ev_Zeit1 - CounterStatus1 - CounterStatus1*(Counter1 - Ts1) + 1;
res(10) = ev_Zeit2 - CounterStatus2 - CounterStatus2*(Counter2 - Ts2) + 1;
res(11) = ev_Zeit3 - CounterStatus3 - CounterStatus3*(Counter3 - Ts1) + 1;
res(12) = ev_Zeit4 - CounterStatus4 - CounterStatus4*(Counter4 - Ts2) + 1;

res(13) = du1 - u1 + 1;

res(14) = y2 - dPloss;

%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[9 2 (-CounterStatus1)]];
res = [res;[9 6 (Ts1 - Counter1 - 1)]];
res = [res;[10 3 (-CounterStatus2)]];
res = [res;[10 7 (Ts2 - Counter2 - 1)]];
res = [res;[11 4 (-CounterStatus3)]];
res = [res;[11 8 (Ts1 - Counter3 - 1)]];
res = [res;[12 5 (-CounterStatus4)]];
res = [res;[12 9 (Ts2 - Counter4 - 1)]];


res = [res;[14 1 (-1)]];

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
res = [res;[3 10 (1)]];
res = [res;[4 2 (-1)]];
res = [res;[4 13 (1)]];
res = [res;[5 2 (-1)]];
res = [res;[5 6 (1)]];
res = [res;[6 2 (-1)]];
res = [res;[6 7 (1)]];
res = [res;[7 2 (-1)]];
res = [res;[7 11 (1)]];
res = [res;[8 2 (-1)]];
res = [res;[8 14 (1)]];
res = [res;[9 8 (1)]];
res = [res;[10 9 (1)]];
res = [res;[11 12 (1)]];
res = [res;[12 15 (1)]];

res = [res;[13 1 (-1)]];
res = [res;[13 2 (1)]];

res = [res;[14 3 (1)]];

%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
if (ev==1)
res(2) = 0;
res(6) = 1;
end
if (ev==3)
res(2) = 0;
res(6) = 1;
end
if (ev==5)
res(2) = 0;
res(6) = 0;
res(1) = dPloss + 1/20;
end
if (ev==2)
res(3) = 0;
res(7) = 1;
end
if (ev==4)
res(3) = 0;
res(7) = 1;
end
if (ev==6)
res(3) = 0;
res(7) = 0;
res(1) = dPloss + 1/10;
end
if (ev==7)
res(4) = 0;
res(8) = 1;
end
if (ev==8)
res(4) = 0;
res(8) = 1;
end
if (ev==9)
res(4) = 0;
res(8) = 0;
res(1) = dPloss - 1/20;
end
if (ev==10)
res(5) = 0;
res(9) = 1;
end
if (ev==11)
res(5) = 0;
res(9) = 1;
end
if (ev==12)
res(5) = 0;
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
end
if (ev==5)
res = [res;[1 1 (1)]];
end
if (ev==2)
end
if (ev==4)
end
if (ev==6)
res = [res;[1 1 (1)]];
end
if (ev==7)
end
if (ev==8)
end
if (ev==9)
res = [res;[1 1 (1)]];
end
if (ev==10)
end
if (ev==11)
end
if (ev==12)
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
if (ev==5)
end
if (ev==2)
end
if (ev==4)
end
if (ev==6)
end
if (ev==7)
end
if (ev==8)
end
if (ev==9)
end
if (ev==10)
end
if (ev==11)
end
if (ev==12)
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
