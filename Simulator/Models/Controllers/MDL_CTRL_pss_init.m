%----- Equations f 

function res = MDL_CTRL_pss_init(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_pss_init');
disp('inputs:  P');
disp('external_states:  VPSS');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 2');
disp('Number of f = 0');
disp('Number of g = 1');
disp('Number of p = 0');
disp(' ');
disp(' ');
disp(' ');
res1 = MDL_CTRL_pss_init([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 1 0 []];
return;
elseif flag == 101
res=[0 2 0 0 1];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
};
algstates = { ... ;
'P';...
'VPSS';...
};
parameters = { ... ;
};
externalstates = { ... ;
'VPSS';...
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
res.y0=zeros(1,2);
res.p0=zeros(1,0);
res.y0(1) = 1; % P 
res.y0(2) = 0; % VPSS 
return;
elseif flag == 110
	res = [];
return;
elseif flag == 111
	res = [];
return;
elseif flag == 106
end
%------- map parameters -------------------
%------- map x -------------------
%------- map y -------------------
P = y(1);
VPSS = y(2);


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
res(1) = VPSS;
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
res = [res;[1 2 (1)]];
%-----------------------
elseif flag == 7
%----- h 
res = x;


elseif flag == 8
%----- hx 
res = empty3;


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
