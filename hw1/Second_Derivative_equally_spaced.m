function Second_Derivative_equally_spaced()

NumberOfOrders = 5;
for Ij = 1:NumberOfOrders
    
    % Building randomly spaced grid from -1 to 1
    n = 4^Ij;
    h =2/(n-1);
    x = linspace(-1,1,n);
    [m,k] = size(x);
        
    u = zeros(k,1);
    u_2 = zeros(k,1);
    
    % Evaluating u at nodes
    for i = 1 : k
        u(i,1)=sin(x(1,i));
    end
    
    [D]=diff2mat_even(x);
    
    % Calculating derivatives
    u_2 = (1/h^2) * D * u;
    
    %Plotting Real solution and finite difference solutio
    figure(1)
    plot(x,u_2,'o')
    hold on
    plot(x,-sin(x))
    
    %Calculating error with infinity norm
    u_diff = u_2+sin(x');
    
    Error = norm(u_diff,inf);
    figure(2)
    loglog(n,Error,'o')
    xlabel('resolution n')
    ylabel('first derivative error')
    hold on
end