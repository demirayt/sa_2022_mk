%----- Equations f 

function res = MDL_RMS_DQ0_voltage_source(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_RMS_DQ0_voltage_source');
disp('dynamic_states:  ED EQ xP0 xQ0 xV0');
disp('inputs:  VD1 VQ1 VT');
disp('external_states:  ID1 IQ1');
disp('internal_states:  P1 Q1');
disp('parameters:  V0 Vang0 P0 Q0 R X w0 Zbase kappa eta alpha LFTYPE SIDE1_ON');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 5');
disp('Number of y = 7');
disp('Number of f = 5');
disp('Number of g = 4');
disp('Number of p = 13');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_RMS_DQ0_voltage_source([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [5 4 0 []];
return;
elseif flag == 101
res=[5 7 13 5 4];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'ED';...
'EQ';...
'xP0';...
'xQ0';...
'xV0';...
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
'V0';...
'Vang0';...
'P0';...
'Q0';...
'R';...
'X';...
'w0';...
'Zbase';...
'kappa';...
'eta';...
'alpha';...
'LFTYPE';...
'SIDE1_ON';...
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
res.x0=zeros(1,5);
res.y0=zeros(1,7);
res.p0=zeros(1,13);
res.x0(1) = 1; % ED 
res.x0(5) = 1; % xV0 
res.y0(1) = 1; % VD1 
res.p0(1) = 1; % V0 
res.p0(13) = 1; % SIDE1_ON 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
V0 = param(1);
Vang0 = param(2);
P0 = param(3);
Q0 = param(4);
R = param(5);
X = param(6);
w0 = param(7);
Zbase = param(8);
kappa = param(9);
eta = param(10);
alpha = param(11);
LFTYPE = param(12);
SIDE1_ON = param(13);
end
%------- map parameters -------------------
V0 = param(1);
Vang0 = param(2);
P0 = param(3);
Q0 = param(4);
R = param(5);
X = param(6);
w0 = param(7);
Zbase = param(8);
kappa = param(9);
eta = param(10);
alpha = param(11);
LFTYPE = param(12);
SIDE1_ON = param(13);
%------- map x -------------------
ED = x(1);
EQ = x(2);
xP0 = x(3);
xQ0 = x(4);
xV0 = x(5);
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
%--------------------------------------------------------------------------
if  ( t < 0 ) 
res(3) = xP0 - P1;
res(4) = xQ0 - Q1;
res(5) = xV0 - VT;
   if  ( abs(LFTYPE-1.0*(3))<1e-9 ) 
res(2) = EQ;
res(1) = VT - V0;
   else
       if  ( abs(LFTYPE-1.0*(2))<1e-9 ) 
res(2) = P1 - P0;
res(1) = VT - V0;
       else
res(2) = P1 - P0;
res(1) = Q1 - Q0;
       end
   end
else
res(3) = 0;
res(4) = 0;
res(5) = 0;
   if  ( abs(LFTYPE-1.0*(3))<1e-9 ) 
res(1) = eta*((VD1*((xP0*cos(kappa))/V0^2 + (xQ0*sin(kappa))/V0^2) + VQ1*((xQ0*cos(kappa))/V0^2 - (xP0*sin(kappa))/V0^2))/Zbase + (ID1*cos(kappa) - IQ1*sin(kappa))/Zbase + (VD1*alpha*(V0^2 - VT^2))/V0^2);
res(2) = eta*((IQ1*cos(kappa) + ID1*sin(kappa))/Zbase - (VD1*((xQ0*cos(kappa))/V0^2 - (xP0*sin(kappa))/V0^2) - VQ1*((xP0*cos(kappa))/V0^2 + (xQ0*sin(kappa))/V0^2))/Zbase + (VQ1*alpha*(V0^2 - VT^2))/V0^2);
   else
       if  ( abs(LFTYPE-1.0*(2))<1e-9 ) 
res(1) = eta*((ID1*cos(kappa) - IQ1*sin(kappa))/Zbase + (VD1*((P0*cos(kappa))/V0^2 + (xQ0*sin(kappa))/V0^2) - VQ1*((P0*sin(kappa))/V0^2 - (xQ0*cos(kappa))/V0^2))/Zbase + (VD1*alpha*(V0^2 - VT^2))/V0^2);
res(2) = eta*((IQ1*cos(kappa) + ID1*sin(kappa))/Zbase + (VD1*((P0*sin(kappa))/V0^2 - (xQ0*cos(kappa))/V0^2) + VQ1*((P0*cos(kappa))/V0^2 + (xQ0*sin(kappa))/V0^2))/Zbase + (VQ1*alpha*(V0^2 - VT^2))/V0^2);
       else
res(1) = eta*((VD1*((P0*cos(kappa))/xV0^2 + (Q0*sin(kappa))/xV0^2) + VQ1*((Q0*cos(kappa))/xV0^2 - (P0*sin(kappa))/xV0^2))/Zbase + (ID1*cos(kappa) - IQ1*sin(kappa))/Zbase - (VD1*alpha*(VT^2 - xV0^2))/xV0^2);
res(2) = -eta*((VD1*((Q0*cos(kappa))/xV0^2 - (P0*sin(kappa))/xV0^2) - VQ1*((P0*cos(kappa))/xV0^2 + (Q0*sin(kappa))/xV0^2))/Zbase - (IQ1*cos(kappa) + ID1*sin(kappa))/Zbase + (VQ1*alpha*(VT^2 - xV0^2))/xV0^2);
       end
   end

end




%--------------------------------------------------------------------------
elseif flag == 2
%----- fx 
res = empty3;
%--------------------------------------------------------------------------
if  ( t < 0 ) 
res = [res;[3 3 (1)]];
res = [res;[4 4 (1)]];
res = [res;[5 5 (1)]];
   if  ( abs(LFTYPE-1.0*(3))<1e-9 ) 
res = [res;[2 2 (1)]];
   else
       if  ( abs(LFTYPE-1.0*(2))<1e-9 ) 
       else
       end
   end
else
   if  ( abs(LFTYPE-1.0*(3))<1e-9 ) 
res = [res;[1 3 ((eta*(VD1*cos(kappa) - VQ1*sin(kappa)))/(V0^2*Zbase))]];
res = [res;[1 4 ((eta*(VQ1*cos(kappa) + VD1*sin(kappa)))/(V0^2*Zbase))]];
res = [res;[2 3 ((eta*(VQ1*cos(kappa) + VD1*sin(kappa)))/(V0^2*Zbase))]];
res = [res;[2 4 (-(eta*(VD1*cos(kappa) - VQ1*sin(kappa)))/(V0^2*Zbase))]];
   else
       if  ( abs(LFTYPE-1.0*(2))<1e-9 ) 
res = [res;[1 4 ((eta*(VQ1*cos(kappa) + VD1*sin(kappa)))/(V0^2*Zbase))]];
res = [res;[2 4 (-(eta*(VD1*cos(kappa) - VQ1*sin(kappa)))/(V0^2*Zbase))]];
       else
res = [res;[1 5 (-(2*eta*(P0*VD1*cos(kappa) + Q0*VQ1*cos(kappa) - P0*VQ1*sin(kappa) + Q0*VD1*sin(kappa) - VD1*VT^2*Zbase*alpha))/(Zbase*xV0^3))]];
res = [res;[2 5 (-(2*eta*(P0*VQ1*cos(kappa) - Q0*VD1*cos(kappa) + P0*VD1*sin(kappa) + Q0*VQ1*sin(kappa) - VQ1*VT^2*Zbase*alpha))/(Zbase*xV0^3))]];
       end
   end

end




%--------------------------------------------------------------------------
elseif flag == 3
%----- fy 
res = empty3;
%--------------------------------------------------------------------------
if  ( t < 0 ) 
res = [res;[3 6 (-1)]];
res = [res;[4 7 (-1)]];
res = [res;[5 3 (-1)]];
   if  ( abs(LFTYPE-1.0*(3))<1e-9 ) 
res = [res;[1 3 (1)]];
   else
       if  ( abs(LFTYPE-1.0*(2))<1e-9 ) 
res = [res;[2 6 (1)]];
res = [res;[1 3 (1)]];
       else
res = [res;[2 6 (1)]];
res = [res;[1 7 (1)]];
       end
   end
else
   if  ( abs(LFTYPE-1.0*(3))<1e-9 ) 
res = [res;[1 1 ((eta*(xP0*cos(kappa) + xQ0*sin(kappa) + V0^2*Zbase*alpha - VT^2*Zbase*alpha))/(V0^2*Zbase))]];
res = [res;[1 2 ((eta*(xQ0*cos(kappa) - xP0*sin(kappa)))/(V0^2*Zbase))]];
res = [res;[1 3 (-(2*VD1*VT*alpha*eta)/V0^2)]];
res = [res;[1 4 ((eta*cos(kappa))/Zbase)]];
res = [res;[1 5 (-(eta*sin(kappa))/Zbase)]];
res = [res;[2 1 (-(eta*(xQ0*cos(kappa) - xP0*sin(kappa)))/(V0^2*Zbase))]];
res = [res;[2 2 ((eta*(xP0*cos(kappa) + xQ0*sin(kappa) + V0^2*Zbase*alpha - VT^2*Zbase*alpha))/(V0^2*Zbase))]];
res = [res;[2 3 (-(2*VQ1*VT*alpha*eta)/V0^2)]];
res = [res;[2 4 ((eta*sin(kappa))/Zbase)]];
res = [res;[2 5 ((eta*cos(kappa))/Zbase)]];
   else
       if  ( abs(LFTYPE-1.0*(2))<1e-9 ) 
res = [res;[1 1 ((eta*(P0*cos(kappa) + xQ0*sin(kappa) + V0^2*Zbase*alpha - VT^2*Zbase*alpha))/(V0^2*Zbase))]];
res = [res;[1 2 (-(eta*(P0*sin(kappa) - xQ0*cos(kappa)))/(V0^2*Zbase))]];
res = [res;[1 3 (-(2*VD1*VT*alpha*eta)/V0^2)]];
res = [res;[1 4 ((eta*cos(kappa))/Zbase)]];
res = [res;[1 5 (-(eta*sin(kappa))/Zbase)]];
res = [res;[2 1 ((eta*(P0*sin(kappa) - xQ0*cos(kappa)))/(V0^2*Zbase))]];
res = [res;[2 2 ((eta*(P0*cos(kappa) + xQ0*sin(kappa) + V0^2*Zbase*alpha - VT^2*Zbase*alpha))/(V0^2*Zbase))]];
res = [res;[2 3 (-(2*VQ1*VT*alpha*eta)/V0^2)]];
res = [res;[2 4 ((eta*sin(kappa))/Zbase)]];
res = [res;[2 5 ((eta*cos(kappa))/Zbase)]];
       else
res = [res;[1 1 ((eta*(P0*cos(kappa) + Q0*sin(kappa) - VT^2*Zbase*alpha + Zbase*alpha*xV0^2))/(Zbase*xV0^2))]];
res = [res;[1 2 ((eta*(Q0*cos(kappa) - P0*sin(kappa)))/(Zbase*xV0^2))]];
res = [res;[1 3 (-(2*VD1*VT*alpha*eta)/xV0^2)]];
res = [res;[1 4 ((eta*cos(kappa))/Zbase)]];
res = [res;[1 5 (-(eta*sin(kappa))/Zbase)]];
res = [res;[2 1 (-(eta*(Q0*cos(kappa) - P0*sin(kappa)))/(Zbase*xV0^2))]];
res = [res;[2 2 ((eta*(P0*cos(kappa) + Q0*sin(kappa) - VT^2*Zbase*alpha + Zbase*alpha*xV0^2))/(Zbase*xV0^2))]];
res = [res;[2 3 (-(2*VQ1*VT*alpha*eta)/xV0^2)]];
res = [res;[2 4 ((eta*sin(kappa))/Zbase)]];
res = [res;[2 5 ((eta*cos(kappa))/Zbase)]];
       end
   end

end




%--------------------------------------------------------------------------
elseif flag == 4
%----- g 
res = empty;
%--------------------------------------------------------------------------
res(1) = - SIDE1_ON*(ED - VD1) - ID1*(SIDE1_ON - 1);
res(2) = - SIDE1_ON*(EQ - VQ1) - IQ1*(SIDE1_ON - 1);

res(3) = P1 + ID1*VD1 + IQ1*VQ1;
res(4) = Q1 + ID1*VQ1 - IQ1*VD1;
%--------------------------------------------------------------------------
elseif flag == 5
%----- gx 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (-SIDE1_ON)]];
res = [res;[2 2 (-SIDE1_ON)]];

%--------------------------------------------------------------------------
elseif flag == 6
%----- gy 
res = empty3;
%--------------------------------------------------------------------------
res = [res;[1 1 (SIDE1_ON)]];
res = [res;[1 4 (1 - SIDE1_ON)]];
res = [res;[2 2 (SIDE1_ON)]];
res = [res;[2 5 (1 - SIDE1_ON)]];

res = [res;[3 1 (ID1)]];
res = [res;[3 2 (IQ1)]];
res = [res;[3 4 (VD1)]];
res = [res;[3 5 (VQ1)]];
res = [res;[3 6 (1)]];
res = [res;[4 1 (-IQ1)]];
res = [res;[4 2 (ID1)]];
res = [res;[4 4 (VQ1)]];
res = [res;[4 5 (-VD1)]];
res = [res;[4 7 (1)]];
%--------------------------------------------------------------------------
elseif flag == 7
%----- h 
res = x;
%--------------------------------------------------------------------------
elseif flag == 8
%----- hx 
res = [[1:5];[1:5];ones(1,5)]';
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
%-----------------------
%--------------------------------------------------------------------------
end
