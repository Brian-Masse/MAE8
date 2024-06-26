clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 4;

%% Problem 1

load("rainfall.dat")
rainfalls = rainfall( :,2:13 );
dates = rainfall(:, 1);

monthCount = 12;
rowCount = length(rainfalls');

firstYear = 1850 -1;

% part a
maxRainfall = max(max(rainfalls));
p1a = maxRainfall;

% part b & c
[yearIndex, monthIndex] = find( rainfalls == maxRainfall );
p1b = monthIndex;
p1c = rainfall( yearIndex, 1 );

% part d
subrange = rainfalls( dates>1900 & dates<2000, : );
rainfallsInRange = sum(sum(subrange >= 2 & subrange <= 5));
p1d = rainfallsInRange;

% part e
subrange = rainfalls( dates>1910 & 2010, : );
rainfallsInRange = sum(sum( subrange>4 ));
p1e = rainfallsInRange;

%% Questions 2

p2a = true;
p2b = true;
p2c = true;
p2d = false;

%% Question 3

p3a = true; 
p3b = true;
p3c = true;
p3d = true;
p3e = true;

%% Question 4

p4a = evalc( 'help divisibility' );
p4b = divisibility( 55 );
p4c = divisibility( 273 );
p4d = divisibility( 5505 );
p4e = divisibility( 15015 );

%% Question 5

p5a = evalc( 'help piecewise2d' );
p5b = piecewise2d( pi, pi );
p5c = piecewise2d( pi, -pi );
p5d = piecewise2d( -pi, pi );
p5e = piecewise2d( -pi, -pi );

p5f = piecewise2d( 0, 0 );
p5g = piecewise2d( 0, pi );
p5h = piecewise2d( 0, -pi );
p5i = piecewise2d( pi, 0 );
p5j = piecewise2d( -pi, 0 );


%% Question 6
p6a = evalc( 'help rgb_color' );
p6b = rgb_color( [1,1,0] );
p6c = rgb_color( [0,1,1] );
p6d = rgb_color( [1,0,1] );
p6e = rgb_color( [1,1,1] );
p6f = rgb_color( [1,0,0] );
p6g = rgb_color( [0,1,0] );
p6h = rgb_color( [0,0,1] );
p6i = rgb_color( [0,0,0] );


%% Question 7

p7a = evalc('help days_in_month');
p7b = days_in_month( 'jan', 0 );
p7c = days_in_month( 'apr', 0 );
p7d = days_in_month( 'aug', 1 );
p7e = days_in_month( 'oct', 0 );
p7f = days_in_month( 'nov', 1 );
p7g = days_in_month( 'feb', 0 );
p7h = days_in_month( 'feb', 1 );
p7i = days_in_month( 'Dec', 0 );


%% Question 8

p8='See survey data';










































