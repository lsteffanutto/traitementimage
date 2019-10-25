clear, close all, clc;

A=double(imread('monument.bmp'));
figure, imshow(uint8(A))
[h, w]=size(A);
fx=linspace(-0.5, 0.5-1/w, w);
fy=linspace(-0.5, 0.5-1/h, h);
IfA=fftshift(log10(abs(fft2(A))));
figure, imagesc(fx, fy, IfA);
H1=ones(3)/9;
H2=ones(5)/25;
[X, Y] = meshgrid(-5:5);
sigma=1.5;
H3=exp(-(X^2+Y^2)/(2*sigma^2))/(2*pi*sigma*sigma);
figure, freqz2(H1)
figure, freqz2(H2)
figure, freqz2(H3)
