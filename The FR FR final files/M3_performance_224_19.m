function M3_performance_224_19(our_parameters, vehicle_number, raw_data, time_vector)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
%
%
% Function Call
% M3_performance_224_19(our_parameters, vehicle_number)
%
% Input Arguments
% our_parameters = a vector of values for calculated speeds based on our
% parameters. vehicle_number = the number designation for the car being
% activly calculated on this iteration. 
%
% Output Arguments
% N/A
%
% Assignment Information
%   Assignment:     M3, Preformance
%   Team member:    Koyuki Massey, massey30@purdue.edu 
%                   Garrett Hayse, ghayse@purdue.edu
%                   Qiwen Fu, fu433@purdue.edu
%                   Olaf Gorski, ogorski@purdue.edu
%   Team ID:        224-19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
%Initializes the values needed for calculating the left and right bounds. 
t = 1:50;
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

%Calculates a vector of values based on the left bound parameters
y_left = zeros(1,50);
for i = t-1
    if i >= 0 && i <= t_s_left
        y_left(i+1) = y_L_left;
    else 
        y_left(i+1) = y_L_left + (1 - exp((-1).*((i-t_s_left)./(tau_left)))).*(y_h_left - y_L_left);
        
    end 
end 

%Calculates a vector of values based on the right bound parameters
y_right = zeros(1,50);
for i = t-1
    if i >= 0 && i <= t_s_right
        y_right(i+1) = y_L_right;
    else 
        y_right(i+1) = y_L_right + (1 - exp((-1).*((i-t_s_right)./(tau_right)))).*(y_h_right - y_L_right);
    end 
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Graphs the left and right bounds, along with our model based on the
%benchmark data and our calculated parameters. 
figure
plot(t, y_right, 'r--')
hold on
plot(t, y_left, 'b--')
hold on 
plot(t, our_parameters, 'm-')
hold on
plot(time_vector, raw_data, 'Color', [0.466, 0.674, 0.188])
xlabel("Time (s)")
ylabel("Speed (m/s)")
title(['Vehicle ', num2str(vehicle_number), ' Data Against Bounds'])
legend('Right Bound', 'Left Bound', 'Calculated Values from Data', 'Raw Data', Location= 'southeast')
grid on
hold off


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



