%	simulate_robot_v006.m
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

%   Martin Krucinski 02/08/2018
%   Select trajectory for testing
%trajectory = BSMR %BSML


% Select trajectories to simulate
if ~exist('trajectory', 'var')
    trajectory = RSML;
    disp(' Using a default trajectory RSML');
end


N   = length(trajectory.x);       % number of via points
distances   = zeros(N-1,1);       % reserve memory space for all distances and initialize to zero

for j=1:(N-1)
    dx              = trajectory.x(j+1) - trajectory.x(j);
    dy              = trajectory.y(j+1) - trajectory.y(j);
    distances(j)    = sqrt(dx^2 + dy^2);
    
    
end

% if trajectory.x(1) ~= Field.RSM.x(1)
%     Robot.Start_Pos.theta = 180*deg;
%
% else
%     Robot.Start_Pos.theta = 0*deg;
% end

if isfield(trajectory, 'theta_start')
    Robot.Start_Pos.theta = trajectory.theta_start;
else
    Robot.Start_Pos.theta = 0*deg;
end

traj_length = sum(distances);
total_time = traj_length/trajectory.v;

%***2018 init_Robot_v002;        % MK init_Robot_v002 now calls init_Field_002

%	initial robot wheel velocities & radius

Robot.wL0		= 0;		% [rad/s]	initial left wheel angular velocity
Robot.wR0		= 0;		% [rad/s]	initial left wheel angular velocity


%	Initialize simulation parameters
Ts			= Robot.Ts;			% [s]		Simulation sample time
% FRC_2018      tfinal      = all_t(end);
tfinal      = trajectory.t_final;
all_t       = (0:Ts:tfinal);

fps         = 25/2;                % [frames/s]    Camera frame rate
Ts_camera   = 1/fps;            % [s]           Camera "sample" time

N			= length(all_t);	% []		Number of simulation time points

%	Robot movement simulation

%	Initializations

% Allocate storage for all robot simulation variables
Robot.x_all			= zeros(N,1);	% [m] x-positions for all time-points in simulation
Robot.y_all			= zeros(N,1);	% [m] y-positions
Robot.theta_all		= zeros(N,1);	% [rad] robot angle

Robot.vx_all		= zeros(N,1);	% [m/s]	robot velocities
Robot.vy_all		= zeros(N,1);
Robot.omega_all		= zeros(N,1);	% [rad/s]	robot angular velocities

Robot.wL_all		= zeros(N,1);	% [rad/s]	robot Left wheel angular velocities
Robot.wR_all		= zeros(N,1);	% [rad/s]	robot Right wheel angular velocities
Robot.vFwd_all		= zeros(N,1);	% [m/s]		robot forward velocity (in the direction it is pointing)
Robot.e_Gear_x_all  = zeros(N,1);	% [pixels]  robot gear target vision error
Robot.target_distance_all = zeros(N,1);	% [m]  robot camera distance to target

if make_movies,
    vWriter = VideoWriter('Robot_Movie','MPEG-4');	% initialize vide capture of simulation frames
    open(vWriter);									% open movie file
    
    f1		= figure; % open figure
    pos = get(f1, 'position');
    set(f1,'position', [50 50 pos(3)*2 pos(4)*1.7]);
    hold on							% ensure multiple drawing commands are overlaid on the figure
    draw_Field_v001
    draw_Trajectory(trajectory);
    
    axis('equal')					% ensure x & y directions are scale equally on screen
    xlim([-6*ft Field.L + 5*ft])					% [m]	set figure limits for x-axis
    ylim([-2*ft Field.W + 2*ft])					% [m]	set figure limits for y-axis
    %xlim([-30 30])
    %ylim([-20 20])
    set(f1,'DefaultLineLineWidth',3);% set figure to draw with thick lines by default
    grid on							% draw a grid on the figure
    % without erasing figure first
    
    Field.t = 0;
    %***2018 draw_Field_v002(Field)
end


