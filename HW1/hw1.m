%% MAE8 Homework 1

clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 1;

%% Problem 1: 
p1a = pi / 0;
p1b = 0 / 0;
p1c = sqrt( -4 * pi );
p1d = cos( (75 * pi) / 180 );
p1e = sin( pi / 3 );
p1f = 1234 ^ 5;
p1g = 512 ^ (1/9);
p1h = log2(16384);
p1i = log10(1000000);
p1j = log( exp(1));
p1k = atand( 1 );
p1l = sinh( 6 );
p1m = atanh(1);

%% Problem 2:
p2a = char( 32 * pi );
p2b = char( 16 );
p2c = double( p2b );
p2d = int16( 'Z' );
p2e = int32( 'Z' );
p2f = single( 'Y' );
p2g = double( 'X' );
p2h = class(p2a);
p2i = 'Y' * 'Z';
p2j = double( 'Y' ) == int64( 'Y' );

%% Problem 3:

p3a = 'y' == 'Y';
p3b = 'y' > 'X';
p3c = 'z' < 'x';
p3d = log2(1024) == 10;
p3e = sin(100 * pi) ~= 0;
p3f = (3\9) + 1 < 3;
p3g = (3/9) + 1 < 3;

a = 3;
b = 4;
c = 5;

p3h = a >= b && a >= c;
p3i = a <= b && a >= c;
p3j = a >= b || a >= c;
p3k = a >= b || a <= c;
p3l = a < b || a < c;

%% Problem 4:

% help elfun

p4a = fix(2.5) == floor(2.5);
p4b = fix(2.4) == fix(-2.4);
p4c = fix(2.2) == floor(2.2);
p4d = fix(-2.2) == floor(-2.2);
p4e = fix(-2.2) == ceil(-2.2);
p4f = rem(5,3) == mod(5,3);
p4g = rem(5,-3) == mod(5,-3);

%% Problem 5:

% help format

p5a = '+';
p5b = 'RATIONAL';
p5c = 'BANK';
p5d = 'SHORTG';

%% Problem 6:
p6a = 'upper';
p6b = 32;
p6c = true;

%% Problem 7:

pounds = 1000; 
kilos = pounds / 2.2;
p7a = kilos;

fn = 5.6 ;
dynes = fn * 10 ^5;
p7b = dynes;

ftemp = 212;
ctemp = ( ftemp - 32 ) * (5/9);
p7c = ctemp;

mph = 65;
kmph = 65 * 1.6093;
p7d = kmph;

%% Problem 8:

r = 10;
theta = 84;

x = r * cosd( theta );
y = r * sind( theta );

p8a = x;
p8b = y;