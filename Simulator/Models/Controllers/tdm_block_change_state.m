%----- Equations f
% 	 d(xtime)/dt = 1

%----- Equations g
% 	 evTrigger-xtime+Ton = 0


function res = MDL_block_trigger(x,y,t,ev,param,flag,model_no,changestate)

global empty3 storage 

global empty

res = empty;

if nargin == 0
    clc;
    disp('Model: MDL_block_trigger');
    disp('dynamic_states:  xtime');
    disp('events:  evTrigger');
    disp('parameters:  Ton modelid stateid newvalue');
    disp('--------------------------------------------------');
    disp('Summary:');
    disp('--------------------------------------------------');
    disp('Number of x = 1');
    disp('Number of y = 1');
    disp('Number of f = 1');
    disp('Number of g = 1');
    disp('Number of p = 4');
    disp(' ');
    disp(' ');
    disp(' ');
    return;
end
if flag == 0
    %----- Initialisation
    %	res = [number_of_f number_of_g [event_variables]]
    res = [1 1 0 [1 ]];
    return;
elseif flag == 101
    res=[1 1 4 1 1];
    return;
elseif flag == 102
    res='';
    return;
elseif flag == 103
    dynstates = { ... ;
        'xtime';...
        };
    algstates = { ... ;
        'evTrigger';...
        };
    parameters = { ... ;
        'Ton';...
        'modelid';...
        'stateid';...
        'newvalue';...
        'changestate';...
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
    res.x0=zeros(1,1);
    res.y0=zeros(1,1);
    res.p0=zeros(1,4);
    return;
elseif flag == 110
    res = [1];
    return;
elseif flag == 111
    res = [0];
    return;
end
%------- map parameters -------------------
Ton = param(1);
modelid = param(2);
stateid = param(3);
newvalue = param(4);
%------- map x -------------------
xtime = x(1);
%------- map y -------------------
evTrigger = y(1);


%----------------------- ;
%-----------------------;
if flag == 1
    %----- f
    res = empty;
    %-----------------------
    if t < 0
        res(1) = 0;
    else
        res(1) = 1;
    end
    %-----------------------
elseif flag == 2
    %----- fx
    res = empty3;
    %-----------------------
    if t < 0
    else
    end
    %-----------------------
elseif flag == 3
    %----- fy
    res = empty3;
    %-----------------------
    if t < 0
    else
    end
    %-----------------------
elseif flag == 4
    %----- g
    res = empty;
    %-----------------------
    res(1) = evTrigger-xtime+Ton;
    %-----------------------
elseif flag == 5
    %----- gx
    res = empty3;
    %-----------------------
    res = [res;[1 1 -1]];
    %-----------------------
elseif flag == 6
    %----- gy
    res = empty3;
    %-----------------------
    res = [res;[1 1 1]];
    %-----------------------
elseif flag == 7
    %----- h
    %-----------------------
    if ev == 1
        res.type = 'TRIGGER';
        res.modelid = modelid;
        res.stateid = stateid;
        res.newvalue = newvalue;
        res.x = x;
    else
        res = x;
    end

elseif flag == 8
    %----- hx
    res = [[1:1];[1:1];ones(1,1)]';
    %-----------------------
    if ev == 1
    end
elseif flag == 9
    %----- hy
    res = empty3;
    %-----------------------
    if ev == 1
    end
elseif flag == 100
    x(find(abs(x)<1e-9))=0;
    y(find(abs(y)<1e-9))=0;
    res = empty;
    %%----- Measurements
elseif flag == 105
end
