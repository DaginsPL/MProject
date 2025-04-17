function [cleanData] = M2_sub5_removeErrors_224_19_ogorski(dataWithErrors)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Removes NaN from the data inputed
%
% Function Call
% M2_sub5_removeErrors_224_19_ogorski(dataWithErrors)
%
% Input Arguments
% dataWithErrors - Data with NaN and errors
%
% Output Arguments
% CleanData - Dataa cleaned
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
dataLength = length(dataWithErrors);
cleanData = zeros(dataLength,1);

%% ____________________
%% CALCULATIONS
a=0;

for i = 1:dataLength
    if (isnan(dataWithErrors(i)))
        if i == dataLength 
            cleanData(i) = dataWithErrors(i - 1);
        else
            while(isnan(dataWithErrors(i+a)))
                a = a + 1;
            end
            num1 = dataWithErrors(i+a);
            a = 0;
            while(isnan(dataWithErrors(i-a)))
                a = a + 1;
            end
            num2 = dataWithErrors(i-a);
            cleanData(i) = (num1 + num2) / 2;
        end
    else
        cleanData(i) = dataWithErrors(i);
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



