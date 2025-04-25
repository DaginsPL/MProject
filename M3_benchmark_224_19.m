function [] = M3_benchmark_224_19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
replace this text with your program description as a comment
%
% Function Call
replace this text with a comment that states the function call
%
% Input Arguments
replace this text with a commented list of the input arguments
%
% Output Arguments
replace this text with a commented list of the output arguments
%
% Assignment Information
%   Assignment:     M##, Problem #
%   Team member:    Name, login@purdue.edu [repeat for each person]
%   Team ID:        ###-##
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Find how many data points
amountData = length(data);




%% ____________________
%% CALCULATIONS
% Calculate Modified SSE
modSSE = (sum((actualValue - predictedValue) .^ 2)) / amountData;

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
fprintf('The sum of squared errors is: %0.2f \n', modSSE);

%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



