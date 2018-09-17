function [D] = diffmat_even(x)
[m,k] = size(x);

% Building stencil for middle nodes and left end right edge
D_ele_right = [-1 1];
D_ele_middle = [-1 0  1];
D_ele_left = [-1 1];

D = zeros(k,k);

%Filling stencil in D matrix
for i = 2 : k-1
    D(i,[i-1 i i+1])=D_ele_middle;
end
D(1,[1 2])=D_ele_right*2;
D(k,[k-1 k])=D_ele_left*2;

end