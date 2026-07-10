function f = flops_row_sum(n,m,mode)
% FLOPS_ROW_SUM         Flops for row sums.
% FLOPS_ROW_SUM(a) returns the number of flops for row_sum(a).
% FLOPS_ROW_SUM(n,m) returns the number of flops for row_sum(ones(n,m)).

if nargin == 1
  m = cols(n);
  n = rows(n);
end
if nargin < 3
  mode = "real";
end
if mode == "real"
  f = n*(m-1);
elseif mode == "complex"
  f = 2*n*(m-1);
else
  error('Invalid mode specified. Use "real" or "complex".');
end

end