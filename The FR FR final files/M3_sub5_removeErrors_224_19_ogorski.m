function [cleanData] = M3_sub5_removeErrors_224_19_ogorski(dataWithErrors)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Removes NaN from the data inputed
%
% Function Call
% [cleanData] = M3_sub5_removeErrors_224_19_ogorski(dataWithErrors)
%
% Input Arguments
% dataWithErrors - Data with NaN and errors
%
% Output Arguments
% CleanData - Data cleaned
%
% Assignment Information
%   Assignment:     M3, assignment Remove Errors
%   Team member:    Olaf Gorski, ogorski@purdue.edu 
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Initializes needed variables in the formats needed for the calculations. 
dataLength = length(dataWithErrors);
cleanData = zeros(dataLength,1);

%% ____________________
%% CALCULATIONS
%Removes the errors from the data set by checking the points for
%discrepencies and then replacing the messed up data points with calculated
%acceptable values from the previous and subsequent data points. 
a=0;

for loopControl = 1:dataLength
    if (isnan(dataWithErrors(loopControl)))
        if loopControl == dataLength 
            cleanData(loopControl) = dataWithErrors(loopControl - 1);
        else
            while(isnan(dataWithErrors(loopControl + a)))
                a = a + 1;
            end
            num1 = dataWithErrors(loopControl + a);
            a = 0;
            while(isnan(dataWithErrors(loopControl - a)))
                a = a + 1;
            end
            num2 = dataWithErrors(loopControl - a);
            cleanData(loopControl) = (num1 + num2) / 2;
        end
    else
        cleanData(loopControl) = dataWithErrors(loopControl);
    end
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



