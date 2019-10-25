clear, close all, clc;

%filtre median supprime le bruit
%filtre moyenneur atténue le bruit mais diffuse les tâches

A=double(imread('couloir.tif'));
figure, imshow(uint8(A))

H1=ones(5)/25;;
B=conv2(A,H1,'same'); %conv2 = convolution en 2D
figure, imshow(uint8(B));

C=medfilt2(A, [5 5]);
figure, imshow(uint8(C));