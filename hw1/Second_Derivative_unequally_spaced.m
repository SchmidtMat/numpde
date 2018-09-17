function Second_Derivative_unequally_spaced()

NumberOfOrders = 5;
for Ij = 1:NumberOfOrders
    
    % Building randomly spaced grid from -1 to 1
    n = 4^Ij;
    Counter = 2;
    x= -1;
    while x(Counter-1,1) < 1
        x(Counter,1) = x((Counter-1),1) + rand/n;
        Counter = Counter+1;
    end
    x(Counter-1,1)= 1;
    [k,m] = size(x);
        
    u = zeros(k,1);
    u_2 = zeros(k,1);
    
    % Evaluating u at nodes
    for i = 1 : k
        u(i,1)=sin(x(i,1));
    end
    
    [D]=diff2mat_non_even(x);
    
    % Calculating derivatives
    u_2 = D * u;
    u_2 = u_2 ;
    
    %Plotting Real solution and finite difference solution
    figure(1)
    plot(x,u_2,'o')
    hold on
    plot(x,-sin(x))    
    
    %Calculating error with infinity norm
    u_diff = u_2+sin(x);
    
    Error = norm(u_diff,inf);
    figure(2)
    loglog(k,Error,'o')
    xlabel('resolution k')
    ylabel('first derivative error')
    hold on
end
end