function [smoothData] = M2_sub2_224_19_ogorski(noisyData)
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
%   Assignment:     M02, Problem N/A
%   Team member:    Olaf Gorski, ogorski@purdue.edu 
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION


noError = M2_sub5_removeErrors_224_19_ogorski(noisyData);

%% ____________________
%% CALCULATIONS
numOfPoints = length(noisyData);

smoothData = zeros(numOfPoints);

smoothData = M2_sub6_reduceNoise_224_19_ogorski(noError);

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



