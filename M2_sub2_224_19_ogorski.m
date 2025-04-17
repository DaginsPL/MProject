function [compact, sedan, SUV] = M2_sub2_224_19_ogorski()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% The program manages noise and takes care of errors and returns smoothed data 
%
% Function Call
% M2_sub2_224_19_ogorski()
%
% Input Arguments
% 
% Output Arguments
% compact - matrix with data for compacts, sedan - matrix with data for
% sedans, SUV - matrix with data for SUVs
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

data = readmatrix("Sp25_cruiseAuto_experimental_data.csv");

time_vector = data(:,1);
compact_winter_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,2));
compact_winter_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,3));
compact_winter_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,4));
compact_winter_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,5));
compact_winter_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,6));

compact_allseason_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,7));
compact_allseason_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,8));
compact_allseason_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,9));
compact_allseason_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,10));
compact_allseason_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,11));

compact_summer_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,12));
compact_summer_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,13));
compact_summer_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,14));
compact_summer_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,15));
compact_summer_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,16));

sedan_winter_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,17));
sedan_winter_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,18));
sedan_winter_mat(:,3)= M2_sub5_removeErrors_224_19_ogorski(data(:,19));
sedan_winter_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,20));
sedan_winter_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,21));

sedan_allseason_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,22));
sedan_allseason_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,23));
sedan_allseason_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,24));
sedan_allseason_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,25));
sedan_allseason_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,26));

sedan_summer_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,27));
sedan_summer_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,28));
sedan_summer_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,29));
sedan_summer_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,30));
sedan_summer_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,31));

SUV_winter_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,32));
SUV_winter_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,33));
SUV_winter_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,34));
SUV_winter_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,35));
SUV_winter_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,36));

SUV_allseason_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,37));
SUV_allseason_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,38));
SUV_allseason_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,39));
SUV_allseason_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,40));
SUV_allseason_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,41));

SUV_summer_mat(:,1) = M2_sub5_removeErrors_224_19_ogorski(data(:,42));
SUV_summer_mat(:,2) = M2_sub5_removeErrors_224_19_ogorski(data(:,43));
SUV_summer_mat(:,3) = M2_sub5_removeErrors_224_19_ogorski(data(:,44));
SUV_summer_mat(:,4) = M2_sub5_removeErrors_224_19_ogorski(data(:,45));
SUV_summer_mat(:,5) = M2_sub5_removeErrors_224_19_ogorski(data(:,46));


%% ____________________
%% CALCULATIONS
numOfPoints = length(time_vector);

compact_winter = zeros(numOfPoints);
compact_allseason = zeros(numOfPoints);
compact_summer = zeros(numOfPoints);

sedan_winter = zeros(numOfPoints);
sedan_allseason = zeros(numOfPoints);
sedan_summer = zeros(numOfPoints);

SUV_winter = zeros(numOfPoints);
SUV_allseason = zeros(numOfPoints);
SUV_summer = zeros(numOfPoints);

for i = 1:numOfPoints
    compact_winter(i) = mean(compact_winter_mat(i,:));
    compact_allseason(i) = mean(compact_allseason_mat(i,:));
    compact_summer(i) = mean(compact_summer_mat(i,:));

    sedan_winter(i) = mean(sedan_winter_mat(i,:));
    sedan_allseason(i) = mean(sedan_allseason_mat(i,:));
    sedan_summer(i) = mean(sedan_summer_mat(i,:));

    SUV_winter(i) = mean(SUV_winter_mat(i,:));
    SUV_allseason(i) = mean(SUV_allseason_mat(i,:));
    SUV_summer(i) = mean(SUV_summer_mat(i,:));
end

smooth_compact_winter  = M2_sub6_reduceNoise_224_19_ogorski(compact_winter);
smooth_compact_allseason  = M2_sub6_reduceNoise_224_19_ogorski(compact_allseason);
smooth_compact_summer  = M2_sub6_reduceNoise_224_19_ogorski(compact_summer);

smooth_sedan_winter  = M2_sub6_reduceNoise_224_19_ogorski(sedan_winter);
smooth_sedan_allseason  = M2_sub6_reduceNoise_224_19_ogorski(sedan_allseason);
smooth_sedan_summer  = M2_sub6_reduceNoise_224_19_ogorski(sedan_summer);

smooth_SUV_winter  = M2_sub6_reduceNoise_224_19_ogorski(SUV_winter);
smooth_SUV_allseason  = M2_sub6_reduceNoise_224_19_ogorski(SUV_allseason);
smooth_SUV_summer  = M2_sub6_reduceNoise_224_19_ogorski(SUV_summer);
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS




%% ____________________
%% RESULTS

compact(:,1) = smooth_compact_winter;
compact(:,2) = smooth_compact_allseason;
compact(:,3) = smooth_compact_summer;

sedan(:,1) = smooth_sedan_winter;
sedan(:,2) = smooth_sedan_allseason;
sedan(:,3) = smooth_sedan_summer;

SUV(:,1) = smooth_SUV_winter;
SUV(:,2) = smooth_SUV_allseason;
SUV(:,3) = smooth_SUV_summer;

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



