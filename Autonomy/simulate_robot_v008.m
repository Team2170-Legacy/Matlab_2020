%	simulate_robot_v008.m
%
%   v007 has rate limits on wheel velocities
%
%   v008 fix robot overshoot at the end of trajectories problem
%
%   For FRC 2018 PowerUp
%   Modified for FRC 2018 Control by Adonis Canada, Priyanshu Agrawal,
%   and Baris Sengezen
%
%
%
%
%
%   Based on FRC_2017 Matlab simulator
%	Jacob Krucinski
%	jacob1576@gmail.com
%
%	FIRST Robotics Team 2170 Titanium Tomahawks
%	Glastonbury High School, Glastonbury, CT, USA
%
%   2017-03-02      Martin Krucinski  Updated with init_Robot_v002,
%   init_Field_v002
%
%   2018-03-04      Martin Krucinski    Added selection of make_movies flag
%
%   2018-03-20      Martin Krucinski    Added proper control handling when
%   switching between forward and backwards moving trajectories

%   Initialize conversion constants and field elements
%init_Constants;
%Init_Robot_v002
%Init_Field_v002
%init_Trajectories_v003

simulation_stop_distance    = 0.010;

%   Martin Krucinski 02/08/2018
%   Select trajectory for testing

trajectory = eval(trajString); %BSML

% Plot trajectory - This DRAWS THE TRAJECTORY OF THE ROBOT
%plot(trajectory.x, trajectory.y, 'c-o');

% f6 = figure;
% hold on;
% plot(t, percentage, 'r*');

% Select trajectories to simulate
if ~exist('trajectory', 'var')
    disp('Error! Variable "trajectory" does not exist!')
    return
    
    %trajectory = RSML;
    %disp(' Using a default trajectory RSML');
end


N   = length(trajectory.x);       % number of via points

this_traj_length = traj_length(trajectory);

% total_time = this_traj_length/trajectory.v;
if length(trajectory.v) > 1
    total_time = trajectory.tstamps(length(trajectory.tstamps));
else
    total_time = this_traj_length/trajectory.v;
end



Robot.wL0		= 0;		% [rad/s]	initial left wheel angular velocity
Robot.wR0		= 0;		% [rad/s]	initial left wheel angular velocity

%***2018 init_Robot_v002;        % MK init_Robot_v002 now calls init_Field_002

%	initial robot wheel velocities & radius

