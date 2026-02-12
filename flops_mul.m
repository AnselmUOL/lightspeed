function f = flops_mul(n,m,c,mode)
% FLOPS_MUL    Flops for real matrix multiplication.
% FLOPS_MUL(a,b) returns the number of flops for a*b.
% FLOPS_MUL(n,m,c) returns the number of flops for ones(n,m)*ones(m,c).
% This is more accurate than the flopcount returned by matlab.

if nargin < 4
	mode = "real";
end

if nargin == 2
  a = n;
  b = m;
  n = rows(a);
  m = cols(a);
  c = cols(b);
end
%f = n*c*(2*m-1);
if mode == "real"
  f = n*c*(2*m-1);
elseif mode == "complex"
  f = 4*n*c*(2*m-1);
else
  error('Invalid mode specified. Use "real" or "complex".');
end

