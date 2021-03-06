function [Vx,Vy] = motionAtoB_integer(A,B,t,s)

%t= taille du bloc (8x8) et s = taille fenetre de rech (15x15 donc -7:7)
[h, w] = size(A);

tx=t(1);
ty=t(2);

dtx=(0:tx-1); %Parcourt du bloc
dty=(0:ty-1);

wV=fix(w/tx); %Nb bloc en largeur (44)
hV=fix(h/ty); %Nb bloc en hauteur (30)

Vx=zeros(hV,wV); %vecteur par block
Vy=zeros(hV,wV);

[dx,dy]=grid_motion(s(1),s(2)); %discretisation de l'espace des déplacements

for j = 1:hV
    
    y = (j-1)*ty+1;
    
    for i = 1:wV
        
        x = (i-1)*tx+1;
        Bs = B(y+dty, x+dtx);
        crit = nan(1,length(dx));
        
        for k = 1:length(dx)
            
            if x + dx(k) >= 1 && x+dx(k)+tx-1 <= w && y+dy(k) >= 1 && y+dy(k)+ty-1 <= h
                
                As=A(y+dty+dy(k),x+dtx+(dx(k)));
                crit(k)=sum(sum(abs(Bs-As)));
                     
            end
            
        end
        
        ind=find(crit==min(crit)); %crit = critere
        
        if ~isempty(ind)
            Vx(j,i)=dx(ind(1));
            Vy(j,i)=dy(ind(1));
        end
                   
    end
    
end
end

function [dx,dy]=grid_motion(sx,sy)

dx=linspace(-(sx-1)/2,(sx-1)/2,sx);
dy=linspace(-(sy-1)/2,(sy-1)/2,sy);
[dx, dy]=meshgrid(dx,dy);
dx=dx(:);
dy=dy(:);

end

