%----- Equations f 
% 	 d(dVref)/dt = 0 
% 	 d(dV1)/dt = 1/TA*(VC1-dV1) 
% 	 d(dV23)/dt = -1/TB*dV23+(TB-TC)/TB^2*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS) 
% 	 d(dV4)/dt = 1/TA*(KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))-dV4)*VA_ULS*VA_LLS 
% 	 d(dVE)/dt = 1/TE*(VR-KD*IFD-KE*dVE-dVE*(K0+K1*exp(K2*dVE)))*VE_LLS 
% 	 d(dVF)/dt = 1/TF*(KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))-dVF) 

%----- Equations g 
% 	 VA_ULS = 0
% 	 ev_VA_ULD-KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))+dV4 = 0
% 	 VA_LLS = 0
% 	 ev_VA_LLD-KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))+dV4 = 0
% 	 ev_HV-VUEL+dV4 = 0
% 	 HVout-dV4 = 0
% 	 ev_LV-VOEL+HVout = 0
% 	 LVout-HVout = 0
% 	 ev_VRmin-LVout+VRMIN = 0
% 	 ev_VRmax-LVout+VRMAX = 0
% 	 VR-VRMIN = 0
% 	 VE_LLS = 0
% 	 ev_VE_LLD-1/TE*(VR-KD*IFD-KE*dVE-dVE*(K0+K1*exp(K2*dVE))) = 0
% 	 ev_statexc1-KC*IFD/dVE = 0
% 	 ev_statexc2-KC*IFD/dVE+433/1000 = 0
% 	 ev_statexc3-KC*IFD/dVE+3/4 = 0
% 	 ev_statexc4-KC*IFD/dVE+1 = 0
% 	 FEX = 0
% 	 EFD-dVE*FEX = 0
% 	 VC1-(2*VQ1*IQ1*RC+2*VQ1*ID1*XC+ID1^2*RC^2+VQ1^2+VD1^2+IQ1^2*XC^2-2*VD1*IQ1*XC+2*VD1*ID1*RC+IQ1^2*RC^2+ID1^2*XC^2)^(1/2) = 0


function res = MDL_CTRL_exc_ac1a(x,y,t,ev,param,flag,model_no)

global empty3 storage 

global empty

res = empty;

if nargin == 0
clc;
disp('Model: MDL_CTRL_exc_ac1a');
disp('dynamic_states:  dVref dV1 dV23 dV4 dVE dVF');
disp('external_states:  VD1 VQ1 ID1 IQ1 VT VPSS EFD IFD VUEL VOEL');
disp('internal_states:  VC1 VA_ULS VA_LLS VE_LLS HVout LVout VR FEX');
disp('events:  ev_VA_ULD ev_VA_LLD ev_HV ev_LV ev_VE_LLD ev_VRmin ev_VRmax ev_statexc1 ev_statexc2 ev_statexc3 ev_statexc4');
disp('parameters:  Vsetpoint RC XC TR TB TC KA TA VAMIN VAMAX VRMIN VRMAX VEMIN TE K0 K1 K2 KC KE KD KF TF');
disp('--------------------------------------------------');
disp('Summary:');
disp('--------------------------------------------------');
disp('Number of x = 6');
disp('Number of y = 29');
disp('Number of f = 6');
disp('Number of g = 20');
disp('Number of p = 22');
disp(' ');
disp(' ');
disp(' ');
return;
end
if flag == 0
%----- Initialisation 
%	res = [number_of_f number_of_g [event_variables]]
	res = [6 20 0 [19 20 21 22 23 24 25 26 27 28 29 ]];
