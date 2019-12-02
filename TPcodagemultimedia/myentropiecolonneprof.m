function [ent_diff] = myentropiecolonneprof(A)

[Nl, Nc] = size(A);
B = A(:, 1:Nc-1);
C = A(:, 2:Nc);
Err = B-C;
ent_diff = myentropie(Err(:), 512);


end

