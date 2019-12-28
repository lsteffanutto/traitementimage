function B=motionCompensate_interp(A,Vx,Vy,sub)

[hA,wA]=size(A);
[hV,wV]=size(Vx);
tx=wA/wV;
ty=hA/hV;
dtx=(0:tx-1);
dty=(0:ty-1);
for j=1:hV
    for i=1:wV
        x=(i-1)*tx+1;
        y=(j-1)*ty+1;
        B(y+dty,x+dtx)=block_interp(A,x+dtx,y+dty,Vx(j,i),Vy(j,i),sub);
    end
end
end