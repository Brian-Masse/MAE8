clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 2;

%% Problem 1
p1a = linspace( 2, 998,  499.5 );
p1b = 1:2:999;

p1c = [p1b p1a];
p1d = length( p1c );

p1e = find(p1c==500);
p1f = [0 p1c];


len = length( p1f );
quart = len / 4;
p1g = p1f(1 + (1 * quart): (2 * quart));
p1h = p1f(1 + (2 * quart): (3 * quart));

p1i = -1:-2:-1999;
p1i = p1i';
p1j = p1i.^2;
p1k = sum(p1i);
p1l = prod( p1i( end - 4: end ));
p1m = cumsum( p1i );


%% Problem 2

forward = [ 1:2; 3:4 ];
backward = [ 2:-1:1; 4:-1:3 ];

p2a = zeros(10, 10);
p2a( 5:6,: ) = 5;
p2a( :,5:6 ) = 5;

p2a( 1:2, 1:2 ) = forward;
p2a( 3:4, 3:4 ) = forward;
p2a( 5:6, 5:6 ) = forward;
p2a( 7:8, 7:8 ) = forward;
p2a( 9:10, 9:10 ) = forward;

p2a( 9:10, 1:2 ) = backward;
p2a( 7:8, 3:4 ) = backward;
p2a( 3:4, 7:8 ) = backward;
p2a( 1:2, 9:10 ) = backward;

p2b = sum(p2a(:, 5));

mainDiag = diag(p2a);
oppDiag = diag(fliplr(p2a));
p2c = sum( [ mainDiag' oppDiag' ] );

p2d = sum(sum(p2a));
p2e = numel( find(p2a>2) );

%% Problem 3

p3a = [ 1 linspace(2, 98, 49) ];
p3b = [ 1 linspace(3, 99, 49) ];
p3c = [ mod(1:50, 2)==0  ] * -2 + 1;

p3d = sum((p3c.* p3a)./ p3b);

%% Problem 4

A = [ 2,5,10; 3,8,5 ];
B = [8,3; 7,4; 2,1];
C = [2,4,6; 1,2,3; 3,5,7];
D = [1,3; 5,7];

p4a = 'error';
p4b = A*B;
p4c = A*C;
p4d = 'error';
p4e = B*A;
p4f = B*D;
p4g = 'error';
p4h = C^2;
p4i = D^2;
p4j = isequal( A*B, B*A );

%% Problem 5

p5a = ones(5, 5).*9;
p5b = p5a;
p5b(:, 2) = 2;
p5c = p5b.';
p5d = rot90(rot90(rot90( p5b )));
p5e = true;

%% Problem 6

A = ones(4,4);
A(logical(eye(4))) = 4;
b = [0, 2, 4, 6];

x = b / A;
p6a = x;

x = b * inv(A);
p6b = x;

p6c = false;
p6d = abs( p6b - p6a );





