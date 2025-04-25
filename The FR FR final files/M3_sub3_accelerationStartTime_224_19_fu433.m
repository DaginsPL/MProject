function [accelerationStart] = M3_sub3_accelerationStartTime_224_19_fu433(time, activeData)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program calculates acceleration start time for each group of vehicle
% type
%
% Function Call
% [accelerationStart] = M3_sub3_accelerationStartTime_224_19_fu433(time, activeData)
%
% Input Arguments
% time = the time vector for the active dataset
% activeData = the smoothed data for the active dataset 
%
% Output Arguments
% accelerationStart = the acceleration start time for the active data set.
%
%
% Assignment Information
%   Assignment:     M3, Problem Acceleration Start Time
%   Team member:    Fu Qiwen, fu433@purdue.edu [repeat for each person]
%                   Koyuki Massey, massey30@purdue.edu 
%                   Garrett Hayse, ghayse@purdue.edu
%                   Olaf Gorski, ogorski@purdue.edu
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION



% Window that we are solving the slope for
distance = 100;
% Values for calculating acceleration time
timeLength = length(time);
%The change in slope we are looking for
slopeTolerance = 0.0001;


%% ____________________
%% CALCULATIONS

%% Find acceleration start time
%Pre-initializes the vector to save time 
slopeVector = zeros(1, timeLength - distance);
% A for loop, that looks for the instances where the average slope
% between 100 datapoints is above our given tolerance.
for indx = (distance + 1)

    changeX = time(indx) - time(indx - distance);

    changeY = activeData(indx) - activeData(indx - distance);

    slopeFinal = changeY / changeX;

    slopeVector(indx - distance) = slopeFinal;

    indx = indx + 1;
end
%Finds the first time that the slope is above the given tolerance
accelerationStart = find(slopeVector < slopeTolerance, 1);







%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Prints the final result
fprintf('The acceleration start time is: %0.2f \n', accelerationStart);

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.


