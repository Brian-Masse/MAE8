clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 5;

tic
%% Problem 1
% part a & b
runningSumA = 0;
runningSumB = 0;

for n = 1: 100 
    runningSumA = runningSumA + 1/(n^2 + n);
    runningSumB = runningSumB + (2^n) / (factorial(n));
end

p1a = runningSumA;
p1b = runningSumB;

% part c & d
runningSumC = 0;
runningSumD = 0;

for m = 0:100
    for n = 0:100
        value = 3^-(m+n);
        runningSumC = runningSumC + value;
        if n <= m 
            runningSumD = runningSumD + value; 
        end
    end
end

p1c = runningSumC;
p1d = runningSumD;

%% Problem 2

evaluationA = 1;
evaluationB = 1;
evaluationC = sqrt(2);

for i = 1:9
    evaluationA = sqrt( 1 + evaluationA );
    evaluationB = sqrt(1 + 2*evaluationB);
    evaluationC = sqrt(2 + (-1)^i * evaluationC );
end

p2a = evaluationA;
p2b = evaluationB;
p2c = evaluationC;

%% Problem 3
% check c and d with alt method

bounceHeight = 10;
bounceCount = 0;
totalDistance = 0;

while totalDistance <= 69.99
    newHeight = bounceHeight * 0.75;
    totalDistance = totalDistance + bounceHeight + newHeight;
    bounceHeight = newHeight;
    bounceCount = bounceCount + 1;
end

p3a = bounceCount;
p3b = bounceHeight;
p3c = bounceHeight * 0.75;
p3d = totalDistance + bounceHeight;

%% Problem 4

load('stringA.mat', 'stringA');

youCount = 0;
sayCount = 0;
howCount = 0;

codeCount = 0;
willCount = 0;
loopCount = 0;

len = length(stringA);
for i = 1:len
    c = lower(stringA(i));
    % part a - c
    if c == 'y' || c == 's' || c == 'h'
        substring = lower(stringA(i:min(i+2, len)));
        switch substring
            case "you" 
                youCount = youCount + 1;
            case "say"
                sayCount = sayCount + 1;
            case "how"
                howCount = howCount + 1;
        end
    end

    % part d - f 
    if c=='c' || c=='w' || c=='l'
        substring = lower(stringA(i:min(i+3, len)));
        switch substring
            case "code"
                codeCount = codeCount + 1;
            case "will"
                willCount = willCount + 1;
            case "loop"
                loopCount = loopCount + 1;
        end
    end
end

p4a = youCount;
p4b = sayCount;
p4c = howCount;
p4d = codeCount;
p4e = willCount;
p4f = loopCount;

%% Problem 5

load( 'terrain.mat', 'x', 'y', 'altitude' )

size = size(altitude);
maximums = zeros( size );
minimums = zeros( size );

for i=1:size(1)
    xmin = max( i - 1, 1 );
    xmax = min( i + 1, size(1) );

    for j=1:size(2)
        ymin = max( j - 1, 1);
        ymax = min( j + 1, size(2) );

        height = altitude(i, j);
        surroundingHeights = [ altitude(xmin, j), altitude(i, ymax), altitude(xmax, j), altitude(i, ymin) ];

        if max( surroundingHeights ) <= height 
            maximums( i, j ) = 1;
        end

        if min(surroundingHeights) >= height
            minimums(i, j) = 1;
        end 
    end
end

% part a-d
% represents the indecies of the peaks broken up by x and y coords
[xPeaksIndex, yPeaksIndex] = find(maximums==1);
xPeaks = x(xPeaksIndex);
yPeaks = y(yPeaksIndex);

totalPeaks = sum(sum(maximums));

scaled = maximums.* altitude;
peaks = altitude( scaled ~= 0 );

p5a = totalPeaks;
p5b = xPeaks;
p5c = yPeaks;
p5d = peaks;

% part e-h
[xTroughsIndex, yTroughsIndex] = find(minimums==1);
xTroughs = x(xTroughsIndex);
yTroughs = y(yTroughsIndex);

totalTroughs = sum(sum(minimums));

scaled = minimums.* altitude;
troughs = altitude( scaled ~= 0 );

p5e = totalTroughs;
p5f = xTroughs;
p5g = yTroughs;
p5h = troughs;

% part i, j
figure1 = figure(1);

[X, Y] = meshgrid(x, y);

surf(X,Y,altitude')
shading interp
box on; grid on; hold on

xlabel("x (meters)")
ylabel("y (meters)")
zlabel("altitude (meters)")
title("Altitude Map")

% labeling peaks + troughs
peakPlot = scatter3( xPeaks, yPeaks, peaks, "filled", "r", 'LineWidth',30 );
troughPlot = scatter3( xTroughs, yTroughs, troughs, "filled", "g", 'LineWidth',30 );

% extra credit
steps = 100;
[startXIndex, startYIndex] = find(altitude == max(max(altitude)));

endXIndex = find(x == -800);
endYIndex = find(y == -600);

xIndexPath = round(linspace(endXIndex, startXIndex, steps));
yIndexPath = round(linspace(endYIndex, startYIndex, steps));

xPath = x(xIndexPath);
yPath = y(yIndexPath);

altitudes = zeros( steps, 1 );

for i=1:steps
    altitudes(i) = altitude( xIndexPath(i), yIndexPath(i) );
end

pathPlot = scatter3( xPath, yPath, altitudes, "filled", "m", 'LineWidth',30 );

legend([peakPlot, troughPlot, pathPlot], {"peak", "trough", "projected path"}, 'location', 'best')

p5i = "See figure 1";
p5j = "See projection of dive path";

toc
























