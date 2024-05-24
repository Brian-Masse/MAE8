clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 5;

tic

%% Problem 1
load('matrixA.mat', 'matrixA');
size = size(matrixA);

upperSum = 0;
lowerSum = 0;
exlcusiveSum = 0;
exclusiveProduct = 1;

for row = 1:size(1)
    for col = 1:size(2)
        value = matrixA(row, col);
        % partc
        if col / row ~= 2
            exlcusiveSum = exlcusiveSum + value;
        end

        % part d
        if value <= row 
            exclusiveProduct = exclusiveProduct * value;
        end

        if col < row
            lowerSum = lowerSum + value;
        elseif col > row
            upperSum = upperSum + value;
        end

        continue;
    end
end

p1a = upperSum;
p1b = lowerSum;
p1c = exlcusiveSum;
p1d = exclusiveProduct;

%% Problem 2
p2a = evalc('help car');

% part b-d
Tf = 30;
dt = 3;
[T1, X1, U1] = car( Tf, dt );

p2b = T1;
p2c= X1;
p2d = U1;

% part e-g
dt = 0.5;
[T2, X2, U2] = car( Tf, dt );

p2e = T2;
p2f= X2;
p2g = U2;

% plotting

figure1 = figure(1);

subplot( 2,1, 1 );

plot1 = plot( T1, X1, 'b:o', 'MarkerSize',4, 'MarkerFaceColor','b' );
hold on; grid on; box on;
plot2 = plot(T2, X2, 'r:^', 'MarkerSize',4, 'MarkerFaceColor','r');

title( "Distance vs Time of Car" )
xlabel( "time (seconds)" )
ylabel( "Distance (m)" )
legend( [plot1, plot2], "dt = 3s", "dt = 0.5s", 'location', 'best' )

subplot( 2, 1, 2);
plot1 = plot( T1, U1, 'b:o', 'MarkerSize',4, 'MarkerFaceColor','b' );
hold on; grid on; box on;
plot2 = plot( T2, U2, 'r:^', 'MarkerSize',4, 'MarkerFaceColor','r');

title( "Velocity vs Time of Car" )
xlabel( "time (seconds)" )
ylabel( "Velocity (m/s)" )
legend( [plot1, plot2], "dt = 3s", "dt = 0.5s", 'location', 'best' )

p2h = 'See figure 1';

%% Problem 3

p3a = evalc('help rocket');
p3b = evalc('help gravity');
p3c = evalc('help thrust');
p3d = evalc('help rocket>gravity');
p3e = evalc('help rocket>thrust');

% evaluating and visualizations
Tf = 120;
dt = 0.1;

[T, Z, W] = rocket( Tf, dt );
p3f = Z(end);
p3g = W(end);

figure2 = figure(2);

subplot(2, 1, 1);
plot1 = plot( T, Z, 'k-', 'LineWidth',2 );
hold on; grid on; box on;

title("altitude over time of Rocket");
xlabel("time (s)");
ylabel("Height (m)");
legend(plot1, "dt=0.1s", 'Location','best');

subplot(2, 1, 2);
plot1 = plot( T, W, 'k-', 'LineWidth',2 );
hold on; grid on; box on;

title("velocity over time of Rocket");
xlabel("time (s)");
ylabel("velocity (m/s)");
legend(plot1, "dt=0.1s", 'Location','best');

p3h = 'See figure 2';















