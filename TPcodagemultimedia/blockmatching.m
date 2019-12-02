clear all;
close all;
clc;

I1=double(imread('football057.ras'));
figure, imshow(uint8(I1));
title('I1');
drawnow;


I2=double(imread('football058.ras'));
% figure, imshow(uint8(I2));
title('I2');
drawnow;

I3=double(imread('football059.ras'));
% figure, imshow(uint8(I3));lear all;
close all;
clc;

I1=double(imread('football057.ras'));
figure, imshow(uint8(I1));
title('I1');
drawnow;


I2=double(imread('football058.ras'));
% figure, imshow(uint8(I2));
title('I2');
drawnow;

I3=double(imread('football059.ras'));
% figure, imshow(uint8(I3));
title('I3');
drawnow;

Diff1=I2-I1;
Diff2=I2-I3;
% figure, imshow(uint8(Diff1));
title('Diff1');
drawnow;
% figure, imshow(uint8(Diff2));
title('Diff2');
drawnow;

[hauteur, longueur ] = size(I1);

decoup=[];

for i = 1:8:hauteur
    for j = 1:8:longueur
        
        decoup(1,i) = [ decoup I1(i:i+8,j+8)];
               
    end
    
end

figure, imshow(uint8(I1));
title('Decoup');
drawnow;