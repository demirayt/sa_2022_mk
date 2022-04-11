global components branches buselements external_connections plots disturbances;

% addpath('../Models/Components/RMS/');
% addpath('../Models/Controllers/');

currentmodel.powersystemtype = 'DQ';


% IEEE TwoArea System (Models One by one)

Ra = 0.25;
Xl = 0.2;
Xd = 1.8;
Xq = 1.7;
Xd1 = 0.3;
Xq1 = 0.55;
Xd2 = 0.25;
Xq2 = 0.25;
Td1 = 8.0;
Tq1 = 0.4;
Td2 = 0.03;
Tq2 = 0.05;

H(1:2) = 6.5;
H(3:4) = 6.175;
F0 = 60;
ws = 2*pi*F0;
KD = 0;

param = [Xd Xq Xl Ra Xd1 Xq1 Xd2 Xq2 Td1 Tq1 Td2 Tq2 ws];
 
Xrc = 0;

Ad = 0.015;
Bd = 9.6;
P1d = 0.900;

Aq = 0.015;
Bq = 9.6;
P1q = 0.900;

%---- 

EMAX = 4.0; 
EMIN = 0.0; 
K = 100.0; 
TATB = 0.3; 
TB = 10.0; 
TE = 0.05; 


%---- 
dF = 1;

DT = 0.0; 
PSTEP = 0.0; 
R = dF/F0;
T1 = 0.5; 
T2 = 6.0; 
T3 = 12.0; 
VMAX = 1.0; 
VMIN = 0.0; 

KS1 = 5.0; 
KS2 = 0.1564; 
KS3 = 1.0; 
M = 0.0; 
N = 0.0; 
SWS1 = 1.0; 
SWS2 = 3.0; 
T1 = 0.25; 
T2 = 0.03; 
T3 = 0.15; 
T4 = 0.015; 
T8 = 0.5; 
T9 = 0.1; 
TW1 = 2.0; 
TW2 = 2.0; 
TW3 = 2.0; 
TW4 = 0.0; 
TW6 = 0.0; 
TW7 = 2.0; 
VSTMAX = 0.1; 
VSTMIN = -0.1; 


