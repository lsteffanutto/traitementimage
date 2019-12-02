function [ent_colonne] = myentropiecolonne(vect)

D=[];

for i = 1:length(vect)-1
    D(:,i)= vect(:,i)-vect(:,i+1);
    
end

figure, hist(D);
title('entropie inter-colonne de A');
ent_colonne = myentropie(double(D(:)),512);
end