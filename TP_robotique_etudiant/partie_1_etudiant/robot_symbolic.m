clear all;clear global;close all;
use_octave=exist('OCTAVE_VERSION')~=0; % use_octave est vrai si on travaille avec octave
if ( use_octave), % <=> si on travaille avec octave
    more off; % pas de pause a l'affichage
    pkg load symbolic; %chargement du paquet calcul symbolique
end
%--------------------------------------------
% 1- declarations des variables symboliques (notations imposees par le prof )
%
%--------------------------------------------
% Lb1 Lb2 Mb1 Mb2 Ixb1 Iyb1 Izb1 Ixb2 Iyb2 Izb2 fm1 fm2 foutil G; % notations imposees
% q1 q2 vq1 vq2 aq1 aq2; % notations imposees
%--------------------------------------------
% 2- choix des degres de liberte
%--------------------------------------------
q=[q1; q2] ; % vecteur colonne des degres de liberte
vq=a_completer; % vecteur colonne des vitesses des degres de liberte
aq=a_completer; % vecteur colonne des acceleration des degres de liberte
nq=a_completer; % nombre de degres de liberte;
%--------------------------------------------
% 3- transformations geometriques
%--------------------------------------------


%--------------------------------------------
% 4- vitesses , energies et puissances,
% il est conseille d'employer la fonction subs pour verifier vos expressions !...
%--------------------------------------------

%--------------------------------------------
% 5- formalisme de Lagrange
%--------------------------------------------

%--------------------------------------------------------------------
% 6- generations des fonctions calculant les differentes quantites
% notations et parametres imposes par le prof
%--------------------------------------------------------------------

% quantites a completer, ne modifier que la partie de droite
coords_outil_prof  =a_completer_par_vous; % a completer
matrice_A_prof     =a_completer_par_vous; % a completer
matrice_H_prof     =a_completer_par_vous; % a completer
%----------------------------------------------------------------------------------
% ne pas modifier la suite , parametres et noms des fonctions imposes par le prof
%----------------------------------------------------------------------------------
parametres=[Lb1;Lb2;Mb1;Mb2;Ixb1;Iyb1;Izb1;Ixb2;Iyb2;Izb2;fm1;fm2;foutil;G];
f_coords_outil=matlabFunction(coords_outil_prof,'File','clc_coords_outil','Vars',[q;parametres].');
f_A=matlabFunction(matrice_A_prof,'File','clc_A','Vars',[q;parametres].');
f_H=matlabFunction(matrice_H_prof,'File','clc_H','Vars',[q;vq;parametres].');


