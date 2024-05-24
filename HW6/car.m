function [T,X,U] = car(Tf, dt)
% car gets the distance and velocoity of a car given provided Differential
% Equations in a specified time interval. 
% Tf is the total time in the interval (starting at t=0)
% dt is the time interval
% returning T is a vector of time positions
% returning X is a vector of distances at cooresponding times
% returning U is a vevtor of velocities at cooresponding times
    T = 0:dt:Tf;

    size2D = size(T);
    sizeT = size2D(2);

    X = zeros(sizeT, 1);
    U = zeros(sizeT, 1);

    for t = 2:sizeT
        prevU = U(t - 1);
        prevX = X(t-1);
        prevTime = T(t - 1);

        u = prevU + 5*sech( prevTime / 10 ) * tanh( prevTime / 10 ) * dt;
        x = prevX + prevU*dt;

        U(t) = u;
        X(t) = x;
    end
end