return;
elseif flag == 101
res=[6 29 22 6 20];
return;
elseif flag == 102
res='';
return;
elseif flag == 103
dynstates = { ... ;
'dVref';...
'dV1';...
'dV23';...
'dV4';...
'dVE';...
'dVF';...
};
algstates = { ... ;
'VD1';...
'VQ1';...
'ID1';...
'IQ1';...
'VT';...
'VPSS';...
'EFD';...
'IFD';...
'VUEL';...
'VOEL';...
'VC1';...
'VA_ULS';...
'VA_LLS';...
'VE_LLS';...
'HVout';...
'LVout';...
'VR';...
'FEX';...
'ev_VA_ULD';...
'ev_VA_LLD';...
'ev_HV';...
'ev_LV';...
'ev_VE_LLD';...
'ev_VRmin';...
'ev_VRmax';...
'ev_statexc1';...
'ev_statexc2';...
'ev_statexc3';...
'ev_statexc4';...
};
parameters = { ... ;
'Vsetpoint';...
'RC';...
'XC';...
'TR';...
'TB';...
'TC';...
'KA';...
'TA';...
'VAMIN';...
'VAMAX';...
'VRMIN';...
'VRMAX';...
'VEMIN';...
'TE';...
'K0';...
'K1';...
'K2';...
'KC';...
'KE';...
'KD';...
'KF';...
'TF';...
};
externalstates = { ... ;
'VD1';...
'VQ1';...
'ID1';...
'IQ1';...
'VT';...
'VPSS';...
'EFD';...
'IFD';...
'VUEL';...
'VOEL';...
};
internalstates = { ... ;
'VC1';...
'VA_ULS';...
'VA_LLS';...
'VE_LLS';...
'HVout';...
'LVout';...
'VR';...
'FEX';...
};
events = { ... ;
'ev_VA_ULD';...
'ev_VA_LLD';...
'ev_HV';...
'ev_LV';...
'ev_VE_LLD';...
'ev_VRmin';...
'ev_VRmax';...
'ev_statexc1';...
'ev_statexc2';...
'ev_statexc3';...
'ev_statexc4';...
};
res.dynstates=dynstates;
res.algstates=algstates;
res.parameters=parameters;
res.externalstates=externalstates;
res.internalstates=internalstates;
res.events=events;
return;
elseif flag == 104
res.x0=zeros(1,6);
res.y0=zeros(1,29);
res.p0=zeros(1,22);
res.x0(1) = 1; % dVref 
res.x0(2) = 1; % dV1 
res.x0(4) = 1; % dV4 
res.x0(5) = 1; % dVE 
res.x0(6) = 1; % dVF 
res.y0(1) = 1; % VD1 
res.y0(5) = 1; % VT 
res.y0(7) = 1; % EFD 
res.y0(8) = 30; % IFD 
res.y0(9) = -999; % VUEL 
res.y0(10) = 999; % VOEL 
res.y0(11) = 1; % VC1 
res.y0(12) = 1; % VA_ULS 
res.y0(13) = 1; % VA_LLS 
res.y0(14) = 1; % VE_LLS 
res.y0(15) = 1; % HVout 
res.y0(16) = 1; % LVout 
res.y0(17) = 1; % VR 
res.y0(18) = 1; % FEX 
res.p0(4) = 0.1; % TR 
res.p0(5) = 14.0; % TB 
res.p0(6) = 14.1; % TC 
res.p0(7) = 800.0; % KA 
res.p0(8) = 0.1; % TA 
res.p0(9) = 15.0; % VAMIN 
res.p0(10) = 15.0; % VAMAX 
res.p0(11) = -14.0; % VRMIN 
res.p0(12) = 14.0; % VRMAX 
res.p0(13) = 0.000001; % VEMIN 
res.p0(15) = 1; % K0 
res.p0(19) = 0.1; % KE 
res.p0(20) = 0.1; % KD 
res.p0(21) = 0.15; % KF 
res.p0(22) = 1.4; % TF 
return;
end
%------- map parameters -------------------
Vsetpoint = param(1);
RC = param(2);
XC = param(3);
TR = param(4);
TB = param(5);
TC = param(6);
KA = param(7);
TA = param(8);
VAMIN = param(9);
VAMAX = param(10);
VRMIN = param(11);
VRMAX = param(12);
VEMIN = param(13);
TE = param(14);
K0 = param(15);
K1 = param(16);
K2 = param(17);
KC = param(18);
KE = param(19);
KD = param(20);
KF = param(21);
TF = param(22);
%------- map x -------------------
dVref = x(1);
dV1 = x(2);
dV23 = x(3);
dV4 = x(4);
dVE = x(5);
dVF = x(6);
%------- map y -------------------
VD1 = y(1);
VQ1 = y(2);
ID1 = y(3);
IQ1 = y(4);
VT = y(5);
VPSS = y(6);
EFD = y(7);
IFD = y(8);
VUEL = y(9);
VOEL = y(10);
VC1 = y(11);
VA_ULS = y(12);
VA_LLS = y(13);
VE_LLS = y(14);
HVout = y(15);
LVout = y(16);
VR = y(17);
FEX = y(18);
ev_VA_ULD = y(19);
ev_VA_LLD = y(20);
ev_HV = y(21);
ev_LV = y(22);
ev_VE_LLD = y(23);
ev_VRmin = y(24);
ev_VRmax = y(25);
ev_statexc1 = y(26);
ev_statexc2 = y(27);
ev_statexc3 = y(28);
ev_statexc4 = y(29);


