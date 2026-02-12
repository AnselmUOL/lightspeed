function f = flops_maxk(n,k)
% FLOPS_MAXK    Flops for maxk
% FLOPS_MAXK returns the number of flops needed to compute the maximum of k elements out of n. 

f = 2*k*n - k*(k+1);
