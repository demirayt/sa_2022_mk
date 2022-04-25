%----- Equations f 

%----- Equations g 
% 	 evTrigger-u1 = 0


function res = tdm_block_trip_org(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: tdm_block_trip_org');
disp('events:  evTrigger');
disp('parameters:  modelid parameterid newvalue');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 0');
disp('Number of y = 2');
disp('Number of f = 0');
disp('Number of g = 1');
disp('Number of p = 3');
disp(' ');
disp(' ');
disp(' ');
return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [0 1 0 [2 ]];
return;
elseif flag == 101
res=[0 2 3 0 1];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
};
algstates = { ... ;
'u1';...
'evTrigger';...
};
parameters = { ... ;
'modelid';...
'parameterid';...
'newvalue';...
};
externalstates = { ... ;
};
internalstates = { ... ;
};
events = { ... ;
'evTrigger';...
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
res.p0=zeros(1,3);
return;
elseif flag == 110
	res = [1];
return;
elseif flag == 111
	res = [1];
return;
elseif flag == 106
modelid = param(1);
parameterid = param(2);
newvalue = param(3);
end
%------- map parameters -------------------
modelid = param(1);
parameterid = param(2);
newvalue = param(3);
%------- map x -------------------
%------- map y -------------------
u1 = y(1);
evTrigger = y(2);


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
res(1) = evTrigger-(u1-0.5);
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
res = [res;[1 1 -1]];
res = [res;[1 2 1]];
%-----------------------
elseif flag == 7
    if ev == 1
        res.type = 'TRIGGER';
        res.modelid = modelid;
        res.parameterid = parameterid;
        res.newvalue = newvalue;
        res.x = x;
    else
        res = x;
    end

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
end
