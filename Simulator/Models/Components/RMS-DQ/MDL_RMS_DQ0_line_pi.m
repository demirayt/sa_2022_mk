%----- Equations f 

function res = MDL_RMS_DQ0_line_pi(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_line_pi');
disp('inputs:  VD1 VQ1 VD2 VQ2');
disp('external_states:  ID1 IQ1 ID2 IQ2');
disp('parameters:  R X B SIDE1_ON SIDE2_ON');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 8');
disp('Number of f = 0');
disp('Number of g = 4');
disp('Number of p = 5');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_line_pi([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 4 0 []];
return;
elseif flag == 101
res=[0 8 5 0 4];
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
'R';...
'X';...
'B';...
'SIDE1_ON';...
'SIDE2_ON';...
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
res.p0=zeros(1,5);
res.y0(1) = 1; % VD1 
res.y0(2) = 0; % VQ1 
res.y0(3) = 1; % VD2 
res.y0(4) = 0; % VQ2 
res.y0(5) = 0; % ID1 
res.y0(6) = 0; % IQ1 
res.y0(7) = 0; % ID2 
res.y0(8) = 0; % IQ2 
res.p0(1) = 0; % R 
res.p0(2) = 0; % X 
res.p0(3) = 0; % B 
res.p0(4) = 1; % SIDE1_ON 
res.p0(5) = 1; % SIDE2_ON 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
R = param(1);
X = param(2);
B = param(3);
SIDE1_ON = param(4);
SIDE2_ON = param(5);
end
%------- map parameters -------------------
R = param(1);
X = param(2);
B = param(3);
SIDE1_ON = param(4);
SIDE2_ON = param(5);
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
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------

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
if (SIDE1_ON > 0.5 & SIDE2_ON > 0.5) 
res(1) = (R*VD2 - R*VD1 - VQ1*X + VQ2*X + ID1*R^2 + ID1*X^2 + B*R^2*VQ1 + B*VQ1*X^2)/(R^2 + X^2);
res(2) = -(R*VQ1 - R*VQ2 - VD1*X + VD2*X - IQ1*R^2 - IQ1*X^2 + B*R^2*VD1 + B*VD1*X^2)/(R^2 + X^2);
res(3) = (R*VD1 - R*VD2 + VQ1*X - VQ2*X + ID2*R^2 + ID2*X^2 + B*R^2*VQ2 + B*VQ2*X^2)/(R^2 + X^2);
res(4) = (R*VQ1 - R*VQ2 - VD1*X + VD2*X + IQ2*R^2 + IQ2*X^2 - B*R^2*VD2 - B*VD2*X^2)/(R^2 + X^2);
else
if (SIDE1_ON > 0.5 & SIDE2_ON < 0.5) 
res(1) = (ID1 + 2*B*VQ1 + B^2*ID1*X^2 + B^3*R^2*VQ1 + B^3*VQ1*X^2 - 2*B*ID1*X - B^2*R*VD1 - 3*B^2*VQ1*X + B^2*ID1*R^2)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1);
res(2) = -(2*B*VD1 - IQ1 - B^2*IQ1*X^2 + B^3*R^2*VD1 + B^3*VD1*X^2 + 2*B*IQ1*X + B^2*R*VQ1 - 3*B^2*VD1*X - B^2*IQ1*R^2)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1);
res(3) = ID2;
res(4) = IQ2;
else
if (SIDE1_ON < 0.5 & SIDE2_ON > 0.5) 
res(1) = ID1;
res(2) = IQ1;
res(3) = (ID2 + 2*B*VQ2 + B^2*ID2*X^2 + B^3*R^2*VQ2 + B^3*VQ2*X^2 - 2*B*ID2*X - B^2*R*VD2 - 3*B^2*VQ2*X + B^2*ID2*R^2)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1);
res(4) = -(2*B*VD2 - IQ2 - B^2*IQ2*X^2 + B^3*R^2*VD2 + B^3*VD2*X^2 + 2*B*IQ2*X + B^2*R*VQ2 - 3*B^2*VD2*X - B^2*IQ2*R^2)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1);
else
res(1) = ID1;
res(2) = IQ1;
res(3) = ID2;
res(4) = IQ2;
end
end
end
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
if (SIDE1_ON > 0.5 & SIDE2_ON > 0.5) 
else
if (SIDE1_ON > 0.5 & SIDE2_ON < 0.5) 
else
if (SIDE1_ON < 0.5 & SIDE2_ON > 0.5) 
else
end
end
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
if (SIDE1_ON > 0.5 & SIDE2_ON > 0.5) 
res = [res;[1 1 (-R/(R^2 + X^2))]];
res = [res;[1 2 ((B*R^2 - X + B*X^2)/(R^2 + X^2))]];
res = [res;[1 3 (R/(R^2 + X^2))]];
res = [res;[1 4 (X/(R^2 + X^2))]];
res = [res;[1 5 (1)]];
res = [res;[2 1 (-(B*R^2 - X + B*X^2)/(R^2 + X^2))]];
res = [res;[2 2 (-R/(R^2 + X^2))]];
res = [res;[2 3 (-X/(R^2 + X^2))]];
res = [res;[2 4 (R/(R^2 + X^2))]];
res = [res;[2 6 (1)]];
res = [res;[3 1 (R/(R^2 + X^2))]];
res = [res;[3 2 (X/(R^2 + X^2))]];
res = [res;[3 3 (-R/(R^2 + X^2))]];
res = [res;[3 4 ((B*R^2 - X + B*X^2)/(R^2 + X^2))]];
res = [res;[3 7 (1)]];
res = [res;[4 1 (-X/(R^2 + X^2))]];
res = [res;[4 2 (R/(R^2 + X^2))]];
res = [res;[4 3 (-(B*R^2 - X + B*X^2)/(R^2 + X^2))]];
res = [res;[4 4 (-R/(R^2 + X^2))]];
res = [res;[4 8 (1)]];
else
if (SIDE1_ON > 0.5 & SIDE2_ON < 0.5) 
res = [res;[1 1 (-(B^2*R)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[1 2 ((B*(B^2*R^2 + B^2*X^2 - 3*B*X + 2))/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[1 5 (1)]];
res = [res;[2 1 (-(B*(B^2*R^2 + B^2*X^2 - 3*B*X + 2))/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[2 2 (-(B^2*R)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[2 6 (1)]];
res = [res;[3 7 (1)]];
res = [res;[4 8 (1)]];
else
if (SIDE1_ON < 0.5 & SIDE2_ON > 0.5) 
res = [res;[1 5 (1)]];
res = [res;[2 6 (1)]];
res = [res;[3 3 (-(B^2*R)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[3 4 ((B*(B^2*R^2 + B^2*X^2 - 3*B*X + 2))/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[3 7 (1)]];
res = [res;[4 3 (-(B*(B^2*R^2 + B^2*X^2 - 3*B*X + 2))/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[4 4 (-(B^2*R)/(B^2*R^2 + B^2*X^2 - 2*B*X + 1))]];
res = [res;[4 8 (1)]];
else
res = [res;[1 5 (1)]];
res = [res;[2 6 (1)]];
res = [res;[3 7 (1)]];
res = [res;[4 8 (1)]];
end
end
end
%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = empty3;
%--------------------------------------------------------------------------
elseif flag == 9
%----- hy 
res = empty3;
%--------------------------------------------------------------------------
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
