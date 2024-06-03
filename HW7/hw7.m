clear all;   % This clears all workspaces
close all;   % This closes all figures 
clc;         % This clears the command window
format long; 

name = 'Brian Masse';
id = 'A17991084';
hw_num = 5;

tic

%% Problem 1
load('cellA.mat', 'cellA');

% part a - d
p1a = size(cellA);

col1 = cellA( :, 1 );
p1b = col1;

endRow = cellA( end, : );
p1c = endRow;

content = cellA{3, 2};
p1d = content;

% part e
col1Size = size(col1);
for i = 1:col1Size(1)
    name = col1{i};

    name(1) = upper(name(1));

    lastNameIndex = strfind(name, ' ') + 1;
    name(lastNameIndex) = upper( name(lastNameIndex) );

    col1{i} = name;
end

p1e = col1;

%% Problem 2
student1Grades = [70 71 72 73 74 75 76];
student2Grades = [90 91 92 93 94 95 96];
student3Grades = [80 81 82 83 84 85 86];

names       = [ "Jack Lew" "Peter Hamilton" "Susan West" ];
PIDs        = [ "A11" "A12" "A13" ];
homeworks   = [student1Grades; student2Grades; student3Grades];
projects    = [86, 85, 87];
midterms    = [83, 73, 93];
final_exams = [93, 90, 96];

students = repmat( struct('name','', 'PID','', 'homework','', 'project', '', 'midterm','', 'final_exam',''), 3, 1 );

for i = 1:3
    students(i).name            = names(i);
    students(i).PID             = PIDs(i);
    students(i).homework        = homeworks(i, :);
    students(i).project         = projects(i);
    students(i).midterm         = midterms(i);
    students(i).final_exam      = final_exams(i);
end

p2a = students(1);
p2b = students(2);
p2c = students(3);

% part d 
for i = 1:3
    sum = 0;
    len = size(students(i).homework, 2);

    for j = 1:len
        sum = sum + students(i).homework(1, j);
    end

    students(i).hw_average = sum / len;
end

p2d = [students.hw_average];

%% Problem 3
% import data
results = importdata('survey results.txt', '\t');

responsesSize   = size(results, 1);
responses       = repmat( struct('year','', ...
                                'priorExp','', ...
                                'labSession','', ...
                                'grade','', ...
                                'minHours','', ...
                                'maxHours','', ...
                                'difficulty',''), responsesSize, 1 );

% reformat data into struct
% add them to vector of responses
for i = 1:responsesSize
    
    data = results{i, :};
    data = split(data, ' ')';
    
    % remove all empty characters
    emptyValues = strcmp( data, '' ) | strcmp(data, '-');
    data(emptyValues) = [];

    % account for >= 10 hours
    minHours = data(5);
    maxHours = data(6);

    if strcmp(minHours, ">=")
        minHours = data(6);
        maxHours = 'inf';
    end

    response = struct( 'year',string(data(1)), ...
                       'priorExp',string(data(2)), ...
                       'labSession',string(data(3)), ...
                       'grade',data(4), ...
                       'minHours',str2double(minHours), ...
                       'maxHours',str2double(maxHours), ...
                       'difficulty',string(data(end)) );

    responses(i) = response;

end

% part a
gradeOptions = ["A", "B", "C", "D", "F"];
gradeDistributions = zeros(1, 5);

for i = 1:5
    grade = gradeOptions(i);
    count = size(strfind( [responses.grade], grade ), 2);
    gradeDistributions(i) = count;
end

figure1 = figure(1);
hold on; grid on; box on;

bar( gradeOptions, gradeDistributions  )
title("Expected Grade Distribution");
xlabel("Expected Grade");
ylabel("Number of Students")

p3a = 'See figure 1';

% part b
priorExperience = [responses.priorExp];
count = size( find( priorExperience == "Yes" ), 2 );

p3b = count;

% part c
grades = { responses.maxHours };
grades = ( [grades{:}] );

count = size(find( grades < 7 ), 2);
p3c = count;

% part d
years = { responses.year };
years = ( [years{:}] );

labSessions = { responses.labSession };
labSessions = ( [labSessions{:}] );

sophmores = find(years=="Sophomore");

filtered = find( labSessions( sophmores ) == "Fri");
count = size(filtered, 2);

p3d = count;

toc



































