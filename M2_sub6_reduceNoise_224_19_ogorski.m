function [cleanData] = M2_sub6_reduceNoise_224_19_ogorski(noisyData)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Removes NaN from the data inputed
%
% Function Call
% M2_sub5_removeErrors_224_19_ogorski(dataWithErrors)
%
% Input Arguments
% NoisyData - Data with noise4
%
% Output Arguments
% CleanData - Dataa without noise
%
% Assignment Information
%   Assignment:     M2
%   Team member:    Olaf Gorski, ogorski@purdue.edu 
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
dataLength = length(noisyData);
cleanData = zeros(dataLength,1);

%% ____________________
%% CALCULATIONS
a=0;
startTime = 585;

cleanData(1:startTime) = mean(noisyData(1:startTime));

for i = startTime:dataLength
    num1 = max(1, i - 51);
    num2   = min(dataLength, i + 51);
    cleanData(i) = mean(noisyData(num1:num2));
end

cleanData = cleanData(1:dataLength);
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
