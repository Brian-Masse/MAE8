function f = piecewise2d(x, y)
% f is a 2 dimensional piecewise function, taking in an x and y. It outputs
% 5x+5y if x>=0 and y>0
% -5x+5y if x <0 and y>=0
% -5x -5y if x<=0 and y<0
% 5x -5y if x>0 and y <=0
% and 0 otherwise

if x>=0 && y>0
    f = 5*x + 5*y;

elseif x<0 && y>=0
    f = -5*x + 5*y;

elseif x<=0 && y<0
    f = -5*x - 5*y;

elseif x>0 && y<=0
    f = 5*x - 5*y;

else
    f = 0;

end

