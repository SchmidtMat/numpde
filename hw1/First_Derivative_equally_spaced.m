function First_Derivative_Equally_Spaced()

NumberOfOrders = 5;
for Ij = 1:NumberOfOrders
    
    % Building equally spaced grid
    n = 4^Ij;
    h =2/(n-1);
    nn(Ij)=n;
    hh(Ij)=h;
    x = linspace(-1,1,n);
    [m,k] = size(x);
    
    u = zeros(k,1);
    u_1 = zeros(k,1);
    
    % Evaluating u at nodes
    for i = 1 : k
        u(i,1)=sin(x(1,i));
    end
    
    [D] = diffmat_even(x);
    
    % Calculating derivatives
    u_1 = (1/(2*h)) * D * u;
    
    %Plotting Real solution and finite difference solution
    % figure(1)
    % plot(x,u_1,'o')
    % hold on
    % plot(x,cos(x))
    
    u_diff = u_1-cos(x');
    
    Error(Ij) = norm(u_diff,inf);
end
    figure(2)
    loglog(hh,Error,'o')
    xlabel('step size h')
    ylabel('first derivative error')
    hold on
    loglog(hh,hh,'-')
    
    legend('diff1 even grid','h')
end
