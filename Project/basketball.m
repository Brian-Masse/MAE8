function [T, X, Y, Z, U, V, W, status] = basketball( Xo, Yo, Zo, Umag0, theta, phi, omgX, omgY, omgZ)
% basketball calculates the trajector information for a shot given a set of 
% initial conditions. Uses a time step of dt = 0.01;
% 
% the shot ends when it is out of bounds or touches the rim
% 
% INPUTS 
% - Xo : the starting x position of the ball
% - Yo : the starting Y position of the ball
% - Zo : the starting Z position of the ball
% - Umag0 : the magnitude of the initial velocity of the ball
% - theta : the angle in the XY plane
% - phi   : the angle in the z direction
% - omgX : the starting angular velocity in about the x axis
% - omgY : the starting angular velocity in about the y axis
% - omgZ : the starting angular velocity in about the Z axis
% 
% OUTPUTS:
% - T   : vector of time stamps
% - X   : vector of the ball's x position
% - Y   : vector of the ball's y position
% - Z   : vector of the ball's z position
% - U   : vector of the ball's x velocity
% - V   : vector of the ball's y velocity
% - W   : vector of the ball's z velocity
% - status   : whether the shot was successful or not


%% Constants
Cd = 0.3;
Cm = 0.13;
r = 0.12;
p = 1.2;
m = 0.625;
g = 9.81;

A = pi * r^2;

dt = 0.01;

%% Initial Conditions
% the initial for all the returning vectors
T = 0;
X = Xo;
Y = Yo;
Z = Zo;
U = Umag0 * cosd(theta) * cosd(phi);
V = Umag0 * sind(theta) * cosd(phi);
W = Umag0 * sind(phi);

status = 0;

%% Trajectory logic

i = 1;
shotEnded = false;

while ~shotEnded

    Xn = X(i);
    Yn = Y(i);
    Zn = Z(i);

    Un = U(i);
    Vn = V(i);
    Wn = W(i);

    % resued products
    factor1 = (Cd * p * A) / (2 * m);
    factor2 = sqrt( Un^2 + Vn^2 + Wn^2 );
    factor3 = (Cm * p * A * r) / (2 * m);

    % new velocity vectors
    Unew = Un - ( factor1 * factor2 * Un - factor3 * ( omgY * Wn - omgZ * Vn ) ) * dt;
    Vnew = Vn - ( factor1 * factor2 * Vn - factor3 * ( omgZ * Un - omgX * Wn ) ) * dt;
    Wnew = Wn - ( factor1 * factor2 * Wn - factor3 * ( omgX * Vn - omgY * Un ) + g) * dt;

    Xnew = Xn + Unew * dt;
    Ynew = Yn + Vnew * dt;
    Znew = Zn + Wnew * dt;

    X(i + 1) = Xnew;
    Y(i + 1) = Ynew;
    Z(i + 1) = Znew;
    
    U(i + 1) = Unew;
    V(i + 1) = Vnew;
    W(i + 1) = Wnew;

    T(i + 1) = T(i) + dt;
    i = i + 1;

    [shotEnded, status] = checkShotEnded(Xnew, Ynew, Znew, status);
end
end

%% checkShotEnded
% given a coordinate in space, check if the ball is either in the net
% or out of the court
function [shotEnded, status] = checkShotEnded( X, Y, Z, incomingStatus )

%% Constant data
r = 0.12;
dRim = 0.46;

%% Get the bounds of the net
% these are the values to check for collisions for the basketball
% these were orginally computed by taking min and max from the court
% data
netZ = 3.05;
netMinX = -1.89;
netMinY = -0.23;

netMaxX = -1.43;
netMaxY = 0.23;

boardX = -1.2;
boardMinY = -0.915;
boardMaxY = 0.915;
boardMinZ = 3.014285714285714;
boardMaxZ = 4.028571428571425;

status = incomingStatus;
shotEnded = 0;

% check if the ball is out of court
if ( X > 0 || Y > 7 || Z < 0 )
    shotEnded = 1;

    return;
end

% check if the ball is in the net
if ( X - r > netMinX && X + r < netMaxX ...
    && Y - r > netMinY && Y + r < netMaxY ...
    && abs( Z - netZ ) <= 0.05 )

    status = 1;
    return;
end

% check if the ball hit the board
if (   abs( X - boardX ) < r ...
    && Y + r > boardMinY && Y - r < boardMaxY ...
    && Z + r > boardMinZ && Z - r < boardMaxZ)

    shotEnded = 1;
    return;
end

% check if the ball hit the net
if (   (abs( X - netMinX ) < r || abs( X - netMaxX) < r) ...
    && (abs( Y - netMinY ) < r || abs( Y - netMaxY) < r) ...
    &&  abs( Z - netZ) < r )
    shotEnded = 1;
    return;
end
end