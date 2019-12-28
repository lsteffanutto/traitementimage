function [F] = block_processing_AC(block)

%% On recentre

block = block-128;
F = dct2(block ,[8 8]);

F(1,1)=0;

end