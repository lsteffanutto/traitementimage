close all;
clear;

nbframe=30;

Y=zeros(288,352,nbframe);
U=zeros(288,352,nbframe);
V=zeros(288,352,nbframe);
R=zeros(288,352,nbframe);
G=zeros(288,352,nbframe);
B=zeros(288,352,nbframe);

fid = fopen('news30f.yuv');
vid=[];
%extraction luminance/chrominance + fabrication couleurs
%YUV TO RGB
for i=1:nbframe
    Y(:,:,i)= fread(fid,[352 288], 'uchar')';
    U(:,:,i)= imresize(fread(fid,[352/2 288/2], 'uchar'),2)'; %imresize(:,2); car 4:2:0
    V(:,:,i)= imresize(fread(fid,[352/2 288/2], 'uchar'),2)';
    
    R(:,:,i)=1.164*(Y(:,:,i)-16)+1.596*(V(:,:,i)-128);
    G(:,:,i)=1.164*(Y(:,:,i)-16)+0.813*(V(:,:,i)-128)-0.391*(U(:,:,i)-128);
    B(:,:,i)=1.164*(Y(:,:,i)-16)+2.018*(V(:,:,i)-128);

    img = cat(3,R(:,:,i),G(:,:,i),B(:,:,i));
    vid=[vid im2frame(uint8(img))];
end

fclose(fid);
movie(vid);




