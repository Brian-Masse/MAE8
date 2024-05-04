clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 1;

%% Problem 1
% part a
dx = 0.1;
x = [0:dx:4];
f = cos(x) .* exp(1) .^ ( sin(x) );

dF = diff(f);
Df = dF / dx;
p1a = Df;

% part b
dx = 0.001;
x = [0:dx:4];
f = cos(x) .* exp(1) .^ ( sin(x) );

dF = diff(f);
Df = dF / dx;
p1b = Df;

% part c
i = (0.34 / dx) + 1;
p1c = p1b(i);

% part d
p1d = max( p1b );

%% Problem 2
% parta
dz = 0.1;
z = [-1: dz: 1];
g = (cosh(z) .^ 2) + (cos(z) .^ 4);

sum1 = sum( g(2:end) );
sum2 = sum( g(1:end-1) );

intg = 0.5 * dz * ( sum1 + sum2);
p2a = intg;

% partb
dz = 0.001;
z = [-1: dz: 1];
g = (cosh(z) .^ 2) + (cos(z) .^ 4);

sum1 = sum( g(2:end) );
sum2 = sum( g(1:end-1) );

intg = 0.5 * dz * ( sum1 + sum2);
p2b = intg;

%% Problem 3
% part a
date = clock();
p3a = date;

% part b
formatted = sprintf( "%4i:%02i:%02i", date(1:3) );
p3b = formatted;

% part c
formatted = sprintf( "%02i:%02i:%07.4f", date(4:6) );
p3c = formatted;

% part d
trimmedFormatting = sprintf( "%02i:%02i:%02.0f", date(4:6) );
p3d = trimmedFormatting;

% part e
fullDateTime = p3b + " " + p3d;
p3e = fullDateTime;

%% Problem 4
dtheta = 0.05 * pi;

% part a
theta = [0:dtheta: 20 * pi];
x = 0.1 * theta .* cos(theta);
y = 0.1 * theta .* sin(theta);

figure1 = figure(1);
plot( x, y, "rd-" );
xlabel( "x-axis" );
ylabel( "y-label" );
title( "parametric expression ( 0.1θcos(θ), 0.1θsin(θ) )" );
box on; grid on;

p4a='See figure 1';

% part b
dx = diff(x);
dy = diff(y);

segmentLength = sqrt( (dx).^2 + (dy).^2 );
arcLength = sum(segmentLength);
p4b = arcLength;

%% Problem 5
% part a
z = 0.1 * theta;

figure2 = figure(2);
plot3(x, y, z, "m-o");
xlabel( "x-axis" );
ylabel( "y-axis" );
zlabel( "z-axis");
title( "parametric expression ( 0.1θcos(θ), 0.1θsin(θ), 0.1θ )" );
box on; grid on;

p5a='See figure 2';

% part b
dz = diff(z);

segmentLength = sqrt( (dx).^2 + (dy).^2 + (dz).^2 );
arcLength = sum(segmentLength);
p5b = arcLength;

%% Problem 6
load("temperature.dat")
temperatures = temperature(:,2:13);
dates = temperature(:, 1);

% this is the max and index of the maxiumum temperature
max = max(max( temperatures ));
maxIndex = find( temperature == max );

% this is the number of rows in the temperature matrix
rows = length(temperatures(:, 1));

% this is the row and coloumnn of the maxiumum temperature
% in the temperature matrix
coloumnOfMax = floor(maxIndex / rows);
rowOfMax = maxIndex - (coloumnOfMax * rows);

p6a = coloumnOfMax;
p6b = temperature(rowOfMax);

% part c
subrange = temperatures( (dates>1850 & dates <1950), : );
tempAbove70 = subrange >=70;

count = sum(sum(tempAbove70));
p6c = count;

% part d
subrange = temperatures( (dates>1850 & dates<1950), 6:8 );
tempAbove70 = subrange >= 70;

count = sum(sum(tempAbove70));
p6d = count;

% part e & f
month = 1:12;
averages = sum(temperatures) / (rows);

figure3 = figure(3);
bar( month, averages );

xlabel( "month (Jan - Dec)" )
ylabel( "average temperature from 1852 - 2020 (F)")
title( "average temperature over year, San Diego" )
box on; grid on;

p6e='See figure 3';
p6f = 'On average, the temperature peaks in the month of August';

% part g
annualCycleMat = [ month', averages' ];
fileName = "annual_cycle.dat";

save( fileName, 'annualCycleMat', '-ascii' );

p6g = evalc('type(''annual_cycle.dat'')');


% part h
averages = (sum(temperatures, 2) / 12);

averagesAbove65 = averages>65;
averagesBelow60 = averages<60;

figure4 = figure(4);
avgPlot = plot( dates, averages, "k-", 'LineWidth',2 );
hold on; box on; grid on;

topDegreeLine = yline(65, "-r", 'LineWidth',2);
bottomDegreeLine = yline(60, "-b", 'LineWidth',2);

plot(dates(averagesAbove65), averages(averagesAbove65), "r.", 'MarkerSize',20)
plot(dates(averagesBelow60), averages(averagesBelow60), "bd", 'MarkerFaceColor', 'b', 'MarkerSize',5)

xlabel("year (1852 - 2020)");
ylabel("average annual temperature (F)");
title("average annual temperature over time, San Diego")
legend( [avgPlot, topDegreeLine, bottomDegreeLine], {"annual average", "65° F", "60° F"}, 'location', 'best' );

p6h='See figure 4';

% part i
p6i = 'On average, the temperature in San Diego increase';

























