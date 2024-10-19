%Simulates and returns trajectory
function [xPlot, uPlot, tsegment, odeStopped] = simulation_2pbvp(ti, tf, numPoints, K, consts, MOI, xcrit, limits, aug_eoms, u_sol)
    %SIMULATE
    stopTime = 2.5;
    odeStopped = false;
    tsegment = linspace(ti, tf, numPoints);
    timer = tic;
    
    

    try
        
    catch

    end
end

function ydot = bvp_ode(~, y, K, consts, MOI, limits)
    % Extract constants
    m = consts(1);
    l = consts(2);
    g = consts(3);
    J1 = MOI(1, 1);
    J2 = MOI(1, 2);
    J3 = MOI(1, 3);
    J4 = MOI(2, 1);
    J5 = MOI(2, 2);
    J6 = MOI(2, 3);
    J7 = MOI(3, 1);
    J8 = MOI(3, 2);
    J9 = MOI(3, 3);
    
    % Extract individual states
    r1 = y(1);
    r2 = y(2);
    r3 = y(3);
    v1 = y(4);
    v2 = y(5);
    v3 = y(6);
    q1 = y(7);
    q2 = y(8);
    q3 = y(9);
    omega1 = x(10);
    omega2 = x(11);
    omega3 = x(12);

    % Extract costates
    c1 = y(13);
    c2 = y(14);
    c3 = y(15);
    c4 = y(16);
    c5 = y(17);
    c6 = y(18);
    c7 = y(19);
    c8 = y(20);
    c9 = y(21);
    c10 = y(22);
    c11 = y(23);
    c12 = y(24);

    % Extract control inputs
    % CALC U
    beta = u(1);
    gamma = u(2);
    throttle = u(3);
    tau_RW = u(4);
    
    u = double(subs(u_sol, ))


end

function res = bcfun(x, xcrit)
    res = xcrit - x;
end

function [value,isterminal,direction] = time_EventsFcn(~, ~, timer, stopTime) 
    value = 1; % The value that we want to be zero 
    if stopTime - toc(timer) < 0 % Halt if he has not finished in 3     
        error("ODE45:runtimeEvent", "Integration stopped: time longer than %f seconds", stopTime)
    end 
    isterminal = 1;  % Halt integration  
    direction = 0; % The zero can be approached from either direction 
end