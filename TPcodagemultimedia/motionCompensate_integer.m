function [ B ] = motionCompensate_integer( A,Vx,Vy )

[hA,wA] = size(A);
[hV,wV] = size(Vx);

tx=wA/wV;
ty=hA/hV;

dtx=(0:tx-1);
dty=(0:ty-1);

for j=1:hV
    
    for i=1:wV
        
        x=(i-1)*tx+1;
        y=(j-1)*ty+1;
        B(y+dty,x+dtx)=A(y+dty+Vy(j,i),x+dtx+Vx(j,i));
        
    end
    
end

end

