function f = flops_modulus
% FLOPS_MODULUS    Flops for modulus
% FLOPS_MODULUS returns the number of flops needed to compute the modulus
% of a complex number. 

f = 3 + flops_sqrt;
