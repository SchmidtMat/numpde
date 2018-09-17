function [D] = diffmat_non_even(x)
% Building stencil for middle nodes and left end right edge
D_ele_right = [-1 1];
D_ele_left = [-1 1];

[k,m] = size(x);

D = zeros(k,k);

%Filling stencil in D matrix
for i = 1 : k-1
    D(i,[i i+1])=D_ele_right;
end
D(k,[k-1 k])=D_ele_left;
end