%----------------------- ;
%-----------------------;
if flag == 1
%----- f 
res = empty;
%----------------------- 
if t < 0
res(1) = VT-Vsetpoint;
else
res(1) = 0;
end
res(2) = 1/TA*(VC1-dV1);
res(3) = -1/TB*dV23+(TB-TC)/TB^2*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS);
res(4) = 1/TA*(KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))-dV4)*VA_ULS*VA_LLS;
res(5) = 1/TE*(VR-KD*IFD-KE*dVE-dVE*(K0+K1*exp(K2*dVE)))*VE_LLS;
res(6) = 1/TF*(KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))-dVF);
%----------------------- 
elseif flag == 2
%----- fx 
res = empty3;
%----------------------- 
if t < 0
else
end
res = [res;[2 2 -1/TA]];
res = [res;[3 1 (TB-TC)/TB^2]];
res = [res;[3 2 -(TB-TC)/TB^2]];
res = [res;[3 3 -1/TB]];
res = [res;[3 5 -(TB-TC)/TB^2*KF/TF*(KE+K0+K1*exp(K2*dVE)+dVE*K1*K2*exp(K2*dVE))]];
res = [res;[3 6 (TB-TC)/TB^2]];
res = [res;[4 1 1/TA*KA*TC/TB*VA_ULS*VA_LLS]];
res = [res;[4 2 -1/TA*KA*TC/TB*VA_ULS*VA_LLS]];
res = [res;[4 3 1/TA*KA*VA_ULS*VA_LLS]];
res = [res;[4 4 -1/TA*VA_ULS*VA_LLS]];
res = [res;[4 5 (-KE-K0-K1*exp(K2*dVE)-dVE*K1*K2*exp(K2*dVE))/TA*KA*TC/TB*KF/TF*VA_ULS*VA_LLS]];
res = [res;[4 6 1/TA*KA*TC/TB*VA_ULS*VA_LLS]];
res = [res;[5 5 -(KE+K0+K1*exp(K2*dVE)+dVE*K1*K2*exp(K2*dVE))*VE_LLS/TE]];
res = [res;[6 5 1/TF^2*KF*(KE+K0+K1*exp(K2*dVE)+dVE*K1*K2*exp(K2*dVE))]];
res = [res;[6 6 -1/TF]];
%----------------------- 
elseif flag == 3
%----- fy 
res = empty3;
%----------------------- 
if t < 0
res = [res;[1 5 1]];
else
end
res = [res;[2 11 1/TA]];
res = [res;[3 6 (TB-TC)/TB^2]];
res = [res;[3 8 -(TB-TC)/TB^2*KF/TF*KD]];
res = [res;[4 6 1/TA*KA*TC/TB*VA_ULS*VA_LLS]];
res = [res;[4 8 -1/TA*KA*TC/TB*KF/TF*KD*VA_ULS*VA_LLS]];
res = [res;[4 12 1/TA*(KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))-dV4)*VA_LLS]];
res = [res;[4 13 1/TA*(KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))-dV4)*VA_ULS]];
res = [res;[5 8 -1/TE*KD*VE_LLS]];
res = [res;[5 14 1/TE*(VR-KD*IFD-KE*dVE-dVE*(K0+K1*exp(K2*dVE)))]];
res = [res;[5 17 VE_LLS/TE]];
res = [res;[6 8 1/TF^2*KF*KD]];
%----------------------- 
elseif flag == 4
%----- g 
res = empty;
%-----------------------
if t < 0
res(1) = VA_ULS-1;
res(2) = ev_VA_ULD-dV4+VAMAX;
res(3) = VA_LLS-1;
res(4) = ev_VA_LLD-dV4+VAMIN;
else
if ev(1) < 0
res(1) = VA_ULS-1;
res(2) = ev_VA_ULD-dV4+VAMAX;
    else
