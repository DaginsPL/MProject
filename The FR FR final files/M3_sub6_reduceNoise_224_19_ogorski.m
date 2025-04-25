function [cleanData] = M3_sub6_reduceNoise_224_19_ogorski(noisyData)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Reduces noise in data
%
% Function Call
% [cleanData] = M3_sub6_reduceNoise_224_19_ogorski(noisyData)
%
% Input Arguments
% NoisyData - Data with noise
%
% Output Arguments
% CleanData - Data without noise
%
% Assignment Information
%   Assignment:     M3, Asssignment Reduce Noise
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

%Finding acceleration start time through a rough estimation
for loopControl = 1:dataLength
    if mean(noisyData(loopControl:loopControl+4)) > 1
        startTime = loopControl;
        break
    end
end

%Avarageing the before start time values
cleanData(1:startTime) = mean(noisyData(1:startTime));


%Using moving avarage to smooth the noise
for loopControl = startTime:dataLength
    num1 = max(1, loopControl - 60);
    num2 = min(dataLength, loopControl + 60);
    cleanData(loopControl) = mean(noisyData(num1:num2));
end

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



