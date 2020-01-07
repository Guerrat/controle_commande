clear all;close all;
partie_21_simu_bo=1; % =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_22_lin_bo=1;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_31_def_nouveau_schema_accq=0;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_32_lin_bf_accq=0;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_41_calcule_regulateur_q1q2=0;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_42_simu_bf_q1q2 =0;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
%------------------------------------------------------------------------------
% parametres [Lb1;Lb2;Mb1;Mb2;Ixb1;Iyb1;Izb1;Ixb2;Iyb2;Izb2;fm1;fm2;foutil;G];
%------------------------------------------------------------------------------
RB=struct();
RB.Lb1=1;
RB.Lb2=1; % 15cm de debattement
RB.Mb1=1;% 30cm /7000pas codeur
RB.Mb2=1; % codeur a 2000 pas / tour
% les inerties dependent des masses et longueurs
RB.Ixb1=0;RB.Iyb1=RB.Mb1*RB.Lb1^2/12;RB.Izb1=RB.Mb1*RB.Lb1^2/12; 
RB.Ixb2=0;RB.Iyb2=RB.Mb2*RB.Lb2^2/12;RB.Izb2=RB.Mb2*RB.Lb2^2/12;
RB.fm1=0.03 /(1*pi/180); %frottements visqueux m1 Nm/[°/s]
RB.fm2=0.03 /(1*pi/180); %frottements visqueux m2 Nm/[°/s]
RB.foutil=0.0001 /(1*pi/180); %frottement visqueux outil negligable : 0.0001 Nm/[°/s]
RB.G=9.81; % acceleration de la gravite terrestre , 9.81 m/s2
%------------------------------------------------------------
% numeros des entrees et des sorties, se reporter au schema
%------------------------------------------------------------
RB.in_Fq1=1;
RB.in_Fq2=2;
RB.out_q1=1;
RB.out_q2=2;
%-------------------------
%conditions initiales
RB.Fq2_1=0;
RB.t_Fq2 =0;

RB.q1_init = 0;
RB.q1_final = deg2rad(10);
RB.t_q1 = 1e-7;

RB.q2_init = 0;
RB.q2_final = deg2rad(45);
RB.t_q2 = 1e-7;
%-------------------------
RB.q1_init=deg2rad(10);
RB.q2_init=deg2rad(10);
RB.vq1_init=0;
RB.vq2_init=0;
%-----------------------------------
%entrees ( se reporter au schema )
%-----------------------------------
RB.Fq1_0=0;
RB.Fq1_1=0;
RB.t_Fq1 =0;
RB.Fq2_0=0;
RB.Fq2_1=0;
RB.t_Fq2 =0;

RB.q1_init = 0;
RB.q1_final = deg2rad(10);
RB.t_q1 = 1e-7;

RB.q2_init = 0;
RB.q2_final = deg2rad(45);
RB.t_q2 = 1e-7;



wu = 60;

phi = deg2rad(-50 + 90);

alpha = (sin(phi) + 1)/(1 - sin(phi));

K0 = wu*wu/alpha;
w1 = wu / alpha;
w2 = wu * alpha;
wi = wu/10;
s=tf('s');
K=K0*(1+s/w1)/(1+s/w2)*(1+s/wi)/(s/wi);


RB.q1_init = deg2rad(5);
RB.q1_final = deg2rad(10);
RB.Fq1_0 = 0;
RB.vq1_init = 0;

RB.t_q1 = 0;

RB.q2_init = deg2rad(5);
RB.q2_final = deg2rad(20);
RB.vq2_init = 0;
RB.Fq2_0 = 0;
RB.t_q2 = 0;

RB.t1 = 10 / wu; RB.q1_ref1 = deg2rad(20); RB.q2_ref1 = deg2rad(20);
RB.t2 = 20/wu; RB.Fq1_0_2 = 1;
RB.t3 = 30/wu; RB.Fq1_0_3 = 0; RB.Fq2_0_3 = 2;
RB.t4 = 40/wu;

%% 

qi1 = 0;

qf1 = deg2rad(45);

tf1 = 2;

D1 = qf1 - qi1;

a0_1 = qi1; a1_1 = 0; a2_1 = 3/(tf1*tf1) * D1; a3_1 = 2/(tf1*tf1*tf1);

P1 = [a0_1 a1_1 a2_1 a3_1];




