function [D] = diff2mat_non_even(x)
[k,m] = size(x);

% Determine step size for node i
for i = 1 : k-1
    h(i,1) =x(i+1,1)-x(i,1);
end
h(k,1) =x(k)-x(k-1);

% Building stencil for middle nodes and left end right edge
D_ele_right = [-1 1];
D_ele_middle = [2 -2 2];
D_ele_left = [-1 1];

D = zeros(k,k);

%Filling stencil in D matrix
for i = 2 : k-1
    D(i,[i-1 i i+1])=D_ele_middle;
    D(i,i-1)= D(i,i-1)/(h(i-1)*(h(i-1)+h(i)));
    D(i, i )= D(i,i)/(h(i-1)*(h(i)));
    D(i,i+1)= D(i,i+1)/(h(i)*(h(i-1)+h(i)));
end
D(1,[1 2 3])=D_ele_middle;
D(k,[k-2 k-1 k])=D_ele_middle;

D(1,1)= D(1,1)/(h(1)*(h(1)+h(2)));
D(1, 2 )= D(1,2)/(h(1)*(h(2)));
D(1,3)= D(1,3)/(h(2)*(h(1)+h(2)));

D(k,k-2)= D(k,k-2)/(h(k-2)*(h(k-2)+h(k-1)));
D(k,k-1 )= D(k,k-1)/(h(k-2)*h(k-1));
D(k,k)= D(k,k)/(h(k-1)*(h(k-2)+h(k-1)));
end