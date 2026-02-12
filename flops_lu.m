function f = flops_lu(n,mode)
% FLOPS_LU   Flops for LU decomposition.
% FLOPS_LU(n) returns the number of flops to compute lu(rand(n,n)).
% The matrix is assumed to be symmetric positive definite, so that no pivoting is required.

% Number of flops for the algorithm in Cormen et al:
% Number of multiplies+adds is:
%   sum(k=1:n) sum(i=k+1:n) sum(j=k+1:n) 3
% = sum(k=1:n) 3(n-k)^2
% = sum(k=0:(n-1)) 3 k^2 
% = n(n-0.5)(n-1)
% Number of divides is: n-1
%f = n*(n-0.5)*(n-1) + (n-1)*flops_div;

if nargin < 2
	mode = "real";
end

f = 0;
for k = 0:(n-1)
    if mode == "real"
        f = f + 3*k^2 + flops_div;
    elseif mode == "complex"
        f = f + 9*k^2 + flops_complexdiv;
    else
        error('Invalid mode specified. Use "real" or "complex".');
    end
end
