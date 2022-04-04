close all;clear variables;

enum_definitions;

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
% simparam.step_control = enum_fixed_stepsize;

% figure
% mdl = td_run_ps('data_case1_emt_dq0',simparam);
% figure
% mdl = td_run_ps('data_case2_emt_dq0',simparam);
% figure
% mdl = td_run_ps('data_case3_emt_dq0',simparam);
figure
% mdl = td_run_ps_v2('tddata_emt_3node',simparam);
% mdl = td_run_ps_v2('tddata_cigre_mv',simparam);
mdl = td_run_ps_v2('tddata_test_signals_2',simparam);
% mdl = td_run_ps_v2('cigre_data',simparam);