%	Initial conditions

Robot.x				= trajectory.x(1);		% [m] Robot center x-position
Robot.y				= trajectory.y(1);		% [m] Robot center y-position
Robot.theta			= Robot.Start_Pos.theta;	% [rad] Robot angle CCW from x-axis

Robot.wL			= Robot.wL0;	% [rad/s]	robot Left wheel angular velocity
Robot.wR			= Robot.wR0;	% [rad/s]	robot Right wheel angular velocity

Robot.x_all(1)		= Robot.x;		% Store all robot variables in storage arrays
Robot.y_all(1)		= Robot.y;
Robot.theta_all(1)	= Robot.theta;

Robot.wL_all(1)		= Robot.wL;
Robot.wR_all(1)		= Robot.wR;

Robot.vFwd			= 1/2 * Robot.R * (Robot.wL + Robot.wR);	% Robot Forward velocity, average of the two wheels
Robot.vFwd_all(1)	= Robot.vFwd;
e_Gear_x            = 0;
e_Gear_x_previous   = 0;

delta_vL            = 0;
delta_vR            = 0;

N_pixel         = 320;
camera_view     = 50*deg;   %   Camera HORIZONTAL viewing angle
%FRC2018  target_distance  = 9;      %  Initial distance to target, large to ENABLE vision feedback control

target_distance  = 0;      %  Initial distance to target, large to ENABLE vision feedback control



t_camera        = 0;        % Time since last camera frame grabbed
%   Implement P-control error correction, overlaid on the
%   profile wheel velocities

%*** UNSTABLE for fps = 7 & 1-step delay   Kp      = 0.004; %0.001666;
% UNSTABLE Kp      = 0.002; %0.001666;
% Kp      = 0.001; %0.001666;
Kp = 0.004;

%FRC2018 camera_delay = Ts_camera;
camera_delay = 0;
%   Peg selection
%    Peg                 = Field.RP1;
%***2018 Peg                 = eval(end_pos);
%***2018 Target.x        = Peg.C1_x;
%***2018 Target.y        = Peg.C1_y;

Target.x        = 4;
Target.y        = 2;

Robot.wL_all		= zeros(N,1);	% [rad/s]	robot Left wheel angular velocities
Robot.wR_all		= zeros(N,1);	% [rad/s]	robot Right wheel angular velocities

switch_direction    = false;        % flag to keep track of when trajectory direction switches


prev_forward_flag   = true;
if isfield(trajectory, 'Drive_Forward')
    prev_forward_flag   = trajectory.Drive_Forward(1);
end

prev_distance       = 0;
distance            = 0;
timer               = 0.0;

