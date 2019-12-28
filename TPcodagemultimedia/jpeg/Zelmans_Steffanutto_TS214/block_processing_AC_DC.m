function [F] = block_processing_AC_DC(block)

%% On recentre

block = block-128;
F = dct2(block ,[8 8]);

end

