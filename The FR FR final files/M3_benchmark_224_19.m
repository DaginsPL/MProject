function [our_parameters, Raw_50, n] = M3_benchmark_224_19(actualValue, ...
    acceleration_start, Vi, Vf, tau, vehicle_number, raw_data, time_vector)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function creates vectors of values using the first order model
% equation and running calculations using both our calculated parameters
% along with the given parameters from the company. Then, it preforms math
% to determine the modified SSE for both vectors when compared to the raw
% data. It then prints both SSEs. Finally, the function graphs the two
% first order models aginst each other, as well as graphs the first order
% model using our parameters against the raw data sets. 
%
% Function Call
% [our_parameters, SSE_mod_our] = M3_benchmark_224_19(actualValue, 
% acceleration_start, Vi, Vf, tau, vehicle_number, raw_data, time_vector)
%
% Input Arguments
% actualValue = the active dataset of velocites for the car being
% calculated at the moment. acceleration_start = the acceleration start
% time. Vi = initial velocity. Vf = final velocity. tau = time constant
% vehicle_number = numerical designation of the car being calculated.
% raw_data = the non-smoothed data set of the current car. time_vector =
% the time vector from the raw data. 
%
% Output Arguments
% our_parameters = the vector of values storing our calculated speeds from
% our first order model, using our calculated parameters. 
%
% Assignment Information
%   Assignment:     M3, Problem benchmark
%   Team member:    Koyuki Massey, massey30@purdue.edu 
%                   Garrett Hayse, ghayse@purdue.edu
%                   Qiwen Fu, fu433@purdue.edu
%                   Olaf Gorski, ogorski@purdue.edu
%   Team ID:        224_19
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% Find how many data points
t = 1:50;
n = length(t);
%Condenses the raw data to 50 data points, so that an SSE calculation can
%be preformed equating to our first order model data sets. 
index = 1;
for control = 1:100:5000
    Raw_50(index) = raw_data(control);
    index = index + 1;
end 



%% ____________________
%% CALCULATIONS


%Calcualtes the vector of values for the first order model based on our
%parameters
our_parameters = zeros(1,50);
for i = t-1
    if i >=0 && i <= acceleration_start
        our_parameters(i+1) = Vi;
    else 
        our_parameters(i+1) = Vi + (1 - exp((-1).*((i-acceleration_start)./(tau)))).*(Vf - Vi);
    end
end

%Calcualtes the vector of values for the first order model based on the
%given parameters
benchmark_parameters = zeros(1,50);
for i = t-1
    if i >=0 && i <= actualValue(1)
        benchmark_parameters(i+1) = actualValue(3);
    else 
        benchmark_parameters(i+1) = actualValue(3) + (1 - exp((-1).*((i-actualValue(1))./(actualValue(2))))).*(actualValue(4) - actualValue(3));
    end
end

  %Preformes the SSE calculations for both vectos. 


SSE_mod_benchmark = (sum(((Raw_50 - benchmark_parameters).^2))/(n));



%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
%Prints the final answers of both SSE results
fprintf('The sum of squared errors for the benchmark parameters is: %.4f \n',SSE_mod_benchmark );


%Graphs the first order model calculated using our parameters against the
%first order model calculated using the given parameters.
figure
plot(t, our_parameters, 'r-')
hold on
plot(t, benchmark_parameters, 'b-')
xlabel("Time (s)")
ylabel("Speed (m/s)")
title(['Vehicle ', num2str(vehicle_number), ' Data'])
grid on
legend('Calculated Graph from Data', "Calculated Graph from Given Parameters", location='southeast')
hold off 

%Graphs the first order model calculated using our parameters against the
%raw data given in the .csv file
figure
plot(time_vector, raw_data, "r-")
hold on
plot(t, our_parameters, "b-")
xlabel('Time (s)');
ylabel('Speed (m/s)');
title(['Vehicle ', num2str(vehicle_number), ' Raw Data vs Model'])
legend('Raw Data', 'Model', location='southeast')
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



