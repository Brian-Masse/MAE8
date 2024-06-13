clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 'final';
form = 'A';

%% Problem 1
% The data file SDtemperature.dat contains temperature record (in Fahrenheit) 
% in San Diego from 1852 to 2020. The data record has 13 columns: the first 
% column indicates the year, and the next twelve columns are the monthly 
% average temperature from January to December. Load the file into MATLAB 
% and perform the following exercises.

load('SDtemperature.dat')

dates = SDtemperature(:, 1);
temperatures = SDtemperature(:, 2:13);

% part a&b
maxTemp = max(max( temperatures ));
[row, col] = find( temperatures == maxTemp  );
year = dates(row);

p1a = maxTemp;
p1b = year;

% c&d
index_1982 = find(dates == 1982);
submatrix = temperatures( index_1982, : );
maxTemp_1982 = max( submatrix );

[year, month] = find( submatrix == maxTemp_1982 );

p1c = maxTemp_1982;
p1d = month;

% part e
index_1982 = find(dates == 1982);
index_2012 = find(dates == 2012);

coldOutsideRange = 3;

submatrix = temperatures( index_1982: index_2012, : );
count = length(find( submatrix < 65 )) - coldOutsideRange;
p1e = count;

% part f
seasonalAverages = zeros( length(dates), 1 );

for i = 1: length(dates)

    seasonalTemps = temperatures(i, [1, 2, 12]);
    average = sum( seasonalTemps ) / 3;
    seasonalAverages(i) = average;

end

p1f = seasonalAverages;


%% Problem 2: 
theta = -10: 0.1: 350;

x = cosd( 4 * theta ).* cosd( theta );
y = cosd( 4 * theta ).* sind(theta);
z = cosd(8 * theta);

% get tips of flowers
tipIndex = find( z == 1 );
xtip = x( tipIndex );
ytip = y( tipIndex );
ztip = z( tipIndex );

figure1 = figure(1);
hold on; box on; grid on;

flowerplot = plot3(x, y, z, 'm', 'LineWidth',3);

% scale up the marker size
pedalTip = scatter3( xtip, ytip, ztip, 'go', 'filled', 'LineWidth', 65);

view( 45, 60 );

title( "3 dimensional floral pattern" );
xlabel( "x" );
ylabel( "y" );
zlabel( "z" );

legend( [flowerplot, pedalTip], "Flower", "Tip of Pedal" )

p2a = 'See figure 1';

% part b
diffX = diff(x);
diffTheta = diff(theta);

index = find( theta == 90 );

deriv = diffX./ diffTheta;
derivValue = deriv( index );

p2b = derivValue;

% part c
diffY = diff(y);
diffZ = diff(z);

squres = sqrt( diffX.^2 + diffY.^2 + diffZ.^2 );
arclength = sum(squres);

p2c = arclength;

%% Problem 3: 

load('survey.mat')

% reading in and translating data
responses       = repmat( struct('year','', ...
                                'priorExp','', ...
                                'labSession','', ...
                                'grade','', ...
                                'minHours','', ...
                                'maxHours','', ...
                                'difficulty',''), length(survey), 1 );

for i = 1: length(survey)

    data = split(survey{i}, ' ');

    emptyValues = strcmp( data, '' ) | strcmp(data, '-');
    data(emptyValues) = [];

    responses( i ).year = data{1};
    responses( i ).priorExp = data{2};
    responses( i ).labSession = data{3};
    responses( i ).grade = data{4};
    responses( i ).difficulty = data{end};

end

student_years = char(responses.year);
freshmen = strcmp(student_years, "Freshman");
freshmen_count = sum(freshmen);

p3a = freshmen_count;

student_experience = char( responses.priorExp );
sub_prior_experience = student_experience( freshmen );
freshmen_with_exp = strcmp( sub_prior_experience, "Y" );

p3b = sum( freshmen_with_exp );

student_difficulty = char( responses.difficulty );
sub_difficulty = student_difficulty( freshmen_with_exp );
freshmen_with_exp_difficult = strcmp( sub_difficulty, "D" );

p3c = sum( freshmen_with_exp_difficult );

expected_grades = char( responses.grade );
sub_grades = expected_grades( freshmen_with_exp);
freshmen_with_exp_A = strcmp( sub_grades, "A" );

p3d = length( sub_grades )  - sum( freshmen_with_exp_A );


%% Problem 4: 
load('SDweather.mat')

dates = [SDweather.year]';

% part a&b
index_1950 = find( dates == 1950 );
subTemps = SDweather(index_1950).temperature;

minTemp = min( subTemps );
month = find( subTemps == minTemp );

p4a = minTemp;
p4b = month;

% part c&d
averages = [SDweather.annual_rainfall_avg]';
highestAverage = max(averages);
highestAverageIndex = find( averages == highestAverage );

highestAverageYears = dates( highestAverageIndex );

p4c = highestAverage;
p4d = highestAverageYears;

% part e
averages = [SDweather.annual_temperature_avg]';

highestAverage = max(averages);
highestAverageIndex = find( averages == highestAverage );
highestAverageYears = dates( highestAverageIndex );

lowestAverage = min(averages);
lowestAverageIndex = find( averages == lowestAverage );
lowestAverageYears = dates( lowestAverageIndex );

figure2 = figure(2);
hold on; box on; grid on;

plot = plot( dates, averages, 'k-', 'LineWidth',2);

lowestAveragePlot = scatter( lowestAverageYears, lowestAverage, 'bo', 'filled', 'LineWidth', 45);
highestAveragePlot = scatter( highestAverageYears, highestAverage, 'ro', 'filled', 'LineWidth', 45);

legend( [ plot, highestAveragePlot, lowestAveragePlot ], "Average Annual Temperature", "Highest Average", "Lowest Average", 'location', 'best' );
title( "Average Annual Temperature in San Diego (F)" );
xlabel( "year" );
ylabel( "Average Temperature (F)" );

p4e = 'See figure 2';

%% Problem 5: 
% Physics simulation

Xo = 0;
Yo = 0;
Zo = 50;

Uo = 12;
Vo = 18;
Wo = 25;

[T, X, Y, Z, U, V, W] = projectile3D(Xo, Yo, Zo, Uo, Vo, Wo);

% part a
p5a = [ X(end), Y(end), Z(end) ];
p5b = [ U(end), V(end), W(end) ];

% collecting data information to plot
zMax = max(Z);
max_index = find( Z == zMax );

xMax = X(max_index);
yMax = Y(max_index);

% find matching kinetic and potential energy
g = 9.81;
k = 0.5 * (U.^2 + V.^2 + W.^2);
p = g * Z;

potential_index = find( abs(p - k) < 1.5 );
x_potential = X( potential_index );
y_potential = Y( potential_index );
z_potential = Z( potential_index );


% plotting data
figure3 = figure(3);
hold on; grid on; box on;

plot3( X, Y, Z, 'k-', 'LineWidth', 3);

plot3( X(1), Y(1), Z(1), 'k.', 'MarkerSize', 25 );

plot3( xMax, yMax, zMax, 'rs', 'MarkerFaceColor','r', 'MarkerSize', 10 )

plot3( x_potential, y_potential, z_potential, 'b^', 'MarkerFaceColor','b', 'MarkerSize', 10 )

plot3( X(end), Y(end), Z(end), 'mdiamond', 'MarkerFaceColor','m', 'MarkerSize', 10)

view(3);

p5c = 'See figure 3';