clear all;
close all;

%% VAR

A=imread('bdx.jpg'); %charger une image vrai couleur
%la commande "whos" permet d'afficher les parametres de l'image.
%IMAGE EN VRAI COULEUR
%1ere dimensions hauteur, 2eme largeur, 3eme correspond aux triplet (R,G,B)
%nombre d'octet de l''image que size * octet de la classe (uint8 = 1 octet)
%BDX.jpg => 538*808*3*1

[B,palette] =imread('lena.bmp'); %charger une image couleur indexée (palette mémorisé dans fichier = seconde variable)
%image lena 8bits non signés 

C=zeros(512); %Par defaut, valeur max, format double 64bits => pblm de class = pblm format

E =imread('radio.jpg'); 
F = double(imread('radio.jpg')); 

%% TRAITEMENT

C(250:370,240:350)=50; %couleur présente + la valeur après le =
D=double(B)+C; %additionner 2images il faut le même format, on met Lena même format

F1 = ((F-min(min(F)))/max(max(F)))*255; %toute dynamique gray scale + imagesc pour mise à lechelle


%% FIGURES

%%IMAGE VRAIES COULEURS

%image(A);
imshow(A);
%imagesc(A); %Rend la dynamique de l'image compatible avec la palette
title('Image de Bordeaux');

%image couleur indexé, si on spécifie pas de palette matlab associe palette
%par défaut imshow palette en niveau de gris

%%IMAGE COULEURS INDEXEES
%gray(8) = fais apparaître niveau de gris sur 8 niveaux

figure;
imshow(B,palette); %palette niveau de gris
title('Lena');

figure;
image(D);
colormap(gray(255)); %on choisit la palette
title('Lena bis');

figure, image(E);
colormap(gray(256));
colorbar;
title('gray scale trop sombre');
%ici image prend l'échelle d egris va que de 0 à 60 => trop sombre
%on veut toute la dynamique hasta 255 (voir "TRAITEMENT")

figure,imagesc(F1);
colormap(gray(256)),colorbar;
title('gray scale adjusted');


