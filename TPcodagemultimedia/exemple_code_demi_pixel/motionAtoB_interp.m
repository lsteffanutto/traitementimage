function [Vx,Vy,wV,hV]=motionAtoB_interp(A,B,t,s,p)

[h,w]=size(A);
tx=t(1);
ty=t(2);
dtx=(0:tx-1); % Parcours du bloc
dty=(0:ty-1);
wV=fix(w/tx); % Nbre de blocs en largeur (44)
hV=fix(h/ty); % Nbre de blocs en hauteur (30) 
Vx=zeros(hV,wV); % 1 vecteur par bloc
Vy=zeros(hV,wV);
[dx,dy]=grid_motion(s(1),s(2),p); % discrétisation de l'espace des déplacements 
for j=1:hV
    y = (j-1)*ty+1;
    for i=1:wV
        x = (i-1)*tx+1;
        Bs=B(y+dty,x+dtx);
        crit=nan(1,length(dx));  
        for k=1:length(dx)
            if x+dx(k) >= 1 && x+dx(k)+tx-1 <= w && y+dy(k) >= 1 && y+dy(k)+ty-1 <= h
                As=block_interp(A, x+dtx, y+dty, dx(k), dy(k), p>1);
                crit(k)=sum(sum(abs(Bs-As)));
            end
        end
        ind=find(crit==min(crit));
        if ~isempty(ind)
            Vx(j,i)=dx(ind(1));
            Vy(j,i)=dy(ind(1));
        end
    end
end
end


function [dx,dy]=grid_motion(sx,sy,p)

dx=linspace(-(sx-1)/2,(sx-1)/2,sx+(p-1)*(sx-1));
dy=linspace(-(sy-1)/2,(sy-1)/2,sy+(p-1)*(sy-1));
[dx,dy]=meshgrid(dx,dy);
dx=dx(:);
dy=dy(:);
end

