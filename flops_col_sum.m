function f = flops_col_sum(n,m,mode)
% FLOPS_COL_SUM         Flops for column sums.
% FLOPS_COL_SUM(a) returns the number of flops for col_sum(a).
% FLOPS_COL_SUM(n,m) returns the number of flops for col_sum(ones(n,m)).

if nargin == 1
  m = cols(n);
  n = rows(n);
end
if nargin < 3
  mode = "real";
end
if mode == "real"
  f = (n-1)*m;
elseif mode == "complex"
  f = 2*(n-1)*m;
else
  error('Invalid mode specified. Use "real" or "complex".');
end

end
