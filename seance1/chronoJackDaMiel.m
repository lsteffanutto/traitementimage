clear
close all
clc

N = 255;
R0 = (N-1)/2;

[X, Y] = meshgrid(-R0:R0, -R0:R0);
D = sqrt(X.^2+Y.^2);

v = VideoWriter('video.avi', 'Uncompressed AVI');
v.FrameRate = 1;
open(v);

for n=0:12
    
    R = double(D<R0);
    G = zeros(size(R));
    B = zeros(size(R));    
    
    theta = 2*pi/12*(n-3);    
    for r=0:R0
        x = floor(r * cos(theta) + R0);
        y = floor(r * sin(theta) +R0);
        G(y+1, x+1) = 1;
        R(y+1, x+1) = 0;
    end    
    I = cat(3, R,G,B);
    writeVideo(v, I);
end

close(v)
implay('video.avi');
