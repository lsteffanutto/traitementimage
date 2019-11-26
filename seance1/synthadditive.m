clear, close all, clc;

%% SYNTHESE ADDITIVE VRAI COULEUR
%% VAR

%% TRAITEMENT

%% FIGURE

%VRAI COULEUR
clear, close all
size=255;
radius=1e18;
dist=45;
[R,G,B]=disks(size,radius,dist);
img=cat(3,R,G,B);
figure, imshow(img);
title('lgbt');

%COULEUR INDEXEES

size1=255;
radius1=1e18;
dist1=45;
[R,G,B]=disks(size1,radius1,dist1);
img1=uint8(R+2*G+4*B); %formule associé à la palette map codée en binaire
map = [ 0 0 0; 1 0 0; 0 1 0; 1 1 0; 0 0 1; 1 0 1;0 1 1; 1 1 1]; %(voir cahier) gray scale
figure, imshow(img,map);
title('couleur indexees');




%%VIDEO
size=255; radius=1e18; dist=45;
[R,G,B]=disks(size,radius,dist);
R=uint8(R*255);
G=uint8(G*255);
B=uint8(B*255);
v=VideoWriter('video.avi','Uncompressed AVI');
v.FrameRate=8; %images par secondes
open(v)  
for n=1:100
    q=mod(n,3);
    if q == 0
        img=cat(3,R,G,B);
    elseif q==1
        img=cat(3,B,R,G);
    else
        img=cat(3,G,B,R);
    end
    writeVideo(v, img);
end

close(v);
implay('video.avi');

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        %% SYNTHESE ADDITIVE COULEURS INDEXEES
        %% VAR
        
        %% TRAITEMENT
        
        %% FIGURE