function [block_rec] = block_processing_q(block, q)

%% On recentre

block = block-128;
F = dct2(block ,[8 8]);

%% Quantification

Q = [ 16 11 10 16 24 40 51 61 ;
      12 12 14 19 26 58 60 55 ;
      14 13 16 24 40 57 69 56 ;
      14 17 22 29 51 87 80 62 ;
      18 22 37 56 68 109 103 77;
      24 35 55 64 81 104 113 92;
      49 64 78 87 103 121 120 101;
      72 92 95 98 112 100 103 99 ]; % matrice de quantification
alpha = fonction_alpha(q); % alpha qu'on determine en fonction de q

Fq = fix(F./(alpha*Q)); % matrice de coef resultante avant codage

%% Dequantification
Fq_deq = Fq.*(alpha*Q);
F_deq = idct2(Fq_deq);
block_rec = F_deq+128;

end