res(1) = VA_ULS;
res(2) = ev_VA_ULD-KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))+dV4;
    end
if ev(2) > 0
res(3) = VA_LLS-1;
res(4) = ev_VA_LLD-dV4+VAMIN;
    else
res(3) = VA_LLS;
res(4) = ev_VA_LLD-KA*(dV23+TC/TB*(dVref-KF/TF*(KD*IFD+KE*dVE+dVE*(K0+K1*exp(K2*dVE)))+dVF-dV1+VPSS))+dV4;
    end
end
%--------------------------
res(5) = ev_HV-VUEL+dV4;
if t < 0
res(6) = HVout-dV4;
else
if ev(3) > 0
res(6) = HVout-VUEL;
    else
res(6) = HVout-dV4;
    end
end
%--------------------------
res(7) = ev_LV-VOEL+HVout;
if t < 0
res(8) = LVout-HVout;
else
if ev(4) < 0
res(8) = LVout-VOEL;
    else
res(8) = LVout-HVout;
    end
end
%--------------------------
res(9) = ev_VRmin-LVout+VRMIN;
res(10) = ev_VRmax-LVout+VRMAX;
if t < 0
res(11) = VR-LVout;
else
if ev(7) > 0
res(11) = VR-VRMAX;
    else
if ev(6) > 0
res(11) = VR-LVout;
        else
res(11) = VR-VRMIN;
        end
    end
end
%--------------------------
if t < 0
res(12) = VE_LLS-1;
res(13) = ev_VE_LLD-dVE+VEMIN;
else
if ev(5) > 0
res(12) = VE_LLS-1;
res(13) = ev_VE_LLD-dVE+VEMIN;
    else
res(12) = VE_LLS;
res(13) = ev_VE_LLD-1/TE*(VR-KD*IFD-KE*dVE-dVE*(K0+K1*exp(K2*dVE)));
    end
end
%--------------------------
res(14) = ev_statexc1-KC*IFD/dVE;
res(15) = ev_statexc2-KC*IFD/dVE+433/1000;
res(16) = ev_statexc3-KC*IFD/dVE+3/4;
res(17) = ev_statexc4-KC*IFD/dVE+1;
if t < -10
res(18) = FEX-1+KC*IFD/dVE;
else
if ev(8) < 0
res(18) = FEX-1;
    else
if ev(9) < 0
res(18) = FEX-1+2887/5000*KC*IFD/dVE;
        else
if ev(10) < 0
res(18) = FEX^2-3/4+KC^2*IFD^2/dVE^2;
            else
if ev(11) < 0
res(18) = FEX-433/250+433/250*KC*IFD/dVE;
                else
res(18) = FEX;
                end
            end
        end
    end
end
%--------------------------
res(19) = EFD-dVE*FEX;
res(20) = VC1-(2*VQ1*IQ1*RC+2*VQ1*ID1*XC+ID1^2*RC^2+VQ1^2+VD1^2+IQ1^2*XC^2-2*VD1*IQ1*XC+2*VD1*ID1*RC+IQ1^2*RC^2+ID1^2*XC^2)^(1/2);
%-----------------------
elseif flag == 5
%----- gx 
res = empty3;
%-----------------------
if t < 0
res = [res;[2 4 -1]];
res = [res;[4 4 -1]];
else
if ev(1) < 0
res = [res;[2 4 -1]];
    else
