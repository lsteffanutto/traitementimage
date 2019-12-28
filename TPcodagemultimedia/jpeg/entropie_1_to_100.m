function [im_rec] = entropie_1_to_100( img )

im_rec = zeros(size(img));
entropie = [];
MSE = 0;
PSNR = [];
for q = 1:99
    for i = 1:8:256-7
        for j = 1:8:256-7
                im_rec(j:j+7, i:i+7) = block_processing_q(img(j:j+7, i:i+7), q);
        end
    end
    entropie = [ entropie myentropie(im_rec(:), 256)];
    
    MSE = mean(mean((img-im_rec).^2));
    PSNR = [ PSNR 20*log10(255/MSE) ];
    
end

figure,
plot(1:99, entropie);
title('courbe entropie en fonction de q');
xlabel('indice de qualite q');
ylabel('entropie');
drawnow;

figure,
plot(1:99, PSNR);
title('courbe PSNR en fonction de q');
xlabel('indice de qualite q');
ylabel('PSNR');
drawnow;



end

