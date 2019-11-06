clear, close all, clc

% A FINIR FDP
[X,Y]=meshgrid(-33:33,-33:33);

dist=0;
size=255;
radius=1e21;
[R,G,B]=disks(size,radius,dist);
dist1=0;
size1=255;
radius1=1e10;
[R1,G1,B1]=disks(size1,radius1,dist1);


img=cat(3,R,G,B);

tailleaiguille = 127;
centre = (127,127);

teta=pi/4
x=dist*cos(teta);
y=dist*sin(teta);

for n = 1:teta
    for r = 1: tailleaiguille
        
        


figure, imshow(img);
title('Rolux on the flux');

% v=VideoWriter('horloge.avi','Uncompressed AVI');
% v.FrameRate=8; %images par secondes
% open(v)  
% for n=1:100
%     q=mod(n,4);
%     if q == 0
%         img(125:129,1:127,1:end)= 0;
%     end
%     if q==1
%         img(125:129,127:255,1:end)= 0;
%     end
%     if q == 2
%         img(127:255,125:129,1:end)= 0;
%     end
%     if q == 3
%         img(1:127,125:129,1:end)= 0;
%     end
%     writeVideo(v, img);
% end