res = [res;[2 1 -KA*TC/TB]];
res = [res;[2 2 KA*TC/TB]];
res = [res;[2 3 -KA]];
res = [res;[2 4 1]];
res = [res;[2 5 KA*TC/TB*KF/TF*(KE+K0+K1*exp(K2*dVE)+dVE*K1*K2*exp(K2*dVE))]];
res = [res;[2 6 -KA*TC/TB]];
    end
if ev(2) > 0
res = [res;[4 4 -1]];
    else
res = [res;[4 1 -KA*TC/TB]];
res = [res;[4 2 KA*TC/TB]];
res = [res;[4 3 -KA]];
res = [res;[4 4 1]];
res = [res;[4 5 KA*TC/TB*KF/TF*(KE+K0+K1*exp(K2*dVE)+dVE*K1*K2*exp(K2*dVE))]];
res = [res;[4 6 -KA*TC/TB]];
    end
end
%--------------------------
res = [res;[5 4 1]];
if t < 0
res = [res;[6 4 -1]];
else
if ev(3) > 0
    else
res = [res;[6 4 -1]];
    end
end
%--------------------------
if t < 0
else
if ev(4) < 0
    else
    end
end
%--------------------------
if t < 0
else
if ev(7) > 0
    else
if ev(6) > 0
        else
        end
    end
end
%--------------------------
if t < 0
res = [res;[13 5 -1]];
else
if ev(5) > 0
res = [res;[13 5 -1]];
    else
res = [res;[13 5 (KE+K0+K1*exp(K2*dVE)+dVE*K1*K2*exp(K2*dVE))/TE]];
    end
end
%--------------------------
res = [res;[14 5 KC*IFD/dVE^2]];
res = [res;[15 5 KC*IFD/dVE^2]];
res = [res;[16 5 KC*IFD/dVE^2]];
res = [res;[17 5 KC*IFD/dVE^2]];
if t < -10
res = [res;[18 5 -KC*IFD/dVE^2]];
else
if ev(8) < 0
    else
if ev(9) < 0
res = [res;[18 5 -2887/5000*KC*IFD/dVE^2]];
        else
if ev(10) < 0
res = [res;[18 5 -2*KC^2*IFD^2/dVE^3]];
            else
if ev(11) < 0
res = [res;[18 5 -433/250*KC*IFD/dVE^2]];
                else
                end
            end
        end
    end
end
%--------------------------
res = [res;[19 5 -FEX]];
%-----------------------
elseif flag == 6
%----- gy 
res = empty3;
%-----------------------
if t < 0
res = [res;[1 12 1]];
res = [res;[2 19 1]];
res = [res;[3 13 1]];
res = [res;[4 20 1]];
else
if ev(1) < 0
res = [res;[1 12 1]];
res = [res;[2 19 1]];
    else
res = [res;[1 12 1]];
res = [res;[2 6 -KA*TC/TB]];
res = [res;[2 8 KA*TC/TB*KF/TF*KD]];
res = [res;[2 19 1]];
    end
if ev(2) > 0
res = [res;[3 13 1]];
res = [res;[4 20 1]];
    else
res = [res;[3 13 1]];
res = [res;[4 6 -KA*TC/TB]];
res = [res;[4 8 KA*TC/TB*KF/TF*KD]];
res = [res;[4 20 1]];
    end
end
%--------------------------
res = [res;[5 9 -1]];
res = [res;[5 21 1]];
if t < 0
res = [res;[6 15 1]];
else
if ev(3) > 0
res = [res;[6 9 -1]];
res = [res;[6 15 1]];
    else
res = [res;[6 15 1]];
    end
end
%--------------------------
res = [res;[7 10 -1]];
res = [res;[7 15 1]];
res = [res;[7 22 1]];
if t < 0
res = [res;[8 15 -1]];
res = [res;[8 16 1]];
else
if ev(4) < 0
res = [res;[8 10 -1]];
res = [res;[8 16 1]];
    else
res = [res;[8 15 -1]];
res = [res;[8 16 1]];
    end
