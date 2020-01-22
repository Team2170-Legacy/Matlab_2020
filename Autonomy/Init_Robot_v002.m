%Robot.L = 2*ft; % Needs to be changed
%Robot.W = 2*ft; % Needs to be changed

%   This code is from FRC 2017 Steamworks


%   init_Robot_v002.m
%Robot.
%   Jacob Krucinski (jacob1576@gmail.com)
%
%   03/02/2017  Updated Martin Krucinski to re-arranged field starting
%   positions

init_Constants

%   Martin Krucinski 2018-03-07
%*** removed speed limit 2018-03-31 Robot.v_max = 3.6;    % Robot max velocity (on each R / L drive wheel)
Robot.v_max = 1.5%3.0;    % Robot max velocity (on each R / L drive wheel)



%% Simulation sampling time
%Robot.Ts        = 0.010;        % [s]
Robot.Ts        = 0.020;        % [s]

t_auto_end      = 0;

% Set robot inital position in simulate_robot_v008.m for FRC 2019
%
%Robot.Start_Pos.x   = 1;
%Robot.Start_Pos.y   = 2;
%Robot.Start_Pos.theta   = 0*deg;


%% Robot dimensions and velocity

%   Update 03/03/2018 Martin Krucinski to account for experimental
%   differences
%Robot.d	= 25*in;		% distance between wheel centerlines

Robot.d	= 26*in;	% distance between wheel centerlines

%   Update 03/03/2018 Martin Krucinski to account for experimental
%   differences
%Robot.R = 2.5*in;         % [m]		Robot wheel radius
Robot.R = 2.5*in  * (118+3/4)/120;         % [m]		Robot wheel radius


%Robot.BL = 7.5*in; % bumper length
%   2018-03-05  Martin Krucinski, measured at field in Windsor
Robot.BL = 6.5*in; % bumper length

%   Martin Krucinski 2018-03-07
Robot.L = 27*in+Robot.BL;		% Robot length (along the driving direction)
Robot.W = 27*in+Robot.BL;
%
%   Updated Martin Krucinski 03/03/2017
%   Per info on our robot, max speed is 12.6 fps, which is 3.84 m/s
%   We use v_max = 3.048 m/s below, 12.6 fps * 80% is 3.07 m/s.
%   With the additional margin = 0.80 in the calc_*_* scripts
%   max robot velocity will be 2.458 m/s, hopefully sufficient margin.
%   0.80 * 0.80 = 0.64, i.e. 64% of max velocity

%Robot.v_max = 3.048;    % Robot max velocity (on each R / L drive wheel)
%Robot.v_max = 1.25;    % Robot max velocity (on each R / L drive wheel)
%*** MK 2019-03-02 This seems wrong it is not the WHEEL angular max velocity, but the ROBOT
%***Robot.omega_max = Robot.v_max / Robot.R; % Robot max angular velocity (rad/s)
%*** use 1 rev / s instead
Robot.omega_max = 2*pi*1; % Robot max angular velocity (rad/s)

Robot.a_max = 3;        %Robot assumed acceleration

%init_Field_v002;
% FRC2018  init_Field_v005;
%Init_Field_v001

% % Robot starting position selection
%
% Robot.Start_Pos     = Field.RS3;    % CHANGE SPECIFIED STARTING POSITION HERE
%                                     % OR
%                                     % in the selection of Autonomous
%                                     % Trajectory, calc_trajectory_v8.m and
%                                     % its associated helper scripts, e.g.
%                                     % calc_RS3_RB_v001.m etc.
%
% Robot.x0 = Robot.Start_Pos.x;
% Robot.y0 = Robot.Start_Pos.y;
% Robot.theta0 = Robot.Start_Pos.theta;

if 0,
    %   Prepare figure for field drawing
    f1		= figure;				% open figure
    axis('equal')					% ensure x & y directions are scale equally on screen
    xlim([-6*ft Field.L + 5*ft])					% [m]	set figure limits for x-axis
    ylim([-2*ft Field.W + 2*ft])					% [m]	set figure limits for y-axis
    %xlim([-30 30])
    %ylim([-20 20])
    set(f1,'DefaultLineLineWidth',3);	% set figure to draw with thick lines by default
    grid on							% draw a grid on the figure
    hold on							% ensure multiple drawing commands are overlaid on the figure
    % without erasing figure first
end

Field.t = 0;

