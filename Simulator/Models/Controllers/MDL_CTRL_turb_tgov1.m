%----- Equations f

function res = MDL_CTRL_turb_tgov1(x,y,t,ev,param,flag,model_no)

global empty3 storage

global empty

res = empty;

if nargin == 0
    clc;
    disp('Model: MDL_CTRL_turb_tgov1');
    disp('dynamic_states:  dV3 dV4');
    disp('inputs:  W POREF');
    disp('external_states:  PMECH');
    disp('internal_states:  V1 V2 V3 V4 V3dot V3_ULS V3_LLS dV4dot');
    disp('events:  ev_V3_max ev_V3_min');
    disp('parameters:  R T1 VMAX VMIN T2 T3 DT PSTEP');
    disp('--------------------------------------------------');
    disp('Summary:');
    disp('--------------------------------------------------');
    disp('Number of x = 2');
    disp('Number of y = 13');
    disp('Number of f = 2');
    disp('Number of g = 11');
    disp('Number of p = 8');
    disp(' ');
    disp(' ');
    disp(' ');
    res1 = MDL_CTRL_turb_tgov1([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
    %----- Initialisation
    %	res = [number_of_f number_of_g [event_variables]]
    res = [2 11 0 [11 12 ]];
    return;
elseif flag == 101
    res=[2 13 8 2 11];
    return;
elseif flag == 102
    res='';
    return;
elseif flag == 103
    dynstates = { ... ;
        'dV3';...
        'dV4';...
        };
    algstates = { ... ;
        'W';...
        'POREF';...
        'PMECH';...
        'V1';...
        'V2';...
        'V3';...
        'V4';...
        'V3dot';...
        'V3_ULS';...
        'V3_LLS';...
        'ev_V3_max';...
        'ev_V3_min';...
        'dV4dot';...
        };
    parameters = { ... ;
        'R';...
        'T1';...
        'VMAX';...
        'VMIN';...
        'T2';...
        'T3';...
        'DT';...
        'PSTEP';...
        };
    externalstates = { ... ;
        'PMECH';...
        };
    internalstates = { ... ;
        'V1';...
        'V2';...
        'V3';...
        'V4';...
        'V3dot';...
        'V3_ULS';...
        'V3_LLS';...
        'dV4dot';...
        };
    events = { ... ;
        'ev_V3_max';...
        'ev_V3_min';...
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
    res.y0=zeros(1,13);
    res.p0=zeros(1,8);
    res.x0(1) = 1; % dV3
    res.x0(2) = 0; % dV4
    res.y0(1) = 1; % W
    res.y0(2) = 0; % POREF
    res.y0(3) = 1; % PMECH
    res.y0(4) = 0; % V1
    res.y0(5) = 0; % V2
    res.y0(6) = 1; % V3
    res.y0(7) = 0; % V4
    res.y0(9) = 1; % V3_ULS
    res.y0(10) = 1; % V3_LLS
    res.p0(1) = 5.000000e-02; % R
    res.p0(2) = 5.000000e-01; % T1
    res.p0(3) = 1; % VMAX
    res.p0(4) = 0; % VMIN
    res.p0(5) = 3; % T2
    res.p0(6) = 10; % T3
    res.p0(7) = 0; % DT
    res.p0(8) = 0; % PSTEP
    return;
elseif flag == 110
    res = [1  1];
    return;
elseif flag == 111
    res = [0  0];
    return;
elseif flag == 106
    R = param(1);
    T1 = param(2);
    VMAX = param(3);
    VMIN = param(4);
    T2 = param(5);
    T3 = param(6);
    DT = param(7);
    PSTEP = param(8);
    if ( R == 0 )
        return;
    end
    %- if ( MWBASE < 0 || MWBASE > 0)
    return;
    %- end
    if  T1 == 0
        return;
    end
    if  T2 == 0
        return;
    end
    if  T3 == 0
        return;
    end
end
%------- map parameters -------------------
R = param(1);
T1 = param(2);
VMAX = param(3);
VMIN = param(4);
T2 = param(5);
T3 = param(6);
DT = param(7);
PSTEP = param(8);
%------- map x -------------------
dV3 = x(1);
dV4 = x(2);
%------- map y -------------------
W = y(1);
POREF = y(2);
PMECH = y(3);
V1 = y(4);
V2 = y(5);
V3 = y(6);
V4 = y(7);
V3dot = y(8);
V3_ULS = y(9);
V3_LLS = y(10);
ev_V3_max = y(11);
ev_V3_min = y(12);
dV4dot = y(13);


if flag == 1
    %----- f
    res = empty;
    %--------------------------------------------------------------------------
    
    %--------------------------------------------------------------------------
    res(1) = V3_LLS*V3_ULS*V3dot;
    res(2) = dV4dot;
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
    res = [res;[1 8 (V3_LLS*V3_ULS)]];
    res = [res;[1 9 (V3_LLS*V3dot)]];
    res = [res;[1 10 (V3_ULS*V3dot)]];
    res = [res;[2 13 (1)]];
elseif flag == 4
    %----- g
    res = empty;
    %--------------------------------------------------------------------------
    %--------------------
    if (abs(T1) > 0)
        res(1) = V3dot - (V2 - dV3)/T1;
        res(2) = V3 + VMAX*(V3_ULS - 1) + VMIN*(V3_LLS - 1) - V3_LLS*V3_ULS*dV3;
    else
        %--------------------
        if (t < 0 )
            res(1) = V3dot;
            res(2) = V3 - V2;
        else
            if (ev(1) > 0 )
                res(1) = V3dot;
                res(2) = V3 - VMAX;
            else
                if (ev(2) < 0 )
                    res(1) = V3dot;
                    res(2) = V3 - VMIN;
                else
                    res(1) = V3dot;
                    res(2) = V3 - V2;
                end
            end
        end
    end
    if (abs(T1) > 0)
        if ((t < 0 || ev_V3_max <= 0 ))
            res(3) = V3_ULS - 1;
        else
            res(3) = V3_ULS;
        end
    else
        res(3) = V3_ULS;
    end
    if (abs(T1) > 0)
        if ((t < 0 || ev_V3_min >= 0))
            res(4) = V3_LLS - 1;
        else
            res(4) = V3_LLS;
        end
    else
        res(4) = V3_LLS;
    end
    if (abs(T3) > 0)
        if (abs(T2) > 0)
            res(5) = dV4dot - (V4 - dV4)/T2;
        else
            res(5) = dV4dot - (V3 - dV4)/T3;
        end
        if (abs(T2) > 0)
            res(6) = V4 - (T2*(V3 + dV4*(T3/T2 - 1)))/T3;
        else
            res(6) = V4 - dV4;
        end
    else
        %--------------------
        res(5) = dV4dot;
        res(6) = V4 - V3;
    end
    res(7) = V1 - W + 1;
    res(8) = V2 - (POREF - V1)/R;
    res(9) = PMECH - V4 + DT*V1;
    
    %--------------------------------------------------------------------------
    if (abs(T1) > 0)
        res(10) = ev_V3_max - V3_ULS*(V3 - VMAX) + V3dot*(V3_ULS - 1);
        res(11) = ev_V3_min - V3_LLS*(V3 - VMIN) + V3dot*(V3_LLS - 1);
    else
        res(10) = VMAX - V2 + ev_V3_max;
        res(11) = VMIN - V2 + ev_V3_min;
    end
elseif flag == 5
    %----- gx
    res = empty3;
    %--------------------------------------------------------------------------
    %--------------------
    if (abs(T1) > 0)
        res = [res;[1 1 (1/T1)]];
        res = [res;[2 1 (-V3_LLS*V3_ULS)]];
    else
        %--------------------
        if (t < 0 )
        else
            if (ev(1) > 0 )
            else
                if (ev(2) < 0 )
                else
                end
            end
        end
    end
    if (abs(T1) > 0)
        if ((t < 0 || ev_V3_max <= 0 ))
        else
        end
    else
    end
    if (abs(T1) > 0)
        if ((t < 0 || ev_V3_min >= 0))
        else
        end
    else
    end
    if (abs(T3) > 0)
        if (abs(T2) > 0)
            res = [res;[5 2 (1/T2)]];
        else
            res = [res;[5 2 (1/T3)]];
        end
        if (abs(T2) > 0)
            res = [res;[6 2 ((T2 - T3)/T3)]];
        else
            res = [res;[6 2 (-1)]];
        end
    else
        %--------------------
    end
    
    %--------------------------------------------------------------------------
    if (abs(T1) > 0)
    else
    end
elseif flag == 6
    %----- gy
    res = empty3;
    %--------------------------------------------------------------------------
    %--------------------
    if (abs(T1) > 0)
        res = [res;[1 5 (-1/T1)]];
        res = [res;[1 8 (1)]];
        res = [res;[2 6 (1)]];
        res = [res;[2 9 (VMAX - V3_LLS*dV3)]];
        res = [res;[2 10 (VMIN - V3_ULS*dV3)]];
    else
        %--------------------
        if (t < 0 )
            res = [res;[1 8 (1)]];
            res = [res;[2 5 (-1)]];
            res = [res;[2 6 (1)]];
        else
            if (ev(1) > 0 )
                res = [res;[1 8 (1)]];
                res = [res;[2 6 (1)]];
            else
                if (ev(2) < 0 )
                    res = [res;[1 8 (1)]];
                    res = [res;[2 6 (1)]];
                else
                    res = [res;[1 8 (1)]];
                    res = [res;[2 5 (-1)]];
                    res = [res;[2 6 (1)]];
                end
            end
        end
    end
    if (abs(T1) > 0)
        if ((t < 0 || ev_V3_max <= 0 ))
            res = [res;[3 9 (1)]];
        else
            res = [res;[3 9 (1)]];
        end
    else
        res = [res;[3 9 (1)]];
    end
    if (abs(T1) > 0)
        if ((t < 0 || ev_V3_min >= 0))
            res = [res;[4 10 (1)]];
        else
            res = [res;[4 10 (1)]];
        end
    else
        res = [res;[4 10 (1)]];
    end
    if (abs(T3) > 0)
        if (abs(T2) > 0)
            res = [res;[5 7 (-1/T2)]];
            res = [res;[5 13 (1)]];
        else
            res = [res;[5 6 (-1/T3)]];
            res = [res;[5 13 (1)]];
        end
        if (abs(T2) > 0)
            res = [res;[6 6 (-T2/T3)]];
            res = [res;[6 7 (1)]];
        else
            res = [res;[6 7 (1)]];
        end
    else
        %--------------------
        res = [res;[5 13 (1)]];
        res = [res;[6 6 (-1)]];
        res = [res;[6 7 (1)]];
    end
    res = [res;[7 1 (-1)]];
    res = [res;[7 4 (1)]];
    res = [res;[8 2 (-1/R)]];
    res = [res;[8 4 (1/R)]];
    res = [res;[8 5 (1)]];
    res = [res;[9 3 (1)]];
    res = [res;[9 4 (DT)]];
    res = [res;[9 7 (-1)]];
    
    %--------------------------------------------------------------------------
    if (abs(T1) > 0)
        res = [res;[10 6 (-V3_ULS)]];
        res = [res;[10 8 (V3_ULS - 1)]];
        res = [res;[10 9 (V3dot - V3 + VMAX)]];
        res = [res;[10 11 (1)]];
        res = [res;[11 6 (-V3_LLS)]];
        res = [res;[11 8 (V3_LLS - 1)]];
        res = [res;[11 10 (V3dot - V3 + VMIN)]];
        res = [res;[11 12 (1)]];
    else
        res = [res;[10 5 (-1)]];
        res = [res;[10 11 (1)]];
        res = [res;[11 5 (-1)]];
        res = [res;[11 12 (1)]];
    end
elseif flag == 7
    %----- h
    res = x;
    %--------------------------------------------------------------------------
    
    %--------------------------------------------------------------------------
    if (abs(T1) > 0)
        if (ev==1)
            res(1) = V3;
        end
    end
    if (abs(T1) > 0)
        if (ev==2)
            res(1) = V3;
        end
    end
elseif flag == 8
    %----- hx
    res = [[1:2];[1:2];ones(1,2)]';
    %--------------------------------------------------------------------------
    
    %--------------------------------------------------------------------------
    if (abs(T1) > 0)
        if (ev==1)
        end
    end
    if (abs(T1) > 0)
        if (ev==2)
        end
    end
elseif flag == 9
    %----- hy
    res = empty3;
    %--------------------------------------------------------------------------
    
    %--------------------------------------------------------------------------
    if (abs(T1) > 0)
        if (ev==1)
            res = [res;[1 6 (1)]];
        end
    end
    if (abs(T1) > 0)
        if (ev==2)
            res = [res;[1 6 (1)]];
        end
    end
elseif flag == 100
    x(find(abs(x)<1e-9))=0;
    y(find(abs(y)<1e-9))=0;
    res = empty;
    %%----- Measurements
elseif flag == 105
    if abs(T1) > 0
        res = 0;
        if  dV3 > VMAX
            res = 0;
            return;
        end
        if  V3 > VMAX
            res = 0;
            return;
        end
        return;
    end
    if abs(T1) > 0
        res = 0;
        if  dV3 < VMIN
            res = 0;
            return;
        end
        if  V3 < VMIN
            res = 0;
            return;
        end
        return;
    end
elseif flag == 107
    res.x0=x;
    res.y0=y;
    %--------------------------------------------------------------------------
    %--------------------------------------------------------------------------
end
