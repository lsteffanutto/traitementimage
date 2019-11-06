clear, close all, clc;

A=imread('barbara.bmp');
figure
image(A)
colormap(gray(256))
axis('equal')
title('Image A');

%On prend 1 pixel sur 4, On visual le recouvrement de spectre;
%On garde les points tous les 4 pixels (tous les 4 pixels)
B=A(1:4:end,1:4:end);
figure
image(B)
colormap(gray(256))
axis('equal')
title('Image B');

%Ici on redimensionne sans recouvrement
%On garde les points tous les 1/4 pixels
C=imresize(A,1/4); %imresize, applique filtre passe bas, puis echantillone; 2eme parametre = ratio, image sortie 1/4 fois plus grande
figure
image(C)
colormap(gray(256))
axis('equal')
title('Image C');