clear all; close all; clc; format long
name = 'fill in your name';
id = 'fill in your id';
hw_num = 'final';
form = 'fill in your form letter (e.g., A, B, etc.)';

%% Problem 1: 
% You are to analyze the precipitation in San Diego. Load the file 
% rainfall.dat into MATLAB. The file includes the monthly-averaged 
% precipitation (in inches) from 1850 to 2021. The data is comma delimited 
% and the columns represent the year and the rainfall
% in Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, and Dec. 

load('rainfall.dat')


%% Problem 2: 



%% Problem 3: 
% You are to explore a contact list of 1,000 students given in the file 
% contact.mat. The file contains a 1000-row-by-4-column cell array contact.
% On each row are the last name, first name, class level and their phone
% number.

load('contact.mat')


%% Problem 4: 
% You are to analyze the US air transportation data from 2003 to 2022
% given in the file air_passenger.mat. The file contains a 20-element vector 
% of structure air_passenger with the following four fields: 
% year: to include the year 
% month: a vector from 1 to 12 denoting the months from Jan to Dec
% domestic: a vector to include the monthly numbers of domestic messengers
% international: a vector to include the monthly numbers of international messengers

load('air_passenger.mat')

index_2020 = 0;
index_2018 = 0;

moreDomesticFlyersInJuly = true;

% loop through all the data and perform any neccessary calculations
for i = 1:length(air_passenger) 
    yearlyData = air_passenger(i);

    if yearlyData.year == 2020
        index_2020 = i;
    end
    if yearlyData.year == 2018
        index_2018 = i;
    end

    if yearlyData.domestic( 7 ) < yearlyData.domestic( 12 )
        moreDomesticFlyersInJuly = false;
    end
end

% part a&b
data_2020 = air_passenger(index_2020);
p4a = max(data_2020.domestic);
p4b = min(data_2020.domestic);

% part c&d
data_2018 = air_passenger(index_2018);
p4c = data_2018.domestic(7);
p4c = data_2018.international(7);

% part e
aprilDomesticFlights = arrayfun( @(i) air_passenger(i).domestic(4), 1:numel(air_passenger) );
years = [air_passenger.year];

figure1 = figure(1);
hold on; grid on; box on;

bar( years, aprilDomesticFlights)
title( "# of domestic flights in April" )
xlabel( "year" )
ylabel( "# of domestic flights" )

p1f = moreDomesticFlyersInJuly;


%% Problem 5: Physics simulation

a = 5 * power(10, -8);
r = 0.3;

[T, S, I, R] = epidemic(a, r);

figure3 = figure(3);
hold on; grid on; box on;

plot(T, S, 'LineWidth',2);
plot(T, I, 'LineWidth',2);
plot(T, R, 'LineWidth',2);

% part 4
r_range = [0.2, 0.25, 0.3, 0.35];

figure4 = figure(4);
hold on; box on; grid on; axis tight; axis equal;
view(3)

for r = r_range 
  
[T, S, I, R] = epidemic(a, r);

plot3( S, I, R );

end