%	Main simulation loop
for i=2:N
    t					= all_t(i);		% [s] get current simulation time
    Robot.t				= t;
    Field.t             = t;
    
    %***2018     Robot.wL			= all_omega_L(i);			% [rad/s]	Trajectory planned wheel velocities
    %***2018     Robot.wR			= all_omega_R(i);
    
    %*******************************************************************************************
    %*** Open Loop Control
    %***Robot.wL            = 2*pi*6;
    %***Robot.wR            = 2*pi*5;
    %*******************************************************************************************
    
    %**** FRC2018 Controller code
    
    
    % Calculate trajectory percent as a function of time
    % 1. Calculate length of trajectory
    
    
    % 2. Calculate total time for trajectory i.e trajectory
    %        total_time = traj_length/robot.v_max;
    
    
    % 3. Percentage = Current time/total trajectory time
    percentage = t/total_time*100;
    
    % Get carrot
    % [carrot] = get_Carrot(percentage, trajectory);
    [carrot, forward_flag] = get_Carrot_v002(percentage, trajectory);
    if forward_flag ~= prev_forward_flag,
        switch_direction    = true;
        timer               = 0.0;
    end
    prev_forward_flag    = forward_flag;
    
    % Calculate distance/angle
    %    [angle,distance] = calcAngleandDistance(carrot,Robot);
    prev_distance   = distance;
    [angle,distance] = calcAngleandDistance_v2(carrot,Robot);
    
    %if switch_direction && timer > 0.9,
    if switch_direction && carrot.y < Robot.y - 0.1,
        switch_direction = false;
    else
        timer = timer + Ts;
    end
    
    if (~forward_flag)
        if (angle<=0)
            angle = (angle+180*deg);
        else
            angle = (angle-180*deg);
        end
    end
    
    if (switch_direction)
        %         if (angle<=0)
        %             angle = (angle+180*deg);
        %         else
        %             angle = (angle-180*deg);
        %         end
        angle = 0.0;        % disable all turning for a while during direction switching
    end
    
    % Controller code
    [v,omega] = Controller_v001(distance, angle, Robot);
    
    % Convert v and omega to omega_l and omega_r, i.e Robot.wL, Robot.wR
    %   vL - left wheel surface velocity [m/s] (NOT angular)
    %   vR - right          -"-
    
    vL          = v - omega*Robot.d/2;
    vR          = v + omega*Robot.d/2;
    Robot.wL    = vL / Robot.R;
    Robot.wR    = vR / Robot.R;
    
    %   Rest of simulator code starts here
    
    delta_vL            = 0;
    delta_vR            = 0;
    
    %   Add Vision Blending at end of move when t >= t_auto_end !!!!
    
    
    if (t>=t_auto_end) && (target_distance>18*in) && (t_camera>=Ts_camera),
        t_camera            = Ts;
        
        %   Calculate e_Gear_x [pixels]
        %   given Robot.x, Robot.y, Robot.theta
        %   Target.x, Target.y
        
        Target.x        = Peg.C1_x;
        Target.y        = Peg.C1_y;
        
        Camera.x        = Robot.x - Robot.L/2*cos(Robot.theta); % Note MINUS sign since robot drives BACWARDS to the peg
        Camera.y        = Robot.y - Robot.L/2*sin(Robot.theta);
        
        target_distance = norm([ Target.x - Camera.x   Target.y - Camera.y ]);
        
        theta_Robot_REV = Robot.theta - 180*deg;        % robot angle for REVERSE driving
        theta_target    = theta_Robot_REV - atan2(Target.y - Camera.y , Target.x - Camera.x );
        e_Gear_x_previous       = e_Gear_x;
        e_Gear_x        = N_pixel * theta_target / camera_view;
    else
        t_camera        = t_camera + Ts;
    end
    
    %   Use a Ts_camera delayed image error to simulate a delay in
    %   processing camera images
    
    if camera_delay,
        delta_vL        = +Kp * e_Gear_x_previous;
        delta_vR        = -Kp * e_Gear_x_previous;
    else
        
        delta_vL        = +Kp * e_Gear_x;
        delta_vR        = -Kp * e_Gear_x;
        
    end
    
    
    delta_wL        = delta_vL / Robot.R;
    delta_wR        = delta_vR / Robot.R;
    
    %FRC 2018 Robot.wL        = all_omega_L(i) + delta_wL;
    %FRC 2018 Robot.wR        = all_omega_R(i) + delta_wR;
    
    
    Robot.vFwd			= 1/2 * Robot.R * (Robot.wL + Robot.wR);		% [m/s] Robot Forward velocity, average of the two wheels
    Robot.omega			= (Robot.wR - Robot.wL) * Robot.R /  Robot.d;	% Robot Angular velocity
    
    Robot.vx			= Robot.vFwd * cos( Robot.theta );		% [m/s]		Robot center x-velocity
    Robot.vy			= Robot.vFwd * sin( Robot.theta );		% [m/s]		Robot center y-velocity
    
    Robot.x				= Robot.x + Robot.vx * Ts;			% [m]	Integrate robot x-position
    Robot.y				= Robot.y + Robot.vy * Ts;			% [m]	Integrate robot y-position
    Robot.theta			= Robot.theta + Robot.omega * Ts;	% [rad]	Integrate robot angle
    
    if make_movies,
        draw_Robot(Robot);						% Call function to draw Robot in figure
        %***   plot( Robot.x, Robot.y , 'o');           % 2018 Simple single point robot for now
        
        %****draw_Field_v001(Field);
        draw_Field_v001
        draw_Trajectory(trajectory);
        draw_Carrot(carrot);
        
        
        displayangle = (round(angle/deg * 100)/100);
        displaydistance = (round(distance*100)/100);
        
        text(Field.L/2-1, Field.W/2, ['alpha = ' num2str(displayangle) '°']);
        text(Field.L/2-1, Field.W/2-1/2, ['distance = ' num2str(displaydistance) ' m']);
        
        text(Field.L/2-1, Field.W - 0.5, trajectory.name);
        
        Robot_Figure		= getframe(f1);		% Capture screenshot image of figure
        Robot_Image			= Robot_Figure.cdata;
        %	pause
        
        if i < N
            cla         % Erase figure in preparation for next simulation step
        end
        
    else
        clc
        t
    end
    
    
    Robot.x_all(i)		= Robot.x;		% Store all robot variables in storage arrays
    Robot.y_all(i)		= Robot.y;
    Robot.theta_all(i)	= Robot.theta;
    
    Robot.wL_all(i)		= Robot.wL;
    Robot.wR_all(i)		= Robot.wR;
    
    Robot.e_Gear_x_all(i)   = e_Gear_x;
    Robot.target_distance_all(i)    = target_distance;
    
    if make_movies,
        writeVideo(vWriter, Robot_Image);			% Write screenshot image to video file
    end
