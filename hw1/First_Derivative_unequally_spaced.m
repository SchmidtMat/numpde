function First_Order_Random_Spaced()

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
    
    hh_ave(Ij) = 2/k;
    nn(Ij)=n;
    
    % Determine step size for node i
    for i = 1 : k-1
        h(i,1) =x(i+1,1)-x(i,1);
    end
    h(k,1) =x(k)-x(k-1);
    
    u = zeros(k,1);
    u_1 = zeros(k,1);
    
    % Evaluating u at nodes
    for i = 1 : k
        u(i,1)=sin(x(i,1));
    end
    
    [D] = diffmat_non_even(x);
    % Calculating derivatives
    u_1 = D * u;
    u_1 = u_1 ./(h);
    
    %Plotting Real solution and finite difference solution
    figure(1)
    plot(x,u_1,'o')
    hold on
    plot(x,cos(x))
    
    u_diff = u_1-cos(x);
    
    Error(Ij) = norm(u_diff,inf);
end
    figure(2)
    loglog(hh_ave,Error,'o')
    xlabel('step size h')
    ylabel('first derivative error')
    hold on
    loglog(hh_ave,hh_ave,'-')
    
    legend('diff1 even grid','h-ave')
end