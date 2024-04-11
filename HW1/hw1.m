%% MAE8 Homework 1

clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 1;

%% Single part question
% Problem 1: 
% Compute sine of 180 degrees and put the answer into p1.
p1 = sind(180);

%% multi part question
% Problem 2: 
% (a) Compute natural log of 2pi and put the answer into p2a.
p2a = log(2*pi);

% (b) Round 2pi to nearest integer toward zero and put the answer into p2b.
p2b = fix(2*pi);

% (c) Compute the mean value of vector [1,2,3] and put the answer into p2c.
p2c = mean(1:3);

% (d) If the frictional drag continues to increase, what happens to the 
% velocity? Write your answer in p2d.
p2d = 'The velocity will decrease in time.';
