clear all;
close all;

%scinder le plm en image scalaire
%matrice rouge, matrice verte, matrice bleu

%% VAR
%image vrai couleur
r = [1 0 1; 0 0 0; 1 0 1];
g = [0 1 0; 1 0 1; 0 1 0];
b = [0 0 0; 0 1 0; 0 0 0];

%% TRAITEMENT
%image vrai couleur
img=cat(3,r,g,b); %concatene les 3 matrice dans la profondeur et dans l'ordre rgb

%image couleur indexé
img1=[0 1 4; 5 2 3];

%% FIGURE
figure,image(img)

figure, image(img1);
colormap(flag(8)),colorbar; %flag(8) = palette discrete

figure, image(img1+1); %soit on decale tout de 1 car index 0 existe pas 
colormap(flag(8)),colorbar;

%soit on met tout en entier
%figure, image(uint8(im1))
%colormap(flag(8)),colorbar;


