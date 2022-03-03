%----- Equations f 

function res = MDL_RMS_DQ0_2PORTY(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_2PORTY');
disp('inputs:  VD1 VQ1 VD2 VQ2');
disp('external_states:  ID1 IQ1 ID2 IQ2');
disp('parameters:  Y11D Y11Q Y12D Y12Q Y21D Y21Q Y22D Y22Q SIDE1_ON SIDE2_ON');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 8');
disp('Number of f = 0');
disp('Number of g = 4');
disp('Number of p = 10');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_2PORTY([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 4 0 []];
return;
elseif flag == 101
res=[0 8 10 0 4];
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
'Y11D';...
'Y11Q';...
'Y12D';...
'Y12Q';...
'Y21D';...
'Y21Q';...
'Y22D';...
'Y22Q';...
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
res.p0=zeros(1,10);
res.y0(1) = 1; % VD1 
res.y0(2) = 0; % VQ1 
res.y0(3) = 1; % VD2 
res.y0(4) = 0; % VQ2 
res.y0(5) = 0; % ID1 
res.y0(6) = 0; % IQ1 
res.y0(7) = 0; % ID2 
res.y0(8) = 0; % IQ2 
res.p0(1) = 0; % Y11D 
res.p0(2) = 0; % Y11Q 
res.p0(3) = 0; % Y12D 
res.p0(4) = 0; % Y12Q 
res.p0(5) = 0; % Y21D 
res.p0(6) = 0; % Y21Q 
res.p0(7) = 0; % Y22D 
res.p0(8) = 0; % Y22Q 
res.p0(9) = 1; % SIDE1_ON 
res.p0(10) = 1; % SIDE2_ON 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
Y11D = param(1);
Y11Q = param(2);
Y12D = param(3);
Y12Q = param(4);
Y21D = param(5);
Y21Q = param(6);
Y22D = param(7);
Y22Q = param(8);
SIDE1_ON = param(9);
SIDE2_ON = param(10);
end
%------- map parameters -------------------
Y11D = param(1);
Y11Q = param(2);
Y12D = param(3);
Y12Q = param(4);
Y21D = param(5);
Y21Q = param(6);
Y22D = param(7);
Y22Q = param(8);
SIDE1_ON = param(9);
SIDE2_ON = param(10);
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
if (SIDE1_ON > 0.5 & SIDE2_ON > 0.5) 
res(1) = ID1 - VD1*Y11D - VD2*Y12D + VQ1*Y11Q + VQ2*Y12Q;
res(2) = IQ1 - VD1*Y11Q - VD2*Y12Q - VQ1*Y11D - VQ2*Y12D;
res(3) = ID2 - VD1*Y21D - VD2*Y22D + VQ1*Y12Q + VQ2*Y22Q;
res(4) = IQ2 - VD1*Y12Q - VD2*Y22Q - VQ1*Y21D - VQ2*Y22D;
else
if (SIDE1_ON > 0.5 & SIDE2_ON < 0.5) 
res(1) = ID1*Y22D - IQ1*Y22Q - VD1*Y11D*Y22D + VD1*Y12D*Y21D + VD1*Y11Q*Y22Q - VD1*Y12Q*Y21Q + VQ1*Y11D*Y22Q - VQ1*Y12D*Y21Q - VQ1*Y21D*Y12Q + VQ1*Y22D*Y11Q;
res(2) = ID1*Y22Q + IQ1*Y22D - VD1*Y11D*Y22Q + VD1*Y12D*Y21Q + VD1*Y21D*Y12Q - VD1*Y22D*Y11Q - VQ1*Y11D*Y22D + VQ1*Y12D*Y21D + VQ1*Y11Q*Y22Q - VQ1*Y12Q*Y21Q;
res(3) = ID2;
res(4) = IQ2;
else
if (SIDE1_ON < 0.5 & SIDE2_ON > 0.5) 
res(1) = ID1;
res(2) = IQ1;
res(3) = ID2*Y11D - IQ2*Y11Q - VD2*Y11D*Y22D + VD2*Y12D*Y21D + VD2*Y11Q*Y22Q - VD2*Y12Q*Y21Q + VQ2*Y11D*Y22Q - VQ2*Y12D*Y21Q - VQ2*Y21D*Y12Q + VQ2*Y22D*Y11Q;
res(4) = ID2*Y11Q + IQ2*Y11D - VD2*Y11D*Y22Q + VD2*Y12D*Y21Q + VD2*Y21D*Y12Q - VD2*Y22D*Y11Q - VQ2*Y11D*Y22D + VQ2*Y12D*Y21D + VQ2*Y11Q*Y22Q - VQ2*Y12Q*Y21Q;
else
res(1) = ID1;
res(2) = IQ1;
res(3) = ID2;
res(4) = IQ2;
end
end
end
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
if (SIDE1_ON > 0.5 & SIDE2_ON > 0.5) 
else
if (SIDE1_ON > 0.5 & SIDE2_ON < 0.5) 
else
if (SIDE1_ON < 0.5 & SIDE2_ON > 0.5) 
else
end
end
end
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
if (SIDE1_ON > 0.5 & SIDE2_ON > 0.5) 
res = [res;[1 1 (-Y11D)]];
res = [res;[1 2 (Y11Q)]];
res = [res;[1 3 (-Y12D)]];
res = [res;[1 4 (Y12Q)]];
res = [res;[1 5 (1)]];
res = [res;[2 1 (-Y11Q)]];
res = [res;[2 2 (-Y11D)]];
res = [res;[2 3 (-Y12Q)]];
res = [res;[2 4 (-Y12D)]];
res = [res;[2 6 (1)]];
res = [res;[3 1 (-Y21D)]];
res = [res;[3 2 (Y12Q)]];
res = [res;[3 3 (-Y22D)]];
res = [res;[3 4 (Y22Q)]];
res = [res;[3 7 (1)]];
res = [res;[4 1 (-Y12Q)]];
res = [res;[4 2 (-Y21D)]];
res = [res;[4 3 (-Y22Q)]];
res = [res;[4 4 (-Y22D)]];
res = [res;[4 8 (1)]];
else
if (SIDE1_ON > 0.5 & SIDE2_ON < 0.5) 
res = [res;[1 1 (Y12D*Y21D - Y11D*Y22D + Y11Q*Y22Q - Y12Q*Y21Q)]];
res = [res;[1 2 (Y11D*Y22Q - Y12D*Y21Q - Y21D*Y12Q + Y22D*Y11Q)]];
res = [res;[1 5 (Y22D)]];
res = [res;[1 6 (-Y22Q)]];
res = [res;[2 1 (Y12D*Y21Q - Y11D*Y22Q + Y21D*Y12Q - Y22D*Y11Q)]];
res = [res;[2 2 (Y12D*Y21D - Y11D*Y22D + Y11Q*Y22Q - Y12Q*Y21Q)]];
res = [res;[2 5 (Y22Q)]];
res = [res;[2 6 (Y22D)]];
res = [res;[3 7 (1)]];
res = [res;[4 8 (1)]];
else
if (SIDE1_ON < 0.5 & SIDE2_ON > 0.5) 
res = [res;[1 5 (1)]];
res = [res;[2 6 (1)]];
res = [res;[3 3 (Y12D*Y21D - Y11D*Y22D + Y11Q*Y22Q - Y12Q*Y21Q)]];
res = [res;[3 4 (Y11D*Y22Q - Y12D*Y21Q - Y21D*Y12Q + Y22D*Y11Q)]];
res = [res;[3 7 (Y11D)]];
res = [res;[3 8 (-Y11Q)]];
res = [res;[4 3 (Y12D*Y21Q - Y11D*Y22Q + Y21D*Y12Q - Y22D*Y11Q)]];
res = [res;[4 4 (Y12D*Y21D - Y11D*Y22D + Y11Q*Y22Q - Y12Q*Y21Q)]];
res = [res;[4 7 (Y11Q)]];
res = [res;[4 8 (Y11D)]];
else
res = [res;[1 5 (1)]];
res = [res;[2 6 (1)]];
res = [res;[3 7 (1)]];
res = [res;[4 8 (1)]];
end
end
end
%-----------------------
elseif flag == 7
%----- h 
res = x;
%-----------------------

%-----------------------
elseif flag == 8
%----- hx 
res = empty3;
%-----------------------

%-----------------------
elseif flag == 9
%----- hy 
res = empty3;
%-----------------------

%-----------------------
elseif flag == 100
x(find(abs(x)<1e-9))=0;
y(find(abs(y)<1e-9))=0;
res = empty;
%-----------------------
%%----- Measurements
elseif flag == 105
elseif flag == 107
res.x0=x;
res.y0=y;
%-----------------------
%-----------------------
end
