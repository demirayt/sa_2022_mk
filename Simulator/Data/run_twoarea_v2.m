close all;clear variables;

enum_definitions;

simparam = td_init_simparam();

simparam.tfinal = 5;
simparam.inittype = 1; 
simparam.show_init = 1;
simparam.verbose = 0;

simparam.bPlot = 1;
simparam.everyNPoints = 50;
simparam.RelTol = 1e-2;
simparam.AbsTol = 1e-3;
simparam.hmin = 1e-3;
simparam.hmax = 5e-1;

simparam.integ_type = enum_integ_type_trapezoidal;
simparam.step_control = enum_variable_stepsize;
%simparam.step_control = enum_fixed_stepsize;

% figure
% mdl = td_run_ps('data_case1_emt_dq0',simparam);
% figure
% mdl = td_run_ps('data_case2_emt_dq0',simparam);
% figure
% mdl = td_run_ps('data_case3_emt_dq0',simparam);
figure
% mdl = td_run_ps_v2('tddata_emt_3node',simparam);
% mdl = td_run_ps_v2('tddata_cigre_mv',simparam);
% mdl = td_run_ps_v2('tddata_twoarea_org',simparam);
 mdl = td_run_ps_v2('tddata_twoarea_v2',simparam);
%  mdl = td_run_ps_v2('test_simple_0X',simparam); für X, 1,2,3
% legend({'Ppll','VD1_con','VQ1_con'});
% legend({'P1A','Q1A','ID1'});
% legend({'IDref_con','IQref_con'});
% legend({'P1C','Q1C'})


