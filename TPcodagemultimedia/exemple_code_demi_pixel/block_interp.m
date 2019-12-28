function B = block_interp(A,dtx,dty,dx,dy,sub)

if ~sub
    B=A(dty+dy,dtx+dx);
else
    [h,w]=size(A);
    x=floor(dx);
    y=floor(dy);
    B1=A(dty+y,dtx+x);
    B2=A(dty+y,min(w,dtx+x+1));
    B3=A(min(h,dty+y+1),dtx+x);
    B4=A(min(h,dty+y+1),min(w,dtx+x+1));
    B=B1*(1-(dx-x))*(1-(dy-y));
    B=B+B2*(dx-x)*(1-(dy-y));
    B=B+B3*(1-(dx-x))*(dy-y);
    B=B+B4*(dx-x)*(dy-y);
end
end

