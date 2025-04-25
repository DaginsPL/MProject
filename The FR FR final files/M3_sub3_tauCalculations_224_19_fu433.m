function [timeConstant] = M3_sub3_tauCalculations_224_19_fu433(cleanTime, cleanSpeed, finalSpeed, initalSpeed, AccelerationStart)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program calculates the time constant for each of the car types
%
% Function Call
% [timeConstant] = M3_sub3_tauCalculations_224_19_fu433(cleanTime, cleanSpeed, finalSpeed, initalSpeed, AccelerationStart)
%
% Input Arguments
% cleanTime = the cleaned time vector
% cleanSpeed = the cleaned speed values for the active data set. 
% finalSpeed = The final speed of the dataset
% initialSpeed = the initial speed of the dataset
% AccelerationStart = the accleration start time of the current data set. 
%
% Output Arguments
% timeConstant = the time constant for the current data set. 
%
%
% Assignment Information
%   Assignment:     M3, Problem Time Constant
%   Team member:    Fu Qiwen, fu433@purdue.edu 
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
timeLength = length(cleanTime);


%% Find the time constant (tau)
 
%Runs a for loop for the whole length of time that finds the difference of
%time between the acceleration start time and the time at which the car
%reaches 63.2% of its maximum speed. This is Tau. 
for indx = 1:timeLength
   
   
    timeConstantTarget = initalSpeed + 0.632 * (finalSpeed - initalSpeed);

    indexTimeConstant = find(cleanSpeed(AccelerationStart:end) >= timeConstantTarget, 1) + AccelerationStart - 1;
 
    timeatTimeConstant = cleanTime(round(indexTimeConstant));

    timeConstant = abs(timeatTimeConstant - AccelerationStart) /10;
end 


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Prints the final value for the time constant for this data set. 
fprintf('TimeConstant is %f \n', timeConstant)
%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



