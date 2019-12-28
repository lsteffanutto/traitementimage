function [ALPHA] = fonction_alpha(q)

if ( q <= 50 )
    ALPHA = 50/q;
else
    ALPHA = (100-q)/50;
end 


end