components = {...
%               'Model_class' [x0] [y0] [parameter] 'name';...
               'MDL_RMS_DQ0_node' [] [] [20] 'BUS1';...
               'MDL_RMS_DQ0_node' [] [] [20] 'BUS2';...
               'MDL_RMS_DQ0_node' [] [] [20] 'BUS3';...
               'MDL_RMS_DQ0_node' [] [] [20] 'BUS4';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS5';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS6';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS7';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS8';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS9';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS10';...
               'MDL_RMS_DQ0_node' [] [] [230] 'BUS11';...
               'MDL_RMS_DQ0_line_pi' [] [] [0.0 0.15/9 0.0 1 1] 'L-01-05';
               'MDL_RMS_DQ0_line_pi' [] [] [0.0 0.15/9 0.0 1 1] 'L-02-06';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*25 1 1] 'L-05-06';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*10 1 1] 'L-06-07';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*110 1 1] 'L-07-08-A';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*110 1 1] 'L-07-08-B';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*110 1 1] 'L-08-09-A';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*110 1 1] 'L-08-09-B';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*10  1 1] 'L-09-10';
               'MDL_RMS_DQ0_line_pi' [] [] [0.0    0.15/9   0.00 1 1]  'L-04-10';
               'MDL_RMS_DQ0_line_pi' [] [] [[0.0001 0.001 0.00175]*25 1 1]  'L-10-11';
               'MDL_RMS_DQ0_line_pi' [] [] [0.0    0.15/9    0.00 1 1] 'L-03-11';
               'MDL_RMS_DQ0_gen_order6' [] [] [100 20 900 20 ws Ra Xd Xd1 Xd2 Td1 Td2 Xq Xq1 Xq2 Tq1 Tq2 Xl H(1) KD 1] 'GEN1'; %28 2
               'MDL_RMS_DQ0_gen_order6' [] [] [100 20 900 20 ws Ra Xd Xd1 Xd2 Td1 Td2 Xq Xq1 Xq2 Tq1 Tq2 Xl H(2) KD 1] 'GEN2'; %28 2
               'MDL_RMS_DQ0_gen_order6' [] [] [100 20 900 20 ws Ra Xd Xd1 Xd2 Td1 Td2 Xq Xq1 Xq2 Tq1 Tq2 Xl H(3) KD 1] 'GEN3'; %28 2
               'MDL_RMS_DQ0_gen_order6' [] [] [100 20 900 20 ws Ra Xd Xd1 Xd2 Td1 Td2 Xq Xq1 Xq2 Tq1 Tq2 Xl H(4) KD 1] 'GEN4'; %28 2
               'MDL_RMS_DQ0_load_voltage1' [] [] [9.67 1.0 0 0 1 2 1] 'LOAD-07-A';...
               'MDL_RMS_DQ0_load_voltage1' [] [] [17.67 1.0 0 0 1 2 1] 'LOAD-09-A';...
               'MDL_RMS_DQ0_load_voltage1' [] [] [0 -2.0 0 0 2 2 1] 'LOAD-07-B';...
               'MDL_RMS_DQ0_load_voltage1' [] [] [0 -3.5 0 0 2 2.0 1] 'LOAD-09-B';...
               'MDL_CTRL_avr_sexs' [] [] [TATB TB K TE EMIN EMAX 0] 'AVR-GEN1';
               'MDL_CTRL_vref_init' [] [] [2 1.03 0 0] 'VREF-GEN1';
               'MDL_CTRL_pss_pss2a' [] [] [TW1 TW2 TW3 TW4 TW6 KS2 TW7 KS3 KS1 T1 T2 T3 T4 VSTMIN VSTMAX M N T8 T9 SWS1 SWS2] 'PSS-GEN1';
               'MDL_CTRL_avr_sexs' [] [] [TATB TB K TE EMIN EMAX 0] 'AVR-GEN2';
               'MDL_CTRL_vref_init' [] [] [2 1.01 0 0] 'VREF-GEN2';
               'MDL_CTRL_pss_pss2a' [] [] [TW1 TW2 TW3 TW4 TW6 KS2 TW7 KS3 KS1 T1 T2 T3 T4 VSTMIN VSTMAX M N T8 T9 SWS1 SWS2] 'PSS-GEN2';
               'MDL_CTRL_avr_sexs' [] [] [TATB TB K TE EMIN EMAX 0] 'AVR-GEN3';
               'MDL_CTRL_vref_init' [] [] [2 1.03 0 0] 'VREF-GEN3';
               'MDL_CTRL_pss_pss2a' [] [] [TW1 TW2 TW3 TW4 TW6 KS2 TW7 KS3 KS1 T1 T2 T3 T4 VSTMIN VSTMAX M N T8 T9 SWS1 SWS2] 'PSS-GEN3';
               'MDL_CTRL_avr_sexs' [] [] [TATB TB K TE EMIN EMAX 0] 'AVR-GEN4';
               'MDL_CTRL_vref_init' [] [] [2 1.01 0 0] 'VREF-GEN4';
               'MDL_CTRL_pss_pss2a' [] [] [TW1 TW2 TW3 TW4 TW6 KS2 TW7 KS3 KS1 T1 T2 T3 T4 VSTMIN VSTMAX M N T8 T9 SWS1 SWS2] 'PSS-GEN4';
               'MDL_CTRL_turb_tgov1' [] [] [R T1 VMAX VMIN T2 T3 DT PSTEP] 'GOV-GEN1';
               'MDL_CTRL_pref_init' [] [] [2 7/9 0 0] 'PREF-GEN1';
               'MDL_CTRL_turb_tgov1' [] [] [R T1 VMAX VMIN T2 T3 DT PSTEP] 'GOV-GEN2';
               'MDL_CTRL_pref_init' [] [] [2 7/9 0 0] 'PREF-GEN2';
               'MDL_CTRL_turb_tgov1' [] [] [R T1 VMAX VMIN T2 T3 DT PSTEP] 'GOV-GEN3';
               'MDL_CTRL_pref_init' [] [] [3 1.03 0 0] 'PREF-GEN3';
               'MDL_CTRL_turb_tgov1' [] [] [R T1 VMAX VMIN T2 T3 DT PSTEP] 'GOV-GEN4';
               'MDL_CTRL_pref_init' [] [] [2 7/9 0 0] 'PREF-GEN4';
               'UDM_TEST_4' [] [] [0.01 0.01 0.0005 0.001] 'Relais1';
               } ;
branches = {...
%        'branch_name' 'from' 'to';...
        'L-01-05' 'BUS1' 'BUS5';...
        'L-02-06' 'BUS2' 'BUS6';...
        'L-05-06' 'BUS5' 'BUS6';...
        'L-06-07' 'BUS6' 'BUS7';...
        'L-07-08-A' 'BUS7' 'BUS8';...
        'L-07-08-B' 'BUS7' 'BUS8';...
        'L-08-09-A' 'BUS8' 'BUS9';...
        'L-08-09-B' 'BUS8' 'BUS9';...
        'L-09-10' 'BUS9' 'BUS10';...
        'L-04-10' 'BUS4' 'BUS10';...
        'L-10-11' 'BUS10' 'BUS11';...
        'L-03-11' 'BUS3' 'BUS11';...
        };
 
