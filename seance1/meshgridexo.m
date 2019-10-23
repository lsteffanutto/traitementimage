clear, close all, clc;

%défini une image par synthèse analytique (eq. math)

abscisse = 34;
ordonnee = 32;
x = -abscisse:abscisse;
y = -ordonnee : ordonnee;

img = zeros(length(y), length(x));

%solution longue (8 lignes)
for i=1:length(y)
    for j=1:length(x)
        r = sqrt(x(j)^2+y(i)^2);
        img1(i,j) = 1000*sin(r/2)/r;
    end
end

figure, imagesc(img1), axis square
figure, surf(img1);

%solution courte (3 lignes)
[X,Y]=meshgrid(-34:34,-32:32); %meshgrid = balayage de l'image pour X et Y, X(1,1)
R=(X.^2+Y.^2).^0.5;
img2=1000*sin(R/2)./R;
figure, imagesc(img2), axis square
figure, surf(img2)