function [ent] = myentropie(vect,nbNiveau)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
freq=hist(vect,nbNiveau);
prob=freq/length(vect);
pos=find(prob); %valeur position correspondant à valeur propre non null
ent = - sum(prob(pos).*log2(prob(pos)));
end

