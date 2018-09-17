function [D] = diff2mat_even(x)
[m,k] = size(x);

% Building stencil for middle nodes and left end right edge
D_ele_right = [2 -5 4 -1];
D_ele_middle = [1 -2 1];
D_ele_left = [2 -5 4 -1];
D_ele_left = [-1 4 -5 2];

D = zeros(k,k);

%Filling stencil in D matrix
for i = 2 : k-1
    D(i,[i-1 i i+1])=D_ele_middle;
end
D(1,[1 2 3 4])=D_ele_right;
D(k,[k-3 k-2 k-1 k])=D_ele_left;
end