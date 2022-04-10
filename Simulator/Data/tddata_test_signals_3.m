clear variables

global currentmodel;

%-----------------------------------------------
clc
enum_definitions;

components = {...
%               'Model_class' [x0] [y0] [parameter] 'name';...
               'UDM_TEST_3' [] [] [1 0.5 11 0.2 0.2 0.2 0.4] 'Ramp';...
               } ;

external_connections = { 
%%  'model1' 'variable1' 'model2' 'variable2';...
 }; 


plots = { ...
%     {'modelnames'} {'varnames'} ; ...
     {'Ramp'} {'y1'} ; ...
     {'Ramp'} {'Counter1'} ; ...
     {'Ramp'} {'Counter2'} ; ...
     {'Ramp'} {'Counter3'} ; ...
     {'Ramp'} {'Counter4'} ; ...
     {'Ramp'} {'y2'} ; ...
};

disturbances = { ...
     % time, 'modelname' 'pararametername' newvalue;...

};


connections = {};

for i=1:size(external_connections,1)
 connections{i+len_ntcon}= external_connections{i};
end


simparam = td_init_simparam();

simparam.tfinal = 12;
simparam.inittype = 1; 
simparam.show_init = 1;
simparam.verbose = 1;

simparam.bPlot = 1;
simparam.everyNPoints = 100;
simparam.RelTol = 1e-3;
simparam.AbsTol = 1e-4;
simparam.hmin = 1e-4;
simparam.hmax = 1e-2;

simparam.integ_type = enum_integ_type_trapezoidal;
simparam.step_control = enum_variable_stepsize;


model = [];
model.components = components;
model.connections = connections;
model.plots = plots;
model.disturbances = disturbances;

model.withnames = 0;
model.simparam = simparam;



figure


model = tdsimnew(model);






