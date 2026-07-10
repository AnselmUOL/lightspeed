function f = flops_sort(x, dim)
% FLOPS_SORT   Flops for sorting an array.
% f = flops_sort(x) returns the idealized number of operations (comparisons)
% required to sort the array x along its first non-singleton dimension.
%
% f = flops_sort(x, dim) returns the operations required to sort along
% the dimension 'dim'.

    sz = size(x);

    % Match MATLAB's default behavior: sort along the first non-singleton dimension
    if nargin < 2
        dim = find(sz ~= 1, 1);
        if isempty(dim)
            dim = 1;
        end
    end

    n = sz(dim); % Length of the array being sorted

    % If the dimension is 0 or 1, no sorting is needed
    if n <= 1
        f = 0;
        return;
    end

    % The number of individual 1D sorts being performed 
    % (e.g., sorting all columns of a matrix)
    num_sorts = numel(x) / n;

    % The ideal number of comparisons per sort is N * log2(N)
    f = 2 * ceil(num_sorts * n * log2(n));
end