% plotData.m
% Written by Jacob K and Priyanshu on 2/8/2020
%% Load in data
data = GetDriveTrainLogTable('DriveTrainLog_2020-02-14_19_05.csv', [2, Inf]);
time = data.Time;
leftCommand = data.LeftVelocityCommand;
rightCommand = data.RightVelocityCommand;
leftVelocity = data.LeftActualVelocity;
rightVelocity = data.RightActualVelocity;
leftLeadVoltage = data.LeftLeadVoltage;
leftFollowVoltage = data.LeftFollowVoltage;
rightLeadVoltage = data.RightLeadVoltage;
rightFollowVoltage = data.RightFollowVoltage;
leftLeadCurrent = data.LeftLeadCurrent;
leftFollowCurrent = data.LeftFollowCurrent;
rightLeadCurrent = data.RightLeadCurrent;
rightFollowCurrent = data.RightFollowCurrent;

%% Plot left velocities, voltages, currents
figure; hold on; grid on;

ax1 = subplot(3,1,1);
grid on;
hold on;
plot(time, leftCommand);
plot(time, leftVelocity);
xlabel('Time [s]');
ylabel('Velocity [insert units]');
title('Left Actual and Command Velocity');
legend('Left Command Velocity','Left Actual Velocity');

ax2 = subplot(3,1,2);
grid on;
hold on;
plot(time, leftLeadVoltage);
plot(time, leftFollowVoltage);
xlabel('Time [s]');
ylabel('Voltage [Volts]');
title('Left Lead and Follow Voltages');
legend('Left Lead Voltage','Left Follow Voltage');

ax3 = subplot(3,1,3);
grid on;
hold on;
plot(time, leftLeadCurrent);
plot(time, leftFollowCurrent);
xlabel('Time [s]');
ylabel('Current [Amps]');
title('Left Lead and Follow Current');
legend('Left Lead Current','Left Follow Current');

linkaxes([ax1 ax2 ax3], 'x');
%% Plot right velocities, voltages, currents
figure; hold on; grid on;

ax1 = subplot(3,1,1);
grid on;
hold on;
plot(time, rightCommand);
plot(time, rightVelocity);
xlabel('Time [s]');
ylabel('Velocity [insert units]');
title('Right Actual and Command Velocity');
legend('Right Command Velocity','Right Actual Velocity');

ax2 = subplot(3,1,2);
grid on;
hold on;
plot(time, rightLeadVoltage);
plot(time, rightFollowVoltage);
xlabel('Time [s]');
ylabel('Voltage [Volts]');
title('Right Lead and Follow Voltages');
legend('Right Lead Voltage','Right Follow Voltage');

ax3 = subplot(3,1,3);
grid on;
hold on;
plot(time, rightLeadCurrent);
plot(time, rightFollowCurrent);
xlabel('Time [s]');
ylabel('Current [Amps]');
title('Right Lead and Follow Current');
legend('Right Lead Current','Right Follow Current');

linkaxes([ax1 ax2 ax3], 'x');