buselements = {...
%        'buselement_name' 'at' 'AVR' 'PSS' 'GOV';...
        'GEN1' 'BUS1' 'AVR-GEN1' 'PSS-GEN1' 'GOV-GEN1';...
        'GEN2' 'BUS2' 'AVR-GEN2' 'PSS-GEN2' 'GOV-GEN2';...
        'GEN3' 'BUS3' 'AVR-GEN3' 'PSS-GEN3' 'GOV-GEN3';...
        'GEN4' 'BUS4' 'AVR-GEN4' 'PSS-GEN4' 'GOV-GEN4';...
        'LOAD-07-A' 'BUS7' '' '' '';...
        'LOAD-09-A' 'BUS9' '' '' '';...
        'LOAD-07-B' 'BUS7' '' '' '';...
        'LOAD-09-B' 'BUS9' '' '' '';...
        };
    
external_connections = { 
%%  'model1' 'variable1' 'model2' 'variable2';...
%% model1.variable1 = model2.variable2
%%---------------------------------------
  'AVR-GEN1' 'VUEL' '' '';...
  'AVR-GEN1' 'VOEL' '' '';...
  'AVR-GEN1' 'VREF' 'VREF-GEN1' 'VREF';...
  %%---------------------------------------
  'VREF-GEN1' 'VT' 'GEN1' 'VT';...
  'VREF-GEN1' 'Q' 'GEN1' 'Q1';...
  %%---------------------------------------
  'AVR-GEN2' 'VUEL' '' '';...
  'AVR-GEN2' 'VOEL' '' '';...
  'AVR-GEN2' 'VREF' 'VREF-GEN2' 'VREF';...
  %%---------------------------------------
  'VREF-GEN2' 'VT' 'GEN2' 'VT';...
  'VREF-GEN2' 'Q' 'GEN2' 'Q1';...
  %%---------------------------------------
  'AVR-GEN3' 'VUEL' '' '';...
  'AVR-GEN3' 'VOEL' '' '';...
  'AVR-GEN3' 'VREF' 'VREF-GEN3' 'VREF';...
  %%---------------------------------------
  'VREF-GEN3' 'VT' 'GEN3' 'VT';...
  'VREF-GEN3' 'Q' 'GEN3' 'Q1';...
  %%---------------------------------------
  'AVR-GEN4' 'VUEL' '' '';...
  'AVR-GEN4' 'VOEL' '' '';...
  'AVR-GEN4' 'VREF' 'VREF-GEN4' 'VREF';...
  %%---------------------------------------
  'VREF-GEN4' 'VT' 'GEN4' 'VT';...
  'VREF-GEN4' 'Q' 'GEN4' 'Q1';...
  %%---------------------------------------
  'GOV-GEN1' 'POREF' 'PREF-GEN1' 'POREF';...
  %%---------------------------------------
  'PREF-GEN1' 'P' 'GEN1' 'P1';...
  'PREF-GEN1' 'VQ' 'GEN1' 'VQ1';...
  %%---------------------------------------
  'GOV-GEN2' 'POREF' 'PREF-GEN2' 'POREF';...
  %%---------------------------------------
  'PREF-GEN2' 'P' 'GEN2' 'P1';...
  'PREF-GEN2' 'VQ' 'GEN2' 'VQ1';...
  %%---------------------------------------
  'GOV-GEN3' 'POREF' 'PREF-GEN3' 'POREF';...
  %%---------------------------------------
  'PREF-GEN3' 'P' 'GEN3' 'P1';...
  'PREF-GEN3' 'VQ' 'GEN3' 'VQ1';...
  %%---------------------------------------
  'GOV-GEN4' 'POREF' 'PREF-GEN4' 'POREF';...
  %%---------------------------------------
  'PREF-GEN4' 'P' 'GEN4' 'P1';...
  'PREF-GEN4' 'VQ' 'GEN4' 'VQ1';...
  %%---------------------------------------
  'Relais1' 'u1' 'GEN1' 'W';...
  %%---------------------------------------
 }; 


plots = { ...
%     {'modelnames'} {'varnames'} ; ...
%      {'GEN1'} {'W'} ; ...
%      {'GEN2'} {'W'} ; ...
%      {'GEN3'} {'W'} ; ...
%      {'GEN4'} {'W'} ; ...
     {'Relais1'} {'y2'} ; ...
};

disturbances = { ...
     % time, 'modelname' 'pararametername' newvalue;...
     0.1, 'L-07-08-A' 'SIDE1_ON' 0;...
     0.1, 'L-07-08-A' 'SIDE2_ON' 0;...

};
