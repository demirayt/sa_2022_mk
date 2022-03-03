%----- Equations f 

function res = MDL_RMS_DQ0_load_voltage1(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_load_voltage1');
disp('dynamic_states:  V0');
disp('inputs:  VD1 VQ1 VT');
disp('external_states:  ID1 IQ1 P1 Q1');
disp('parameters:  P0 Q0 DP QP alpha beta SIDE1_ON');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 1');
disp('Number of y = 7');
disp('Number of f = 1');
disp('Number of g = 4');
disp('Number of p = 7');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_load_voltage1([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [1 4 0 []];
return;
elseif flag == 101
res=[1 7 7 1 4];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'V0';...
};
algstates = { ... ;
'VD1';...
'VQ1';...
'VT';...
'ID1';...
'IQ1';...
'P1';...
'Q1';...
};
parameters = { ... ;
'P0';...
'Q0';...
'DP';...
'QP';...
'alpha';...
'beta';...
'SIDE1_ON';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
'P1';...
'Q1';...
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
res.y0=zeros(1,7);
res.p0=zeros(1,7);
res.x0(1) = 1; % V0 
res.y0(1) = 1; % VD1 
res.y0(3) = 1; % VT 
res.y0(6) = 1; % P1 
res.p0(1) = 1; % P0 
res.p0(5) = 2; % alpha 
res.p0(6) = 2; % beta 
res.p0(7) = 1; % SIDE1_ON 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
P0 = param(1);
Q0 = param(2);
DP = param(3);
QP = param(4);
alpha = param(5);
beta = param(6);
SIDE1_ON = param(7);
end
%------- map parameters -------------------
P0 = param(1);
Q0 = param(2);
DP = param(3);
QP = param(4);
alpha = param(5);
beta = param(6);
SIDE1_ON = param(7);
%------- map x -------------------
V0 = x(1);
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
VT = y(3);
ID1 = y(4);
IQ1 = y(5);
P1 = y(6);
Q1 = y(7);


if flag == 1
%----- f 
res = empty;
%-----------------------
if  ( t < 0 ) 
res(1) = V0 - VT;
else
res(1) = 0;
end
%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------
if  ( t < 0 ) 
res = [res;[1 1 (1)]];
else
end
%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------
if  ( t < 0 ) 
res = [res;[1 3 (-1)]];
else
end
%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
if  ( t <  0 ) 
res(1) = P0*SIDE1_ON*(DP + 1) - P1;
res(2) = Q0*SIDE1_ON*(QP + 1) - Q1;
else
res(1) = P0*SIDE1_ON*(VT/V0)^alpha*(DP + 1) - P1;
res(2) = Q0*SIDE1_ON*(VT/V0)^beta*(QP + 1) - Q1;
end
res(3) = ID1*VT^2 - Q1*VQ1 - P1*VD1;
res(4) = Q1*VD1 - P1*VQ1 + IQ1*VT^2;


%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
if  ( t <  0 ) 
else
res = [res;[1 1 (-(P0*SIDE1_ON*VT*alpha*(VT/V0)^(alpha - 1)*(DP + 1))/V0^2)]];
res = [res;[2 1 (-(Q0*SIDE1_ON*VT*beta*(VT/V0)^(beta - 1)*(QP + 1))/V0^2)]];
end


%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
if  ( t <  0 ) 
res = [res;[1 6 (-1)]];
res = [res;[2 7 (-1)]];
else
res = [res;[1 3 ((P0*SIDE1_ON*alpha*(VT/V0)^(alpha - 1)*(DP + 1))/V0)]];
res = [res;[1 6 (-1)]];
res = [res;[2 3 ((Q0*SIDE1_ON*beta*(VT/V0)^(beta - 1)*(QP + 1))/V0)]];
res = [res;[2 7 (-1)]];
end
res = [res;[3 1 (-P1)]];
res = [res;[3 2 (-Q1)]];
res = [res;[3 3 (2*ID1*VT)]];
res = [res;[3 4 (VT^2)]];
res = [res;[3 6 (-VD1)]];
res = [res;[3 7 (-VQ1)]];
res = [res;[4 1 (Q1)]];
res = [res;[4 2 (-P1)]];
res = [res;[4 3 (2*IQ1*VT)]];
res = [res;[4 5 (VT^2)]];
res = [res;[4 6 (-VQ1)]];
res = [res;[4 7 (VD1)]];


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
