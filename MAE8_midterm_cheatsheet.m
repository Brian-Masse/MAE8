clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

%% Order of Precident
% 1) parenthesis ()
% 2) power
% 3) Unary: Negation, not ~
% 4) Multiplication and Division
% 5) Addition and Subtraction
% 6) Relational: >, <, ==, ~=, 
% 7) &&
% 8) ||
% 9) assignment: =

% xor is exclusive or

%% Computing Integrals
% the 'step' of the variable, and the width of the trapezoids
dx = 0.1;

% the bounds of integration
a = -1;
b = 1;

x = -1: dx: 1;
g = (cosh(x) .^ 2) + (cos(x) .^ 4);

% get the sum of all the left and right edges of the trapezoids
sum1 = sum( g(2:end) );
sum2 = sum( g(1:end-1) );

% complete the integration
intg = 0.5 * dx * ( sum1 + sum2 );

%% Computing Derivatives
dx = 0.1;

x = -1:dx:1;
f = x.^2;

% get the consequtive difference in x and f 
% (the step of the domain and the function)
diffX = diff(x);
diffF = diff(f);

derivative = (diffF./ diffX);

%% Reading / writing to files
% gives a matrix representing the contents of the file
% load("filename.dat");

% file name of the saved data
fileName = "annual_cycle.dat";
% put the dataMatrix in single quoations when saving a file
% save( fileName, 'dataMatrix', '-ascii' );

%% Figures

% gives all the related information to plotting
% including the different marker styles
help plot

% this creates a new displayed figure
fig1 = figure(1);

% plot1 can be referenced in the legend to create custom labels
% plot1 = plot( dates, data )

% this plots a single line at the position y=65
% it can be decoreated as any other plot on a figure
% line can be used in formatting the legend
% line = yline(65);

% xlabel("year (1852 - 2020)");
% ylabel("average annual temperature (F)");
% title("average annual temperature over time, San Diego")
% legend( [avgPlot, topDegreeLine, bottomDegreeLine], {"annual average", "65° F", "60° F"}, 'location', 'best' );














