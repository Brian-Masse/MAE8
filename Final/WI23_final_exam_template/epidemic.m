function [T, S, I, R] = epidemic(a, r)

dt = 0.01;

T = 0;
S = [power(10, 7)];
I = 2;
R = 0;

running = true;

while running

    Sn = S(end);
    In = I(end);
    Rn = R(end);

    Snew = Sn - a * Sn * In * dt;
    Inew = In + (a*Sn*In - r*In) * dt;
    Rnew = Rn + r *In * dt;
   
    if Inew < In
        running = false;
        break;
    end

    S(end + 1) = Snew;
    I(end + 1) = Inew;
    R(end + 1) = Rnew;
    T(end + 1) = T(end) + dt;

end

return;

end