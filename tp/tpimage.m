clear, close all, clc

%% 1) LUMINANCE CHROMINANCE
% La repreesentation en couleurs YCbCr permet de mieux mettre en evidence 
% la présence de bleu ou de rouge dans une image.
% Pour l'image en Cr par exemple, les parties de
% l'image retournée qui se rapproche le plus du blanc sont celles qui contiennent le plus de rouge
% Dans l'image de base

% La luminance correspond contraste de l'image (qui reste le m$ême en noir
% et blanc)

% A=double(imread('pool.tif'));
% R=A(:,:,1);
% G=A(:,:,2);
% B=A(:,:,3);
% 
% Y=0.299*R+0.587*G+0.114*B;
% Cb=0.564*(B-Y)+128;
% Cr=0.713*(R-Y)+128;
% 
% 
% figure, imshow(uint8(A));
% title('image billard de base');
% drawnow;
% 
% figure, imshow(uint8(R));
% title('composante rouge');
% drawnow;
% 
% figure ,imshow(uint8(G));
% title('composante verte');
% drawnow;
% 
% figure ,imshow(uint8(B));
% title('composante bleu');
% drawnow;
% 
% figure ,imshow(uint8(Y));
% title('luminance');
% drawnow;
% 
% figure ,imshow(uint8(Cb));
% title('chrominance bleue');
% drawnow;
% 
% figure ,imshow(uint8(Cr));
% title('chrominance rouge');
% drawnow;

%% 2) FUSION

 B=double(imread('background.jpg'));
% figure, imshow(uint8(B)); %image normal
% title('image background');
% drawnow;
% 
 C=double(imread('foreground.jpg'));
% figure, imshow(uint8(C)); %image normal
% title('image foreground');
% drawnow;

R1=C(:,:,1);
G1=C(:,:,2);
B1=C(:,:,3);

Y1=0.299*R1+0.587*G1+0.114*B1;
Cb1=0.564*(B1-Y1)+128; %on remarque un seuil à 0,57 qui représente le bleu du ciel à enlever
Cr1=0.713*(R1-Y1)+128;

% figure ,imshow(uint8(Cb1));
% title('chrominance bleue foreground');
% drawnow;

M = Cb1<140; %Défini un seuil à 145, si c'est bleu le seuil sera dépassé et on prend le background, sinon on prend le foreground

D=B;

for i = 1:512
    
    for j = 1:768
        
        if M(i,j) == 0
            D(i,j,:)=B(i,j,:);
            
        else
            D(i,j,:)=C(i,j,:); 
        end
        
    end
    
end

% figure ,imshow(uint8(D));
% title('fusion 2 images');

%% 3) FILTRAGE

Monument=double(imread('monument.bmp'));
figure, imshow(uint8(Monument))
title('image monument de base');

[h, w]=size(Monument);
fx=linspace(-0.5, 0.5-1/w, w);
fy=linspace(-0.5, 0.5-1/h, h);
IfA=fftshift(log10(abs(fft2(Monument))));
figure, imagesc(fx, fy, IfA);
title('fft shift image monument de base');
[X, Y] = meshgrid(-5:5);
sigma=1.5;
fech = 1/(2*pi*sigma*sigma);
%f=-(fech/2):1/N:(fech/2) -1/N;

% haute frequence = contour
% basse frequence = information spatiale homogene/ qui se répète

figure, surf(Monument(1:4:end,1:4:end));


H=exp(-(X.^2+Y.^2)/(2*sigma^2))/(2*pi*sigma*sigma);
figure, freqz2(H) % On veut le multiplier par deux sinus donc 2cos(a+b);
title('Gaussienne');

X0 = 0.0992;
Y0 = -0.4085;

PB = H

figure, freqz2(PB) % On veut le multiplier par deux sinus donc 2cos(a+b);
title('Fréquence à supprimer');

%notch filter










