clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 'midterm';
form = 'A';

%% Problem 1
date = clock();

year = sprintf( "%4i/%02i/%02i", date(1:3) );
time = sprintf( "%02i:%02i:%02i", date(4:6) );

p1a = "At " +time+ " on " +year+ ", I affirm that I will not give or receieve any anuathorized help on this exam, and that all work will be my own.";

%% Problem 2
n = 1:1:100;
p2a = n;

% part b
lhs = (n+1).* (3 .^ ( n + 1 ));
p2b = lhs;

% part c
results = find( lhs > 10 ^ 20 );
firstValue = results(1);
p2c = firstValue;

%% Problem 3
matA = 1:225;
matA = abs( ceil( 100*cos(matA/10) ) );
matA = reshape(matA, 15, 15);

p3a = matA( end, : );
p3b = diag(matA);

extractingVector = [2:2:6];
extraction = matA( :, extractingVector );
p3c = extraction;

divisible = sum(sum(mod( matA, 11) == 0)) > 0;
p3d = divisible;

% part f
p3e = matA + 20;
% max = max(max(matA));
% locationsOfMax = find( matA == max );
% matA( locationsOfMax ) += 20

%% Problem 4

dx = 10;
startValue = -7200;
endValue = 7200;

x = startValue:dx:endValue;
f = cosd( (1/360) .* (x+360) ) .* exp(1).^(-(x/3600).^2);

p4a = x;
p4b = f;

% part c
diffX = diff(x);
diffF = diff(f);

derivative = diffF ./ diffX;
fastestVelocity = max(derivative);
index = find( derivative == fastestVelocity );
p4c = x(index);

% part d
sum1 = sum( f(2:end) );
sum2 = sum( f(1: end - 1) );

intf = 0.5 * dx * ( sum1 + sum2 );
p4d = intf;

%% Problem 5
p5a = 'See figure 1';

x = linspace( -2, 2, 100 );

y1 = 2*(sech(x).^2);
y2 = abs( 2 * x.^3 ) - 1;

solutions = find(y1 >= y2);

% plotting figure
fig1 = figure(1);
hold on;
box on;

y1Plot = plot(x, y1, "--",  'LineWidth',2 );
y2Plot = plot(x, y2, ":",  'LineWidth',2 );

solutionsPlot1 = plot( x(:, solutions), y1(:, solutions), "ko", 'MarkerFaceColor', 'k', 'MarkerSize',5 );
solutionsPlot2 = plot( x(:, solutions), y2(:, solutions), "ko", 'MarkerFaceColor', 'k', 'MarkerSize',5 );

xlabel("x");
ylabel("y");
ylim([-2,4]);
title("Solution to system of nonlinear inequality equations")
legend( [y1Plot, y2Plot, solutionsPlot1], "y= 2 sech^2(x)", "y = |2x^3| - 1", "solution boundaries", 'location', 'best' )

% part b
xSolutions = x(:, solutions);
extremumSolutions = [ min(xSolutions), max(xSolutions) ];
p5b = extremumSolutions;

% part c
y1Solutions = y1( :, solutions );
y2Solutions = y2( :, solutions );

dx = diff(xSolutions);
dy1 = diff(y1Solutions);
lengths = ( dx.^2 + dy1.^2 ).^(1/2);

topArcLength = sum(lengths);

dy2 = diff(y2Solutions);
lengths = (dx.^2 + dy1.^2).^(1/2);

bottomArcLength = sum(lengths);

arcLength = topArcLength + bottomArcLength;
p5c = arcLength;
