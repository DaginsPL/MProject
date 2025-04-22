function [AccelerationStart, Tau] = M2_sub3_224_19_fu433()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program calculates acceleration start time for each group of vehicle
% type and also calculates time constant
%
% Function Call
% 
%
% Input Arguments
% 
%
% Output Arguments
%
%
% Assignment Information
%   Assignment:     M02, Problem #
%   Team member:    Fu Qiwen, fu433@purdue.edu [repeat for each person]
%                   Koyuki Massey, massey30@purdue.edu 
%                   Garrett Hayse, ghayse@purdue.edu
%                   Olaf Gorski, ogorski@purdue.edu
%   Team ID:        224-19
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION



% Window that we are solving the slope for
distance = 100;
% Values for calculating acceleration time
timeLength = length(cleanTime);
speedLength = length(cleanSpeed);
slopeTolerance = 0.001;


%% ____________________
%% CALCULATIONS

%% Find acceleration start time

slopeVector = zeros(1, timeLength - distance);

for indx = (distance + 1):timeLength
    slopeFinal = (speedLength(indx) - speedLength(indx - distance)) / (timeLength(indx) - timeLength(indx - distance));

    slopeVector(indx - distance) = slopeFinal;
end

accelerationLocations = find(slopeVector < slopeTolerance, 1);

accelerationValues = speedLength(accelerationLocations:end);

accelerationStart = mean(accelerationValues);

%% Find the time constant (tau)


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The acceleration start time is: %0.2f \n', accelerationStart);

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



