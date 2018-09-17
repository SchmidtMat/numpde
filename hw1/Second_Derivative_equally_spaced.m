function Second_Derivative_equally_spaced()

NumberOfOrders = 5;
for Ij = 1:NumberOfOrders
    
    % Building randomly spaced grid from -1 to 1
    n = 4^Ij;
    h =2/(n-1);
    nn(Ij)=n;
    hh(Ij)=h;
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
    
    Error(Ij) = norm(u_diff,inf);
end
    figure(2)
    loglog(hh,Error,'o')
    xlabel('step size h')
    ylabel('first derivative error')
    hold on
    loglog(hh,hh.^2,'-')
    
    legend('diff2 even grid','h^2')
end