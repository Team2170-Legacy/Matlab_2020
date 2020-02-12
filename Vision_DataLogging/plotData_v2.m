% plotData_v2.m
% Written by Jacob K and Priyanshu on 2/8/2020
%
%   _v2 updated 2/11/2020

%% Load in data
data = getVisionLogTable_v2('Vision_Log2020-02-11_18_18.csv', [2, Inf]);

%% Plot angle error vs. time when VisionDrive is active/inactive
visionDriveActive = data.VisionDriveActive;
visionTargetLocked = data.TargetLocked;

angleError = data.AngleError;
angleError_DB = data.AngleError_DB;

time = data.Time;

visionActive_idx = find(visionDriveActive == 1);
visionInactive_idx = find(visionDriveActive == 0);

figure; hold on; grid on;

scatter(time(visionActive_idx), angleError(visionActive_idx), 'R', 'LineWidth', 2);
scatter(time(visionInactive_idx), angleError(visionInactive_idx), 'B', 'LineWidth', 2);
xlabel('Time [s]');
ylabel('tx [deg]');
title('Angle Error vs. Time');
legend('Vision Drive Active','Vision Drive Inactive');

%% Plot distance error vs time when VisionDrive is active/inactive
distanceError = data.DistanceError;

figure; hold on; grid on;
plot(time(visionActive_idx), distanceError(visionActive_idx), 'R.', 'LineWidth', 2);
plot(time(visionInactive_idx), distanceError(visionInactive_idx), 'B.', 'LineWidth', 2);
xlabel('Time [s]');
ylabel('Distance Error [ft]');
title('Distance Error vs. Time');
legend('Vision Drive Active','Vision Drive Inactive');

%% Plot angle error and omega vs. time when VisionDrive is active/inactive
omega = data.Omega;

figure;
ax1 = subplot(2,1,1);
grid on
hold on; 
scatter(time(visionActive_idx), omega(visionActive_idx), 'R', 'LineWidth', 2);
scatter(time(visionInactive_idx), omega(visionInactive_idx), 'B', 'LineWidth', 2);
ylabel('Omega');
legend('Vision Drive Active','Vision Drive Inactive');
title('Omega vs. Time');

ax2 = subplot(2,1,2);
grid on
hold on; 
scatter(time(visionActive_idx), angleError(visionActive_idx), 'R', 'LineWidth', 2);
scatter(time(visionInactive_idx), angleError(visionInactive_idx), 'B', 'LineWidth', 2);

scatter(time, angleError_DB, '.k', 'LineWidth',2);

xlabel('Time [s]');
ylabel('tx [deg]');
legend('Vision Drive Active','Vision Drive Inactive', 'angleError\_DB (dead-band)');
title('Angle Error vs. Time');

linkaxes([ax1 ax2],'x');

%% Plot speed and distance error vs time when VisionDrive is active/inactive
speed = data.Speed;

figure;
ax1 = subplot(2,1,1);
grid on
hold on; 
scatter(time(visionActive_idx), speed(visionActive_idx), 'R', 'LineWidth', 2);
scatter(time(visionInactive_idx), speed(visionInactive_idx), 'B', 'LineWidth', 2);
ylabel('Speed [ft/s]');
legend('Vision Drive Active','Vision Drive Inactive');
title('Speed vs. Time');

ax2 = subplot(2,1,2);
grid on
hold on; 
plot(time(visionActive_idx), distanceError(visionActive_idx), 'R.', 'LineWidth', 2);
plot(time(visionInactive_idx), distanceError(visionInactive_idx), 'B.', 'LineWidth', 2);
xlabel('Time [s]');
ylabel('Distance Error [ft]');
legend('Vision Drive Active','Vision Drive Inactive');
title('Distance Error vs. Time');
