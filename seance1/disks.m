function [ R,G,B ] = disks( size, radius,dist )

dxr=dist*cos(pi/6);
dyr=-dist*sin(pi/6); % centre du premier cercle de couleur
dxg=-dxr;
dyg=dyr;
dxb=0;
dyb=dist;
[X,Y]=meshgrid(-(size-1)/2:(size-1)/2);
radiusR=((X-dxr).^2+(Y-dyr).^2).^5;
radiusG=((X-dxg).^2+(Y-dyg).^2).^5;
radiusB=((X-dxb).^2+(Y-dyb).^2).^5;
R=double(radiusR<radius);
G=double(radiusG<radius);
B=double(radiusB<radius);


end

