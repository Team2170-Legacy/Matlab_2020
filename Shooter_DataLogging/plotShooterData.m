% plotData.m
% Written by Jacob K and Priyanshu on 2/8/2020
%% Load in data
filename = 'ShooterLog_2020-03-10_19_02.csv';
disp(['Using data from log ' filename]);
data = GetShooterLogTable(filename, [2, Inf]);
time = unwrap(data.Time);
%matchTime = data.MatchTime;

leadRPM = data.LeadRPM;
rpmSetpoint = data.RPMSetpoint;
leadAppliedOutput = data.LeadAppliedOutput;
leadBusVoltage = data.LeadBusVoltage;
leadCurrent = data.LeadCurrent;

%% Plot rpms, voltages, currents
f1=figure; hold on; grid on;

ax1 = subplot(5,1,1);
grid on;
hold on;

p111 = stairs(time, leadRPM);
set(p111,'LineWidth',2);
set(p111,'LineStyle','-');
set(p111,'Color','b');
%p112 = stairs(time, leftEncPos);
p112 = stairs(time, rpmSetpoint);
set(p112,'LineWidth',2);
set(p112,'LineStyle','--');
set(p112,'Color','r');

xlabel('Time [s]');
ylabel('Velocity [RPM]');
title('Left Actual and Command Velocity');
legend('Left Actual Velocity','Left Command Velocity');

ax2 = subplot(5,1,2);
grid on;
hold on;
p121 = stairs(time, leadAppliedOutput);
set(p121,'LineWidth',1);
set(p121,'LineStyle','-');
set(p121,'Color','b');
xlabel('Time [s]');
ylabel('Applied Output [?]');
title('Applied Output');
legend('Lead Applied Output','Left Follow Bus Voltage');

ax3 = subplot(5,1,3);
grid on;
hold on;
p131 = stairs(time, leadBusVoltage);
set(p131,'LineWidth',1);
set(p131,'LineStyle','-');
set(p131,'Color','b');
xlabel('Time [s]');
ylabel('Voltage [V]');
title('Lead Bus Voltage ');
legend('Lead Voltage','Lead Voltage');

ax4 = subplot(5,1,4);
grid on;
hold on;
p141 = stairs(time, leadCurrent);
set(p141,'LineWidth',1);
set(p141,'LineStyle','-');
set(p141,'Color','b');
xlabel('Time [s]');
ylabel('Current [A]');
title('Lead Current');
legend('Lead Current','Lead Current');

% Get applied voltage (voltage .* applied output)
appliedVoltage = leadBusVoltage .* leadAppliedOutput;
ax5 = subplot(5,1,5);
grid on;
hold on;
p141 = stairs(time, appliedVoltage);
set(p141,'LineWidth',1);
set(p141,'LineStyle','-');
set(p141,'Color','b');
xlabel('Time [s]');
ylabel('Applied Output [V]');
title('Lead Applied Output');
legend('Lead Applied Output','Lead Applied Output');

linkaxes([ax1 ax2 ax3 ax4 ax5], 'x');



