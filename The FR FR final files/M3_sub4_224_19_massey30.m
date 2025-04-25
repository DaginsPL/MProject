function [Vi, Vf] = M3_sub4_224_19_massey30(time_vector, ...
    activeData, AccelerationStart)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This program calculates the initial and final velocity of given data.
%
% Function Call
% [Vi, Vf] = M1A_sub3_224_19_massey30(time_vector, velocity_values, 
% AccelerationStart)
%
% Input Arguments
% N/A
%
% Output Arguments
% 
%
% Assignment Information
%   Assignment:     M01, Problem 4
%   Team member:    Koyuki Massey, massey30@purdue.edu 
%                   Garrett Hayse, ghayse@purdue.edu
%                   Qiwen Fu, fu433@purdue.edu
%                   Olaf Gorski, ogorski@purdue.edu
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Initializes and prepares variables for the caluclations need for final and
%initial velocities. 
roundedAccStart = round(AccelerationStart);


velocity_i = activeData(1:roundedAccStart);

time_f = time_vector(roundedAccStart:end);
velocity_f = activeData(roundedAccStart:end);


% Window that we are solving the slope for
distance = 100;
% Values for calculating final velocity
timeLength = length(time_f);
slopeTolerance = 0.001;

%% ____________________
%% CALCULATIONS

%% Initial Velocity
Vi = mean(velocity_i);


%% Final Velocity
%Runs a complex for loop that allows us to find the average final velocites
%beyond a pre-determined point
slopeVector = zeros(1, timeLength - distance);

for indx = (distance + 1):timeLength
    slopeFinal = (velocity_f(indx) - velocity_f(indx - distance)) / (time_f(indx) - time_f(indx - distance));

    slopeVector(indx - distance) = slopeFinal;
end

VfLocations = find(slopeVector < slopeTolerance, 1);

VfValues = velocity_f(VfLocations:end);

Vf = mean(VfValues);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Prints the final answers
fprintf('The initial Velocity is: %0.2f \n', Vi);

fprintf('The final velocity is: %0.2f \n', Vf);

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.