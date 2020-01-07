clear all;close all;
partie_21_simu_bo=1; % =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_22_lin_bo=1;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_31_def_nouveau_schema_accq=0;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
partie_32_lin_bf_accq=1;% =1 quand vous en etes a cette partie, et completer le bout de programme correspondant
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
RB.in_Fq2=1;
RB.out_q1=1;
RB.out_q2=2;
%-------------------------
%conditions initiales
%-------------------------
RB.q1_init=pi/18;
RB.q2_init=pi/18;
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

[A,B,C,D]=linmod('schema_robot');
bode(A,B,C,D)

RB.q1_init=pi/4;
RB.q2_init=-pi/4;
[A,B,C,D]=linmod('schema_robot');
hold on
bode(A,B,C,D)

figure
RB.q1_init=0;
RB.q2_init=-0;
[A,B,C,D]=linmod('schema_robot_4');
bode(A,B,C,D)

RB.q1_init=pi/4;
RB.q2_init=-pi/4;
[A,B,C,D]=linmod('schema_robot_4');
hold on
bode(A,B,C,D)

s=tf('s')
wu = 60;
wi = wu/10;
alpha = tand((50+90)/2);
w1 = wu/alpha;
w2 = wu*alpha;
K=wu*wu/alpha * (wi/s + 1) * (1 + s/wi) / (1 + s/w2)

if (partie_31_def_nouveau_schema_accq==1),
  disp('partie 31 :nouveau schema defini, ajout des valeurs par defaut dans RB');
%----------------------------------------------------------------------------
% definition des valeurs par defaut des  constantes et variables 
% relatives a la partie 3.1 ( a ajouter dans RB )  
%----------------------------------------------------------------------------
end

if (partie_41_calcule_regulateur_q1q2==1),
  disp('partie 41 :nouveau schema defini, ajout des valeurs par defaut dans RB');
%----------------------------------------------------------------------------
% definition des valeurs par defaut des  constantes et variables 
% relatives a la partie 4.1 ( a ajouter dans RB )  
%----------------------------------------------------------------------------
   %RB.ssC1=; % correcteur desactive, etc... 
end
if (partie_42_simu_bf_q1q2==1),
  disp('partie 42 :nouveau schema defini, ajout des valeurs par defaut dans RB');
%----------------------------------------------------------------------------
% definition des valeurs par defaut des  constantes et variables 
% relatives a la partie 4.2 ( a ajouter dans RB )  
%----------------------------------------------------------------------------
end

% on range RB dans RB_DEFAULT, pour reinitialisation eventuelle
RB_DEFAULT=RB;
% schema_robot; % chargement du schema
load_system('schema_robot');
%---------------------------------------------------------------                         --
% simulation temporelle en BO
%---------------------------------------------------------------
if (partie_21_simu_bo==1),
   disp('partie 21 simulation en boucle ouverte');
   
% SI VOUS NE SAVEZ PAS COMMENT AJOUTER OU TRACER LES COORDONNEES DE L'OUTIL
% TRACEZ UNIQUEMENT Q1 ET Q2 EN FONCTION DU TEMPS,
% EN RESPECTANT LES TITRES ET COULEURS

end

%---------------------------------------------------------------
%- linearisation en BO                                        --
%---------------------------------------------------------------
if (partie_22_lin_bo==1),
    disp('partie 22 :linearisation en boucle ouverte');
end
if (partie_32_lin_bf_accq ==1 ),
    disp('partie 32 linearisation avec boucle accq');
    disp('partie 32 verification des transfert / valeurs attendues');
    
end % if (partie_32_lin_bf_accq ==1 ),


if (partie_41_calcule_regulateur_q1q2 ==1 ),
    disp('partie 41 calcul des regulateurs articulaires (ssq1,ssq2)');
    
    wu = 60;
    K0 = wu*wu/alpha;
    w1 = wu / alpha;
    w2 = wu * alpha;
    wi = wu/10;
    s=tf('s');
    K=K0*(1+s/w1)/(1+s/w2)*(1+s/wi)/(s/wi);
    
    
end % if (partie_41_calcule_regulateur_q1q2 ==1 ),

if (partie_42_simu_bf_q1q2 ==1 ),
    disp('partie 42 simulation temporelle avec regulateurs articulaires (ssq1 ssq2)');
    disp('partie 42 trace des signaux avec regulateurs articulaires (ssq1 ssq2)');

end % if (partie_42_simu_bf_q1q2 ==1 ),

