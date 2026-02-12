function f = flops_eigdec(n,mode)
% FLOPS_EIGDEC   Flops for eigenvalue decomposition.
% FLOPS_EIGDEC(n) returns the number of flops to compute eigenvalue decomposition.

% Number of flops for the QR decomposition algorithm using Householder reflections [1]:
%In each iteration k = 1 to n-1
% Number of multiplies is: 2(n - k + 1)^2
% Number of additions is (n - k +1)^2 + (n - k +1)(n-k) + 2
% Number of divisions is 1 (real) + 1 (complex)
% Number of square roots is 1
f = 0;
for k = 1:n-1
    if mode == "real"
        f = f + 2*(n-k+1)^2 + (n-k+1)^2 + (n-k+1)*(n-k) + 2 + flops_div + flops_sqrt;
    elseif mode == "complex"
        f = f + 12*(n-k+1)^2 + 2*(n-k+1)^2 + 2*(n-k+1)*(n-k) + 4 + 2*flops_div + flops_sqrt + flops_modulus;
    else
        error('Invalid mode specified. Use "real" or "complex".');
    end
end

% [1] "Introduction to Scientific Computing and Data Analysis" by Holmes, 2023