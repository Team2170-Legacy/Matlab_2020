% plotData.m
% Written by Jacob K and Priyanshu on 2/8/2020
%% Load in data
data = GetDriveTrainLogTable_v2('DriveTrainLog_2020-02-15_10_01.csv', [2, Inf]);
time = data.Time;

leftCommand = data.LeftVelocityCommand;
rightCommand = data.RightVelocityCommand;
leftVelocity = data.LeftActualVelocity;
rightVelocity = data.RightActualVelocity;

leftLeadAppliedOutput = data.LeftLeadAppliedOutput;
leftFollowAppliedOutput = data.LeftFollowAppliedOutput;
rightLeadAppliedOutput = data.RightLeadAppliedOutput;
rightFollowAppliedOutput = data.RightFollowAppliedOutput;

leftLeadVoltage = data.LeftLeadVoltage;
leftFollowVoltage = data.LeftFollowVoltage;
rightLeadVoltage = data.RightLeadVoltage;
rightFollowVoltage = data.RightFollowVoltage;

leftLeadOutputVoltage = leftLeadAppliedOutput .* leftLeadVoltage;
leftFollowOutputVoltage = leftFollowAppliedOutput .* leftFollowVoltage;
rightLeadOutputVoltage = rightLeadAppliedOutput .* rightLeadVoltage;
rightFollowOutputVoltage = rightFollowAppliedOutput .* rightFollowVoltage;

leftLeadCurrent = data.LeftLeadCurrent;
leftFollowCurrent = data.LeftFollowCurrent;
rightLeadCurrent = data.RightLeadCurrent;
rightFollowCurrent = data.RightFollowCurrent;

%% Plot left velocities, voltages, currents
f1=figure; hold on; grid on;

ax1 = subplot(4,1,1);
grid on;
hold on;

p111 = stairs(time, leftCommand);
set(p111,'LineWidth',2);
set(p111,'LineStyle','--');
set(p111,'Color','r');

%p112 = stairs(time, leftVelocity);
p112 = stairs(time, leftVelocity);
set(p112,'LineWidth',2);
set(p112,'LineStyle','-');
set(p111,'Color','b');

xlabel('Time [s]');
ylabel('Velocity [insert units]');
title('Left Actual and Command Velocity');
legend('Left Command Velocity','Left Actual Velocity');

ax2 = subplot(4,1,4);
grid on;
hold on;
p121 = stairs(time, leftLeadVoltage);
set(p121,'LineWidth',1);
set(p121,'LineStyle','-');
set(p121,'Color','r');
p122 = stairs(time, leftFollowVoltage);
set(p122,'LineWidth',1);
set(p122,'LineStyle','-');
set(p122,'Color','b');
xlabel('Time [s]');
ylabel('Voltage [Volts]');
title('Left Lead and Follow Bus Voltages');
legend('Left Lead Bus Voltage','Left Follow Bus Voltage');

ax3 = subplot(4,1,3);
grid on;
hold on;
p131 = stairs(time, leftLeadCurrent);
set(p131,'LineWidth',1);
set(p131,'LineStyle','-');
set(p131,'Color','r');
p132 = stairs(time, leftFollowCurrent);
set(p132,'LineWidth',1);
set(p132,'LineStyle','-');
set(p132,'Color','b');
xlabel('Time [s]');
ylabel('Current [Amps]');
title('Left Lead and Follow Current');
legend('Left Lead Current','Left Follow Current');

ax4 = subplot(4,1,2);
grid on;
hold on;
p141 = stairs(time, leftLeadOutputVoltage);
set(p131,'LineWidth',1);
set(p131,'LineStyle','-');
set(p131,'Color','r');
p142 = stairs(time, leftFollowOutputVoltage);
set(p142,'LineWidth',1);
set(p142,'LineStyle','-');
set(p142,'Color','b');
xlabel('Time [s]');
ylabel('Applied Output');
title('Left Lead and Follow Voltage');
legend('Left Lead Voltage','Left Follow Voltage');

linkaxes([ax1 ax2 ax3 ax4], 'x');
%% Plot right velocities, voltages, currents
f2 = figure; hold on; grid on;

ax1 = subplot(4,1,1);
grid on;
hold on;
p211 = stairs(time, rightCommand);
set(p211,'LineWidth',2);
set(p211,'LineStyle','--');
set(p211,'Color','r');
p212 = plot(time, rightVelocity);
xlabel('Time [s]');
set(p212,'LineWidth',2);
set(p212,'LineStyle','-');
set(p212,'Color','b');
ylabel('Velocity [insert units]');
title('Right Actual and Command Velocity');
legend('Right Command Velocity','Right Actual Velocity');

ax2 = subplot(4,1,4);
grid on;
hold on;
p221 = stairs(time, rightLeadVoltage);
set(p221,'LineWidth',1);
set(p221,'LineStyle','-');
set(p221,'Color','r');
p222 = stairs(time, rightFollowVoltage);
set(p222,'LineWidth',1);
set(p222,'LineStyle','-');
set(p222,'Color','b');
xlabel('Time [s]');
ylabel('Voltage [Volts]');
title('Right Lead and Follow Bus Voltages');
legend('Right Lead Bus Voltage','Right Follow Bus Voltage');

ax3 = subplot(4,1,3);
grid on;
hold on;
p231 = stairs(time, rightLeadCurrent);
set(p231,'LineWidth',1);
set(p231,'LineStyle','-');
set(p231,'Color','r');
p232 = stairs(time, rightFollowCurrent);
set(p232,'LineWidth',1);
set(p232,'LineStyle','-');
set(p232,'Color','b');
xlabel('Time [s]');
ylabel('Current [Amps]');
title('Right Lead and Follow Current');
legend('Right Lead Current','Right Follow Current');

ax4 = subplot(4,1,2);
grid on;
hold on;
p141 = stairs(time, rightLeadOutputVoltage);
set(p131,'LineWidth',1);
set(p131,'LineStyle','-');
set(p131,'Color','r');
p142 = stairs(time, rightFollowOutputVoltage);
set(p142,'LineWidth',1);
set(p142,'LineStyle','-');
set(p142,'Color','b');
xlabel('Time [s]');
ylabel('Applied Output');
title('Right Lead and Follow Voltage');
legend('Right Lead Voltage','Right Follow Voltage');

linkaxes([ax1 ax2 ax3 ax4], 'x');






