%----- Equations f 

function res = MDL_RMS_DQ0_feeder(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_feeder');
disp('dynamic_states:  ED0 EQ0');
disp('inputs:  VD1 VQ1');
disp('external_states:  ID1 IQ1');
disp('internal_states:  P1 Q1');
disp('parameters:  Vmag0 Vang0 R X P0 Q0 LFTYPE SIDE1_ON VFACTOR IDEAL');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 2');
disp('Number of y = 6');
disp('Number of f = 2');
disp('Number of g = 4');
disp('Number of p = 10');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_feeder([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [2 4 0 []];
return;
elseif flag == 101
res=[2 6 10 2 4];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'ED0';...
'EQ0';...
};
algstates = { ... ;
'VD1';...
'VQ1';...
'ID1';...
'IQ1';...
'P1';...
'Q1';...
};
parameters = { ... ;
'Vmag0';...
'Vang0';...
'R';...
'X';...
'P0';...
'Q0';...
'LFTYPE';...
'SIDE1_ON';...
'VFACTOR';...
'IDEAL';...
};
externalstates = { ... ;
'ID1';...
'IQ1';...
};
internalstates = { ... ;
'P1';...
'Q1';...
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
res.x0=zeros(1,2);
res.y0=zeros(1,6);
res.p0=zeros(1,10);
res.y0(1) = 1; % VD1 
res.p0(1) = 1; % Vmag0 
res.p0(8) = 1; % SIDE1_ON 
res.p0(9) = 1; % VFACTOR 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
Vmag0 = param(1);
Vang0 = param(2);
R = param(3);
X = param(4);
P0 = param(5);
Q0 = param(6);
LFTYPE = param(7);
SIDE1_ON = param(8);
VFACTOR = param(9);
IDEAL = param(10);
end
%------- map parameters -------------------
Vmag0 = param(1);
Vang0 = param(2);
R = param(3);
X = param(4);
P0 = param(5);
Q0 = param(6);
LFTYPE = param(7);
SIDE1_ON = param(8);
VFACTOR = param(9);
IDEAL = param(10);
%------- map x -------------------
ED0 = x(1);
EQ0 = x(2);
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
ID1 = y(3);
IQ1 = y(4);
P1 = y(5);
Q1 = y(6);


if flag == 1
%----- f 
res = empty;
%--------------------------------------------------------------------------
if  ( t < 0 ) 
    if  ( LFTYPE < 0.5 ) 
res(1) = VD1 - Vmag0*cos((Vang0*pi)/180);
res(2) = VQ1 - Vmag0*sin((Vang0*pi)/180);
    else
res(1) = P1 - P0;
res(2) = Q1 - Q0;
    end
else
res(1) = 0;
res(2) = 0;
end
%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
if  ( t < 0 ) 
    if  ( LFTYPE < 0.5 ) 
    else
    end
else
end
%--------------------------------------------------------------------------
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------
if  ( t < 0 ) 
    if  ( LFTYPE < 0.5 ) 
res = [res;[1 1 (1)]];
res = [res;[2 2 (1)]];
    else
res = [res;[1 5 (1)]];
res = [res;[2 6 (1)]];
    end
else
end
%--------------------------------------------------------------------------
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
if  ( IDEAL < 0.5 ) 
res(1) = (SIDE1_ON*(R*VD1 + VQ1*X - ED0*R*VFACTOR - EQ0*VFACTOR*X))/(R^2 + X^2) - ID1;
res(2) = (SIDE1_ON*(R*VQ1 - VD1*X - EQ0*R*VFACTOR + ED0*VFACTOR*X))/(R^2 + X^2) - IQ1;
else
res(1) = SIDE1_ON*(VD1 - ED0*VFACTOR) - ID1*(SIDE1_ON - 1);
res(2) = SIDE1_ON*(VQ1 - EQ0*VFACTOR) - IQ1*(SIDE1_ON - 1);
end
res(3) = P1 - ID1*VD1 - IQ1*VQ1;
res(4) = Q1 - ID1*VQ1 + IQ1*VD1;
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
if  ( IDEAL < 0.5 ) 
res = [res;[1 1 (-(R*SIDE1_ON*VFACTOR)/(R^2 + X^2))]];
res = [res;[1 2 (-(SIDE1_ON*VFACTOR*X)/(R^2 + X^2))]];
res = [res;[2 1 ((SIDE1_ON*VFACTOR*X)/(R^2 + X^2))]];
res = [res;[2 2 (-(R*SIDE1_ON*VFACTOR)/(R^2 + X^2))]];
else
res = [res;[1 1 (-SIDE1_ON*VFACTOR)]];
res = [res;[2 2 (-SIDE1_ON*VFACTOR)]];
end
%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
if  ( IDEAL < 0.5 ) 
res = [res;[1 1 ((R*SIDE1_ON)/(R^2 + X^2))]];
res = [res;[1 2 ((SIDE1_ON*X)/(R^2 + X^2))]];
res = [res;[1 3 (-1)]];
res = [res;[2 1 (-(SIDE1_ON*X)/(R^2 + X^2))]];
res = [res;[2 2 ((R*SIDE1_ON)/(R^2 + X^2))]];
res = [res;[2 4 (-1)]];
else
res = [res;[1 1 (SIDE1_ON)]];
res = [res;[1 3 (1 - SIDE1_ON)]];
res = [res;[2 2 (SIDE1_ON)]];
res = [res;[2 4 (1 - SIDE1_ON)]];
end
res = [res;[3 1 (-ID1)]];
res = [res;[3 2 (-IQ1)]];
res = [res;[3 3 (-VD1)]];
res = [res;[3 4 (-VQ1)]];
res = [res;[3 5 (1)]];
res = [res;[4 1 (IQ1)]];
res = [res;[4 2 (-ID1)]];
res = [res;[4 3 (-VQ1)]];
res = [res;[4 4 (VD1)]];
res = [res;[4 6 (1)]];
%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:2];[1:2];ones(1,2)]';
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
