%----- Equations f 

function res = MDL_RMS_DQ0_line_RL(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_line_RL');
disp('inputs:  VD1 VQ1 VD2 VQ2');
disp('external_states:  ID1 IQ1 ID2 IQ2');
disp('parameters:  SIDE1_ON R X');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 8');
disp('Number of f = 0');
disp('Number of g = 4');
disp('Number of p = 3');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_line_RL([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 4 0 []];
return;
elseif flag == 101
res=[0 8 3 0 4];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
};
algstates = { ... ;
'VD1';...
'VQ1';...
'VD2';...
'VQ2';...
'ID1';...
'IQ1';...
'ID2';...
'IQ2';...
};
parameters = { ... ;
'SIDE1_ON';...
'R';...
'X';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
'ID2';...
'IQ2';...
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
res.x0=zeros(1,0);
res.y0=zeros(1,8);
res.p0=zeros(1,3);
res.y0(1) = 1; % VD1 
res.y0(3) = 1; % VD2 
res.p0(1) = 1; % SIDE1_ON 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
SIDE1_ON = param(1);
R = param(2);
X = param(3);
end
%------- map parameters -------------------
SIDE1_ON = param(1);
R = param(2);
X = param(3);
%------- map x -------------------
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
VD2 = y(3);
VQ2 = y(4);
ID1 = y(5);
IQ1 = y(6);
ID2 = y(7);
IQ2 = y(8);


if flag == 1
%----- f 
res = empty;
%-----------------------
%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------
%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------
%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
res(1) = SIDE1_ON*(VD1 - VD2 + IQ1*X - ID1*R) - ID1*(SIDE1_ON - 1);
res(2) = - SIDE1_ON*(VQ2 - VQ1 + ID1*X + IQ1*R) - IQ1*(SIDE1_ON - 1);
res(3) = ID1 + ID2;
res(4) = IQ1 + IQ2;
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
res = [res;[1 1 (SIDE1_ON)]];
res = [res;[1 3 (-SIDE1_ON)]];
res = [res;[1 5 (1 - R*SIDE1_ON - SIDE1_ON)]];
res = [res;[1 6 (SIDE1_ON*X)]];
res = [res;[2 2 (SIDE1_ON)]];
res = [res;[2 4 (-SIDE1_ON)]];
res = [res;[2 5 (-SIDE1_ON*X)]];
res = [res;[2 6 (1 - R*SIDE1_ON - SIDE1_ON)]];
res = [res;[3 5 (1)]];
res = [res;[3 7 (1)]];
res = [res;[4 6 (1)]];
res = [res;[4 8 (1)]];
%-----------------------
elseif flag == 7
%----- h 
res = x;
%-----------------------
elseif flag == 8
%----- hx 
res = empty3;
%-----------------------
elseif flag == 9
%----- hy 
res = empty3;
%-----------------------
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
