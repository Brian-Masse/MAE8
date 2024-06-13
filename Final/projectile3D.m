
function [T, X, Y, Z, U, V, W] = projectile3D( Xo, Yo, Zo, Uo, Vo, Wo )

dt = 0.01;
g = 9.81;

T = 0;
X = Xo;
Y = Yo;
Z = Zo;

U = Uo;
V = Vo;
W = Wo;

running = true;

while running 

Xn = X(end);
Yn = Y(end);
Zn = Z(end);

Un = U(end);
Vn = V(end);
Wn = W(end);

Unew = Un;
Vnew = Vn;
Wnew = Wn - g * dt;

Xnew = Xn + Unew * dt;
Ynew = Yn + Vnew * dt;
Znew = Zn + Wnew * dt;

T(end + 1) = T(end) + dt;

if Znew <= 0
    running = false;
    break
end

X(end + 1) = Xnew; Y(end + 1) = Ynew; Z(end + 1) = Znew;
U(end + 1) = Unew; V(end + 1) = Vnew; W(end + 1) = Wnew;


end

return
end