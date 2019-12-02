clear all;
close all;
clc;

I1=double(imread('football057.ras'));
figure, imshow(uint8(I1));
title('I1');
drawnow;


I2=double(imread('football058.ras'));
figure, imshow(uint8(I2));
title('I2');
drawnow;

I3=double(imread('football059.ras'));
% figure, imshow(uint8(I3));lear all;

Diff1=I2-I1;
Diff2=I2-I3;
figure, imshow(uint8(Diff1));
title('Diff1');
drawnow;
figure, imshow(uint8(Diff2));
title('Diff2');
drawnow;

[hauteur, longueur ] = size(I1);

decoup= zeros(240,352);

% for i = 1:8:hauteur
%     
%     for j = 1:8:longueur
%         
%         decoup(i,j) = I1(i:i+7,j:j+7);
%                
%     end
%     
% end

I3=[];
I3=motionAtoB_integer(I1,I2, [8,8], [15,15]);

figure, imshow(uint8(I3));
title('Diff2');
drawnow;