end
%--------------------------
res = [res;[9 16 -1]];
res = [res;[9 24 1]];
res = [res;[10 16 -1]];
res = [res;[10 25 1]];
if t < 0
res = [res;[11 16 -1]];
res = [res;[11 17 1]];
else
if ev(7) > 0
res = [res;[11 17 1]];
    else
if ev(6) > 0
res = [res;[11 16 -1]];
res = [res;[11 17 1]];
        else
res = [res;[11 17 1]];
        end
    end
end
%--------------------------
if t < 0
res = [res;[12 14 1]];
res = [res;[13 23 1]];
else
if ev(5) > 0
res = [res;[12 14 1]];
res = [res;[13 23 1]];
    else
res = [res;[12 14 1]];
res = [res;[13 8 1/TE*KD]];
res = [res;[13 17 -1/TE]];
res = [res;[13 23 1]];
    end
end
%--------------------------
res = [res;[14 8 -KC/dVE]];
res = [res;[14 26 1]];
res = [res;[15 8 -KC/dVE]];
res = [res;[15 27 1]];
res = [res;[16 8 -KC/dVE]];
res = [res;[16 28 1]];
res = [res;[17 8 -KC/dVE]];
res = [res;[17 29 1]];
if t < -10
res = [res;[18 8 KC/dVE]];
res = [res;[18 18 1]];
else
if ev(8) < 0
res = [res;[18 18 1]];
    else
if ev(9) < 0
res = [res;[18 8 2887/5000*KC/dVE]];
res = [res;[18 18 1]];
        else
if ev(10) < 0
res = [res;[18 8 2*KC^2*IFD/dVE^2]];
res = [res;[18 18 2*FEX]];
            else
if ev(11) < 0
res = [res;[18 8 433/250*KC/dVE]];
res = [res;[18 18 1]];
                else
res = [res;[18 18 1]];
                end
            end
        end
    end
end
%--------------------------
res = [res;[19 7 1]];
res = [res;[19 18 -dVE]];
res = [res;[20 1 -(VD1-IQ1*XC+ID1*RC)/(2*VQ1*IQ1*RC+2*VQ1*ID1*XC+ID1^2*RC^2+VQ1^2+VD1^2+IQ1^2*XC^2-2*VD1*IQ1*XC+2*VD1*ID1*RC+IQ1^2*RC^2+ID1^2*XC^2)^(1/2)]];
res = [res;[20 2 -(IQ1*RC+ID1*XC+VQ1)/(2*VQ1*IQ1*RC+2*VQ1*ID1*XC+ID1^2*RC^2+VQ1^2+VD1^2+IQ1^2*XC^2-2*VD1*IQ1*XC+2*VD1*ID1*RC+IQ1^2*RC^2+ID1^2*XC^2)^(1/2)]];
res = [res;[20 3 -(VQ1*XC+ID1*RC^2+VD1*RC+ID1*XC^2)/(2*VQ1*IQ1*RC+2*VQ1*ID1*XC+ID1^2*RC^2+VQ1^2+VD1^2+IQ1^2*XC^2-2*VD1*IQ1*XC+2*VD1*ID1*RC+IQ1^2*RC^2+ID1^2*XC^2)^(1/2)]];
res = [res;[20 4 -(VQ1*RC+IQ1*XC^2-XC*VD1+IQ1*RC^2)/(2*VQ1*IQ1*RC+2*VQ1*ID1*XC+ID1^2*RC^2+VQ1^2+VD1^2+IQ1^2*XC^2-2*VD1*IQ1*XC+2*VD1*ID1*RC+IQ1^2*RC^2+ID1^2*XC^2)^(1/2)]];
res = [res;[20 11 1]];
%-----------------------
elseif flag == 7
%----- h 
res = x;
%-----------------------
elseif flag == 8
%----- hx 
res = [[1:6];[1:6];ones(1,6)]';
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
elseif flag == 110
	res = [1  1  1  1  1  1  1  1  1  1  1];
elseif flag == 111
	res = [0  0  0  0  0  0  0  0  0  0  0];
end
