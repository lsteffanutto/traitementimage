close all;
clear;

A=imread('lezard.bmp');
B=imread('implant.bmp');

figure, imshow(A);
figure, imshow(B);

%% ENTROPIE en bits par symboles
entropie1 = myentropie(double(A(:)),256);
entropie2 = myentropie(double(B(:)),256);

%% ENTROPIE COLONNE/COLONNE

ent_col=myentropiecolonne(double(A));
%%
% 
%%
% <http://www.mathworks.com MathWorks>
% 


figure, hist(double(A));
title('entropie de A');
ent_col_diff = myentropiecolonneprof(double(A));




        

