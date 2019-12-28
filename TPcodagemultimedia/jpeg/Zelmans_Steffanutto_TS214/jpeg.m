close all;
clc;
clear;

%% JPEG BLOCK
%% image de depart
img = double(imread('cameraman.tif'));
figure, imshow(uint8(img));
title('image de depart');
drawnow;

%% on capture un block de 8x8
[x,y] = ginput(1);
x = fix(x);
y = fix(y);

block = img(y:y+7,x:x+7);

figure, imshow(uint8(block));
title('block');
drawnow;
%imwrite(block,'block.jpg','Quality',100);


%% On recentre

block = block-128;
F = dct2(block ,[8 8])

%% Quantification

Q = [ 16 11 10 16 24 40 51 61 ;
      12 12 14 19 26 58 60 55 ;
      14 13 16 24 40 57 69 56 ;
      14 17 22 29 51 87 80 62 ;
      18 22 37 56 68 109 103 77;
      24 35 55 64 81 104 113 92;
      49 64 78 87 103 121 120 101;
      72 92 95 98 112 100 103 99 ]; % matrice de quantification
  
q = 25;
alpha = fonction_alpha(q); % alpha qu'on determine en fonction de q

Fq = fix(F./(alpha*Q)); % matrice de coef resultante avant codage

%% Dequantification
Fq_deq = Fq.*(alpha*Q);
F_deq = idct2(Fq_deq);
block_rec = F_deq+128;

figure, imshow(uint8(block_rec));
title('block reconstruit');
drawnow;
%imwrite(block_rec,'block_rec.jpg','Quality',100);


%% JPEG DE L'IMAGE ENTIERE


img_proc = blkproc(img,[8 8], @block_processing); %fonction a appliquer a chaque block 8x8 de l'image

figure, imshow(uint8(img_proc));
title('image reconstruite');
drawnow;
imwrite(uint8(img_proc),'im_rec.jpg','Quality',100);

%% AC DC
ACDC = blkproc(img,[8 8], @block_processing_AC_DC);

figure, imshow(uint8(ACDC));
title('coeff AC DC');
drawnow;
%imwrite(ACDC,'ACDC.jpg','Quality',100);
%% AC
AC= blkproc(img,[8 8], @block_processing_AC);

figure, imshow(uint8(AC));
title('coeff AC  seuls');
drawnow;
%imwrite(AC,'AC.jpg','Quality',100);

%% ENTROPIE ENTRE LES  IMAGES Q FIXE
E1 = myentropie(img(:),256);
E2 = myentropie(img_proc(:),256);


%% RAPPORT RSB ENTRE LES IMAGES Q FIX 

entropie_1_to_100(img);

%% PSNR
MSE = mean(mean((img-img_proc).^2))
PSNR = 20*log10(255/MSE) 

%% PSNR q variable

