close all;
clear;

A=double(imread('lezard.bmp'));
B=imread('implant.bmp');

% H = - sum(pilog2(pi))
% pi = ni/Nb pixel avec ni<- hist

%calcul pi
entropie1 = myentropie(A(:),256);
%count = hist(A);

% for i = 1:460
%     
%     for j = 1:294
%         occ = [occ hist(A(i,j))];
%     end
%     
% end
        