end

if make_movies,
    close(vWriter)			% Close robot simulation video file
end

f2		= figure;				% open figure
set(f2,'DefaultLineLineWidth',3);	% set figure to draw with thick lines by default
grid on							% draw a grid on the figure
hold on
plot(all_t, Robot.wL_all*Robot.R, 'b');	% Plot left wheel velocities in Blue
plot(all_t, Robot.wR_all*Robot.R, 'r');	% Plot right wheel velocities in Red
hold off
xlabel('t [s]')
ylabel('v [m/s]')
title(trajString)


%   plot wheel accelerations

Robot.aL_all = [ 0 ; diff(Robot.wL_all)/Robot.Ts];
Robot.aR_all = [ 0 ; diff(Robot.wR_all)/Robot.Ts];

f2b		= figure;				% open figure
set(f2b,'DefaultLineLineWidth',3);	% set figure to draw with thick lines by default
grid on							% draw a grid on the figure
hold on
plot(all_t, Robot.aL_all*Robot.R, 'b');	% Plot left wheel velocities in Blue
plot(all_t, Robot.aR_all*Robot.R, 'r');	% Plot right wheel velocities in Red
hold off
xlabel('t [s]')
ylabel('a [m/s^2]')
title(trajString)

if 0,
    
    f3		= figure;				% open figure
    set(f3,'DefaultLineLineWidth',3);	% set figure to draw with thick lines by default
    
    subplot(311)
    title('Robot positions')
    plot(all_t, Robot.x_all);	% Plot robot x-positions
    grid on							% draw a grid on the figure
    ylabel('x [m]')
    
    subplot(312)
    plot(all_t, Robot.y_all);	% Plot robot y-positions
    grid on							% draw a grid on the figure
    ylabel('y [m]')
    
    subplot(313)
    plot(all_t, Robot.theta_all);	% Plot robot angles
    grid on							% draw a grid on the figure
    ylabel('theta [rad]')
    
    xlabel('t [s]')

    title(trajString)

end

Robot.wL_all(1)		= Robot.wL;
Robot.wR_all(1)		= Robot.wR;

all_omega_R     = Robot.wR_all;
all_omega_L     = Robot.wL_all;

t_auto_end      = all_t(end);
i_auto_end      = length(all_t);
