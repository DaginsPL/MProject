
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Pulls and assigns the data from the data-set to appropriate variables,
% then plots three plots, differentiating the different types of tires used
% in the tests
%
% Function Call
% M1B_main_224_19_ghayse
%
% Input Arguments
% N/A
%
% Output Arguments
% N/A
%
% Assignment Information
%   Assignment:     M01B, Problem 3
%   Team member:    Garrett Hayse, ghayse@purdue.edu [repeat for each person]
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Initializes the data from the CSV file
data = readmatrix("Sp25_cruiseAuto_M3benchmark_data.csv");

% Only pull column 1 for the "x" values
time_vector = data(:,1);

% Count how many columns so the code does the correct number of iterations
numberColumns = width(data);
% Start at column 2 of the data because column 1 is time values
indx = 2;

%Initilizes neccesary values for creating the bounds
t = [1:30];
t_s_left = 4.50;
t_s_right = 6.00;
tau_left = 1.26;
tau_right = 3.89;
y_L_left = 1.10;
y_L_right = -0.90;
y_h_left = 25.82;
y_h_right = 23.36;

%% ____________________
%% CALCULATIONS

while indx <= numberColumns
   [smoothData] = M2_sub2_224_19_ogorski(data);
   [Vi, Vf] = M1A_sub3_224_19_massey30(time_vector, cleanData, AccelerationStart);




end








%Creates the vector of values for the left and right bounds. 
y_left = zeros(1,30);
for i = t-1
    if i >= 0 && i <= t_s_left
        y_left(i+1) = y_L_left;
    else 
        y_left(i+1) = y_L_left + (1 - exp((-1).*((i-t_s_left)./(tau_left)))).*(y_h_left - y_L_left);
        
    end 
end 

y_right = zeros(1,30);
for i = t-1
    if i >= 0 && i <= t_s_right
        y_right(i+1) = y_L_right;
    else 
        y_right(i+1) = y_L_right + (1 - exp((-1).*((i-t_s_right)./(tau_right)))).*(y_h_right - y_L_right);
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



