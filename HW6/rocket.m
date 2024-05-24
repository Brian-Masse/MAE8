function [T,Z,W] = rocket( Tf, dt )
% rocket gets the velocity and altitude of a model rocket being launched
% Tf is the time interval, starting at 0
% dt is the approximated time step
% returning T is a vector of time positions
% returning X is a vector of distances at cooresponding times
% returning U is a vevtor of velocities at cooresponding times

    m = 10;

    T = 0: dt: Tf;
    size2D = size(T);
    sizeT = size2D(2);

    W = zeros(sizeT, 1);
    Z = zeros(sizeT, 1);

    for t = 2:sizeT
        prevT = T(t - 1);
        prevW = W(t - 1);
        prevZ = Z(t - 1);

        prevTh = thrust(prevT);
        prevG  = gravity(prevZ);

        nextW = prevW + ( -prevG + (prevTh/m) ) * dt;
        nextZ = prevZ + (nextW * dt);

        W(t) = nextW;
        Z(t) = nextZ;
    end
end

function [Th] = thrust(t)
% thrust calculates the upward thrust due the propoulsion of the rocket
% in thsi model it is a piecewise function that varies with time t

if t >= 0 && t < 2
    Th = 670;
elseif t >= 2 && t < 4
    Th = 1366.5;
elseif t>=4
    Th = 0;
end
end

function [g] = gravity(z)
% gravity calculates the gravity experienced by the rocket
% as a function of its current altitutde, z
if z >= 0 && z < 10000
    g = 9.81 * ( 1 - ( z / 10000)^3 );
elseif z >= 10000
    g = 0;
end
end