%----- Equations f 

function res = FREQ_RAMP(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: FREQ_RAMP');
disp('dynamic_states:  x1');
disp('external_states:  FOUT');
disp('events:  ev_FOUT_table_1 ev_FOUT_table_2 ev_FOUT_table_3 ev_FOUT_table_4 ev_FOUT_table_5 ev_FOUT_table_6');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 1');
disp('Number of y = 7');
disp('Number of f = 1');
disp('Number of g = 7');
disp('Number of p = 0');
disp(' ');
disp(' ');
disp(' ');
res1 = FREQ_RAMP([],[],0,[],[],104,[]);text = 'x0=[';text = strcat(text,sprintf('%d ',res1.x0));text = strcat(text,']');disp(text);text = 'y0=[';text = strcat(text,sprintf('%d ',res1.y0));text = strcat(text,']');disp(text);text = 'p0=[';text = strcat(text,sprintf('%d ',res1.p0));text = strcat(text,']');disp(text);return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [1 7 0 [2 3 4 5 6 7 ]];
return;
elseif flag == 101
res=[1 7 0 1 7];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'x1';...
};
algstates = { ... ;
'FOUT';...
'ev_FOUT_table_1';...
'ev_FOUT_table_2';...
'ev_FOUT_table_3';...
'ev_FOUT_table_4';...
'ev_FOUT_table_5';...
'ev_FOUT_table_6';...
};
parameters = { ... ;
};
externalstates = { ... ;
'FOUT';...
};
internalstates = { ... ;
};
events = { ... ;
'ev_FOUT_table_1';...
'ev_FOUT_table_2';...
'ev_FOUT_table_3';...
'ev_FOUT_table_4';...
'ev_FOUT_table_5';...
'ev_FOUT_table_6';...
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
res.p0=zeros(1,0);
res.x0(1) = 0; % x1 
res.y0(1) = 0; % FOUT 
return;
elseif flag == 110
	res = [0  0  0  0  0  0];
return;
elseif flag == 111
	res = [0  0  0  0  0  0];
return;
elseif flag == 106
end
%------- map parameters -------------------
%------- map x -------------------
x1 = x(1);
%------- map y -------------------
FOUT = y(1);
ev_FOUT_table_1 = y(2);
ev_FOUT_table_2 = y(3);
ev_FOUT_table_3 = y(4);
ev_FOUT_table_4 = y(5);
ev_FOUT_table_5 = y(6);
ev_FOUT_table_6 = y(7);


if flag == 1
%----- f 
res = empty;
%-----------------------
if (t < 0) 
res(1) = 0;
else
res(1) = 1;
end
%-----------------------
elseif flag == 2
%----- fx 
res = empty3;
%-----------------------
if (t < 0) 
else
end
%-----------------------
elseif flag == 3
%----- fy 
res = empty3;
%-----------------------
if (t < 0) 
else
end
%-----------------------
elseif flag == 4
%----- g 
res = empty;
%-----------------------
if (ev(1) < 0 ) 
res(1) = FOUT - 1;
else
if (ev(2) < 0 ) 
res(1) = FOUT - 1;
else
if (ev(3) < 0 ) 
res(1) = FOUT - x1/300 - 299/300;
else
if (ev(4) < 0 ) 
res(1) = FOUT - 101/100;
else
if (ev(5) < 0 ) 
res(1) = FOUT + x1/300 - 31/30;
else
if (ev(6) < 0 ) 
res(1) = FOUT - 1;
else
res(1) = FOUT - 1;
end
end
end
end
end
end
res(2) = ev_FOUT_table_1 - x1;
res(3) = ev_FOUT_table_2 - x1 + 1;
res(4) = ev_FOUT_table_3 - x1 + 4;
res(5) = ev_FOUT_table_4 - x1 + 7;
res(6) = ev_FOUT_table_5 - x1 + 10;
res(7) = ev_FOUT_table_6 - x1 + 15;
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
if (ev(1) < 0 ) 
else
if (ev(2) < 0 ) 
else
if (ev(3) < 0 ) 
res = [res;[1 1 (-1/300)]];
else
if (ev(4) < 0 ) 
else
if (ev(5) < 0 ) 
res = [res;[1 1 (1/300)]];
else
if (ev(6) < 0 ) 
else
end
end
end
end
end
end
res = [res;[2 1 (-1)]];
res = [res;[3 1 (-1)]];
res = [res;[4 1 (-1)]];
res = [res;[5 1 (-1)]];
res = [res;[6 1 (-1)]];
res = [res;[7 1 (-1)]];
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
if (ev(1) < 0 ) 
res = [res;[1 1 (1)]];
else
if (ev(2) < 0 ) 
res = [res;[1 1 (1)]];
else
if (ev(3) < 0 ) 
res = [res;[1 1 (1)]];
else
if (ev(4) < 0 ) 
res = [res;[1 1 (1)]];
else
if (ev(5) < 0 ) 
res = [res;[1 1 (1)]];
else
if (ev(6) < 0 ) 
res = [res;[1 1 (1)]];
else
res = [res;[1 1 (1)]];
end
end
end
end
end
end
res = [res;[2 2 (1)]];
res = [res;[3 3 (1)]];
res = [res;[4 4 (1)]];
res = [res;[5 5 (1)]];
res = [res;[6 6 (1)]];
res = [res;[7 7 (1)]];
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
