clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = "project";

tic

%% [TASK I] Draw Court Geometry
% sketches the court, hoop and backboard
load('court_geometry.mat');

figure(1); hold on;

plot3(Xcourt,Ycourt,Zcourt,'.','color',[0.5 0.2 0.3]);
plot3(Xrim,Yrim,Zrim,'.','color',[.8 0 0.8]);
plot3(Xboard,Yboard,Zboard,'-','color',[1 0.9 1]);

box on; grid on; axis tight; axis equal;

xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
title('Basketball Court & Test Shots');

% view the court isographically
view(3); 

set(gca,'FontSize',16);



%% TASK II: Plotting Test Throws
% iterates throuhg predetermined throw data and calculate the trajectory
% vectors, then plots them onto the court

shotCount = 7;

% holds the shot data in a structure
ball_stat = repmat( struct('shot_number',0, 'time',0, 'max_height_position',0, 'landing_position',0 , 'landing_speed',0, 'travel_distance',0), 7, 1 );

% preparing the plots + labels for the legend
colors = [ "#B9FFB7", "#ABEDC6", "#98D9C2", "#F19A3E", "#996639", "#6D4C36", "#403233" ];
plots =     zeros(shotCount(1), 1);
labels =    strings(shotCount(1), 1);

% plot all the trajectories
disp("loading test shots")
for i = 1:shotCount(1)

[Xo, Yo, Zo, Umag0, theta, phi, omgX, omgY, omgZ] = read_input("test_study_parameter.txt", i);
[T, X, Y, Z, U, V, W, status] = basketball( Xo, Yo, Zo, Umag0, theta, phi, omgX, omgY, omgZ );

% plot the shot
% uses a fillled circle for the shots end, and a * for the origin
trajectory = plot3(X, Y, Z, '-', 'LineWidth',2, 'Color',colors(i));

plot3(X(end), Y(end), Z(end), 'r.', 'LineWidth',2, 'MarkerSize',15, 'Color',colors(i) )
plot3(X(1), Y(1), Z(1), 'r*', 'LineWidth',2, 'MarkerSize',10, 'Color',colors(i) )

plots(i) = trajectory;
labels(i) = "shot" + i;



%% Task III: Save shot information to struct
% record information for the shot
% and store it in the 'ball_stat' struct
shot_number = i;
time = T(end);

maxHeightIndex = find( Z == max(Z) );
maxHeightPosition = [ X(maxHeightIndex), Y(maxHeightIndex), Z(maxHeightIndex) ];

landingPosition = [ X(end), Y(end), Z(end) ];

landingSpeed = sqrt( U(end)^2 + V(end)^2 + W(end)^2 );

% calculating the arc length of the shot
diffX = diff(X);
diffY = diff(Y);
diffZ = diff(Z);
distances = sqrt(diffX.^2 + diffY.^2 + diffZ.^2);
travelDistance = sum( distances );

% save it to the struct
ball_stat(i).shot_number = shot_number;
ball_stat(i).time = time;
ball_stat(i).max_height_position = maxHeightPosition;
ball_stat(i).landing_position = landingPosition;
ball_stat(i).landing_speed = landingSpeed;
ball_stat(i).travel_distance = travelDistance;

end

legend( plots, labels, 'location', 'best' );



%% TASK IV: Writing Data to Human Readable File
% translate the structs of shot data into a .txt file

header = "shot number, travel time (s), landing speed (m/s), travel distance(m)";

% provide the header information
data = strings(10, 1);
data(1) = name;
data(2) = id;
data(3) = header;

for i = 1:shotCount(1)
    shot = ball_stat(i);

    info = sprintf( "%d, %15.9e, %15.9e, %15.9e", shot.shot_number, shot.time, shot.landing_speed, shot.travel_distance );

    data(3 + i) = info;
end

% save the file to a new 'report.txt' file
writematrix( data, "report.txt" );



%% TASK V: Optimal Shooting Angle Study
% plots the success rate of shots based on the starting height and angle

% loading in the data
import = importdata('best_angle_study_parameter.txt');
shots = import.data;
shotCount = size(shots);

% collecting data
initialHeights  = shots( :, 4 );
thetas = shots( :, 7 );
successfulShots = false(shotCount(1), 1);

% computing the trajectory data
disp("loading best angle study shots")
for i = 1: shotCount(1)
shot = shots( i, 2:end );

progress = i / shotCount(1) * 100;

if mod(progress, 5) == 0 
fprintf( "%d%", progress );
disp("% [" + i + "] shots loaded");
end

[T, X, Y, Z, U, V, W, status] = basketball( shot(1), shot(2), shot(3), shot(4), shot(5), shot(6), shot(7), shot(8), shot(9) );

if status 
    successfulShots(i) = 1;
end
end

% plotting
figure2 = figure(2);
box on; hold on; grid on;

failedShots = logical(abs(successfulShots - 1));

fShots = plot( initialHeights(failedShots), thetas(failedShots), '.k', 'MarkerSize',15);
sShots = plot( initialHeights(successfulShots), thetas(successfulShots), '.r', 'MarkerSize',15);

% labelling
xlabel( "Initial Shot Height (Zo) (m)" );
ylabel( "Shooting Angle (degrees)" );
title( "Best Angle Study (Shooting height x angle)" );

legend( [sShots, fShots], "successful shots", "failed shots" );
set(gca,'FontSize',10);


%% Submission

help read_input
help basketball

p1 = 'See figure 1';
p2a = ball_stat(1);
p2b = ball_stat(2);
p2c = ball_stat(3);
p2d = ball_stat(4);
p2e = ball_stat(5);
p2f = ball_stat(6);
p2g = ball_stat(7);
p3 = evalc('type report.txt'); p4 = 'See figure 2';

toc