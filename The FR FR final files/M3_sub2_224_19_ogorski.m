function [smoothData] = M3_sub2_224_19_ogorski(noisyData)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program manages noise and takes care of errors and returns smoothed data 
%
% Function Call
% M2_sub2_224_19_ogorski(noistData)
%
% Input Arguments
% noisyData - data to me smoothed out by the function
%
% Output Arguments
% smoothData - smoothed data
%
% Assignment Information
%   Assignment:     M3, Problem Smooth Data
%   Team member:    Olaf Gorski, ogorski@purdue.edu 
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Initializes the needed variables for the smoothing subfunctions
numOfPoints = length(noisyData);

smoothData = zeros(numOfPoints);


%% ____________________
%% CALCULATIONS
%Calls the two smoothing subfunctions
noError = M3_sub5_removeErrors_224_19_ogorski(noisyData);

smoothData = M3_sub6_reduceNoise_224_19_ogorski(noError);

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS



%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



