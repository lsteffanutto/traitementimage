clear all;
close all;
clc;

I1=double(imread('football056.ras'));
figure, imshow(uint8(I1));
title('I1');
drawnow;


I2=double(imread('football059.ras'));
figure, imshow(uint8(I2));
title('I2');
drawnow;

I3=double(imread('football059.ras'));
% figure, imshow(uint8(I3));lear all;

Diff1=I2-I1;
Diff2=I2-I3;
%figure, imshow(uint8(Diff1));
% title('Diff1');
% drawnow;

%figure, imshow(uint8(Diff2));
% title('Diff2');
% drawnow;

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

%% Affichage des vecteurs de déplacement
[Vx,Vy] = motionAtoB_integer(I2,I1, [8,8], [15,15]); %vecteurs de déplacement (Points arrivé I2, Point de départ I1)
figure, imshow(uint8(I1));
[X,Y] = meshgrid(1:8:longueur,1:8:hauteur);
hold on;
quiver(X,Y,Vx,Vy) %couple coordonnée du vecteur image = en ces points on a les vecteurs en dehors on mets zero
hold off;

%% Compensation du mouvement

Err = I2-I1;
entropie=myentropie(Err(:), 512); %différence inter pixel, valeur negative comme positibe -255;255

%I2_compensé:
%On parcourt les blocs de I2 en regardant quels bloc de I1 leur
%correspondent (avant déplacement)
%Puis on stock ces blocks trouvé à l'emplacement de I2
%Prend point après déplacement en I2 et tu le mets à l'endroit de départ 
% en I1
%On prend en compte le déplacement avec Vx et Vy


%% Compensation

I2_comp = motionCompensate_integer(I1,Vx,Vy );

D1=I2-I1;

entropie_I2=myentropie(I2,256)

entropie_Diff_1_2=myentropie(D1,516)

Diff_finale=I2_comp-I1;

entropie_Diff_finale=myentropie(Diff_finale,512) %diff=>512

figure, imshow(uint8(I2_comp));
title('I_comp');
drawnow;




% figure, imshow(uint8(I_comp));
% title('I_comp');
% drawnow;

%Err_img = I2 - I_comp; % vecteur de A qui se sont déplacé dans B

% figure, imshow(uint8(Err_img));
% title('Err_img');
% drawnow;

%Err_img=A-B_comp
%Err=A-B;

%A_comp=motion

I2_comp_bis = imresize(I2_comp,2);
figure, imshow(uint8(I2_comp_bis));
title('I2_comp_bis');
drawnow;
