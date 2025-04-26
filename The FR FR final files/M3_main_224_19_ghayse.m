function M3_main_224_19_ghayse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% Main function. This function pulls all data in from the csv file and
% divides it into comprehensable variables for each different car type. 
% It then calls all of the subfunctions within a loop for each different
% type of car. Finally, it creates a large gap between each section of the
% text results to make them readable.
% 
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
%   Assignment:     M3, Main Function
%   Team member:    Garrett Hayse, ghayse@purdue.edu 
%                   Koyuki Massey, massey30@purdue.edu         
%                   Qiwen Fu, fu433@purdue.edu
%                   Olaf Gorski, ogorski@purdue.edu
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
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



%Values for SSE Calculation
testValues = [6.21, 9.39, 6.85; 1.51, 1.96, 2.90; -0.09, -0.22, 0.19; ...
    25.08, 24.72, 24.18];
%% ____________________
%% CALCULATIONS
%Runs a loop that calls in each subfuction and passes them their needed
%input arguments, while also maintaining a "active data" set, which is the
%data for the car whose values and parameters are being calculated during the
%current iterations of the for loop
while indx <= numberColumns
    vehicle_number = indx -1;
    fprintf("Mathmatical Outputs for vehicle %.f \n", (vehicle_number))
    active_data = data(:,(indx));
    active_values = testValues(:,vehicle_number);
    [smoothData] = M3_sub2_224_19_ogorski(active_data);
    active_data = smoothData;
    [accelerationStart] = M3_sub3_accelerationStartTime_224_19_fu433 (time_vector, active_data);
    [Vi, Vf] = M3_sub4_224_19_massey30(time_vector, active_data, accelerationStart);
    [timeConstant] = M3_sub3_tauCalculations_224_19_fu433(time_vector, active_data, Vi, Vf, accelerationStart);
    raw_data = data(:,indx);
    [our_parameters, Raw_50, n]= M3_benchmark_224_19(active_values, accelerationStart, Vi, Vf, timeConstant, vehicle_number, raw_data, time_vector);
    M3_performance_224_19(our_parameters, vehicle_number, raw_data, time_vector)
    indx = indx + 1;
  

    % Calculating our SSEmod
    SSE_mod_our = (sum(((Raw_50 - our_parameters).^2))/(n));
   

    % Calculating Percent Error

    percentError_accStart = abs((abs(active_values(1) - accelerationStart) / active_values(1)) * 100);
    percentError_tau = abs((abs(active_values(2) - timeConstant) / active_values(2)) * 100);
    percentError_Vi = abs(((abs(active_values(3) - Vi) / active_values(3)) * 100));
    percentError_Vf = abs(((abs(active_values(4) - Vf) / active_values(4)) * 100));
  


  
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% fprintf for our modified SSE
    fprintf('The sum of squared errors for our parameters is: %.4f \n',SSE_mod_our );

% fprintf for the percent errors must be within the loop
    fprintf('The percent error for the acceleration start time is %0.2f percent \n', percentError_accStart);
    fprintf('The percent error for the time constant is %0.2f percent \n', percentError_tau);
    fprintf('The percent error for the initial speed is %0.2f percent \n', percentError_Vi);
    fprintf('The percent error for the final speed is %0.2f percent \n', percentError_Vf);

    % Create space to differentiate loops
    fprintf('\n\n\n');

% End the loop
end


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



