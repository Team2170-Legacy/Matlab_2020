%	simulate_robot_v008.m
%
%   For FRC 2018 PowerUp
%   Modified for FRC 2018 Control by Adonis Canada, Priyanshu Agrawal,
%   and Baris Sengezen
%
%   v008    Clean-up by Dr K. 3/1/2019

S

make_movies = true;

init_Constants
Init_Robot_v002
Init_Field_v003

total_time = 2;

robot_pos_number         = 7

switch robot_pos_number,
    case 1,
        Robot.Start_Pos.x       =  6.3;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  270*deg;
    case 2,
        Robot.Start_Pos.x       =  5.7;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  270*deg;
    case 3,
        Robot.Start_Pos.x       =  6.3;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  250*deg;
    case 4,
        Robot.Start_Pos.x       =  6.3;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  290*deg;
    case 5,
        Robot.Start_Pos.x       =  6.0;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  230*deg;
    case 6,
        Robot.Start_Pos.x       =  5.5;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  230*deg;
    case 7,
        Robot.Start_Pos.x       =  6.0;
        Robot.Start_Pos.y       =  3;
        Robot.Start_Pos.theta   =  270*deg;
    otherwise
        Robot.Start_Pos.x       =  5.7;
        Robot.Start_Pos.y       =  2;
        Robot.Start_Pos.theta   =  270*deg;
        
end

Robot.v0    = 1.0;  % initial assumed robot velcity

%    initialize robot velocities BEFORE 1st run of camera & controller

v       = Robot.v0;
omega   = 0;




Robot.wL0		= Robot.v0 / Robot.R;		% [rad/s]	initial left wheel angular velocity
Robot.wR0		= Robot.v0 / Robot.R;		% [rad/s]	initial left wheel angular velocity


%	Initialize simulation parameters
Ts			= Robot.Ts;			% [s]		Simulation sample time
tfinal      = total_time;
all_t       = (0:Ts:tfinal);

fps         = 10                % [frames/s]    Camera frame rate
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
    %*** MK 2019-03-02 this is the 2018 Movie figure size   set(f1,'position', [50 50 pos(3)*2 pos(4)*1.7]);
    set(f1,'position', [200 200 800 400]);
    hold on							% ensure multiple drawing commands are overlaid on the figure
    draw_Field_v001
    
    axis('equal')					% ensure x & y directions are scale equally on screen
    xlim([-6*ft Field.L + 5*ft])					% [m]	set figure limits for x-axis
    ylim([-2*ft Field.W + 2*ft])					% [m]	set figure limits for y-axis
    set(f1,'DefaultLineLineWidth',3);% set figure to draw with thick lines by default
    grid on							% draw a grid on the figure
    % without erasing figure first
    
    Field.t = 0;
    %***2018 draw_Field_v002(Field)
end


%	Initial conditions

Robot.x				= Robot.Start_Pos.x;		% [m] Robot center x-position
Robot.y				= Robot.Start_Pos.y;		% [m] Robot center y-position
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

N_pixel         = 160;%320;
camera_view     = 60*deg;   %   Camera HORIZONTAL viewing angle

%FRC2018  target_distance  = 9;      %  Initial distance to target, large to ENABLE vision feedback control

target_distance  = 0;      %  Initial distance to target, large to ENABLE vision feedback control



t_camera        = 0;        % Time since last camera frame grabbed
%FRC2018 camera_delay = Ts_camera;
camera_delay = 0;

Target.x        = 6;
Target.y        = 0;

Robot.wL_all		= zeros(N,1);	% [rad/s]	robot Left wheel angular velocities
Robot.wR_all		= zeros(N,1);	% [rad/s]	robot Right wheel angular velocities

switch_direction    = false;        % flag to keep track of when trajectory direction switches

%
% prev_forward_flag   = true;
% if isfield(trajectory, 'Drive_Forward')
%     prev_forward_flag   = trajectory.Drive_Forward(1);
% end

prev_distance       = 0;

distance            = 0;
timer               = 0.0;

%	Main simulation loop
%for i=2:N
for i=1:N
    t					= all_t(i);		% [s] get current simulation time
    Robot.t				= t;
    Field.t             = t;
    
    
    
    % Calculate distance/angle
    prev_distance   = distance;
    [angle,distance] = calcAngleandDistance_v3(Target,Robot);
    
    %*************** testing 03/01/2019***************
    %angle = angle * 2;
    %*************** testing 03/01/2019***************
    
    
    timer = timer + Ts;
    
    %     if (~forward_flag)
    %         if (angle<=0)
    %             angle = (angle+180*deg);
    %         else
    %             angle = (angle-180*deg);
    %         end
    %     end
    % t_camera
    if (t_camera>=Ts_camera),
    %    t
        t_camera            = Ts;
        
        e_Gear_x        = N_pixel * angle / camera_view;
        target_distance = distance;
        
        % Controller code
        % OLD from FRC 2018 * **[v,omega] = Controller_v001(distance, angle, Robot);
        
        
        %   FRC 2019 use CONTROLLER function with DISTANCE in [ft]
        %  and angle error in PIXELS
        distance_ft         = distance/ft;
        [v_ft,omega] = Controller_v002(distance_ft, e_Gear_x, Robot);
        
        v       = v_ft*ft;      % convert back to m/s
    else
        t_camera    = t_camera + Ts;
    %    t_camera
    end
    
    % Convert v and omega to omega_l and omega_r, i.e Robot.wL, Robot.wR
    %   vL - left wheel surface velocity [m/s] (NOT angular)
    %   vR - right          -"-
    
    vLtemp          = v - omega*Robot.d/2;
    vL          = max( -Robot.v_max, min( +Robot.v_max , vLtemp));
    vRtemp          = v + omega*Robot.d/2;
    vR          = max( -Robot.v_max, min( +Robot.v_max , vRtemp));
    Robot.wL    = vL / Robot.R;
    Robot.wR    = vR / Robot.R;
    
    %   Rest of simulator code starts here
    
    delta_vL            = 0;
    delta_vR            = 0;
    
    %   Add Vision Blending at end of move when t >= t_auto_end !!!!
    
    
    %     if (t>=t_auto_end) && (target_distance>18*in) && (t_camera>=Ts_camera),
    %         t_camera            = Ts;
    %
    %         %   Calculate e_Gear_x [pixels]
    %         %   given Robot.x, Robot.y, Robot.theta
    %         %   Target.x, Target.y
    %
    %         %         Target.x        = Peg.C1_x;
    %         %         Target.y        = Peg.C1_y;
    %
    %         Camera.x        = Robot.x - Robot.L/2*cos(Robot.theta); % Note MINUS sign since robot drives BACWARDS to the peg
    %         Camera.y        = Robot.y - Robot.L/2*sin(Robot.theta);
    %
    %         target_distance = norm([ Target.x - Camera.x   Target.y - Camera.y ]);
    %
    %         theta_Robot_REV = Robot.theta - 180*deg;        % robot angle for REVERSE driving
    %         theta_target    = theta_Robot_REV - atan2(Target.y - Camera.y , Target.x - Camera.x );
    %         e_Gear_x_previous       = e_Gear_x;
    %         e_Gear_x        = N_pixel * theta_target / camera_view;
    %     else
    %         t_camera        = t_camera + Ts;
    %     end
    
    %   Use a Ts_camera delayed image error to simulate a delay in
    %   processing camera images
    
    %     if camera_delay,
    %         delta_vL        = +Kp * e_Gear_x_previous;
    %         delta_vR        = -Kp * e_Gear_x_previous;
    %     else
    %
    %         delta_vL        = +Kp * e_Gear_x;
    %         delta_vR        = -Kp * e_Gear_x;
    %     end
    %
    %
    %     delta_wL        = delta_vL / Robot.R;
    %     delta_wR        = delta_vR / Robot.R;
    
    %FRC 2018 Robot.wL        = all_omega_L(i) + delta_wL;
    %FRC 2018 Robot.wR        = all_omega_R(i) + delta_wR;
    
    
    Robot.vFwd			= 1/2 * Robot.R * (Robot.wL + Robot.wR);		% [m/s] Robot Forward velocity, average of the two wheels
    Robot.omega			= (Robot.wR - Robot.wL) * Robot.R /  Robot.d;	% Robot Angular velocity
    
    %     Robot.vFwd
    %     Robot.omega
    
    
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
        %        draw_Trajectory(trajectory);
        
        
        displayangle = (round(angle/deg * 100)/100);
        displaydistance = (round(distance*100)/100);
        displayvFwd = (round(Robot.vFwd*100)/100);
        
        %         text(Field.L/2-1, Field.W/2, ['alpha = ' num2str(displayangle) '°']);
        %         text(Field.L/2-1, Field.W/2-1/2, ['distance = ' num2str(displaydistance) ' m']);
        %         text(Field.L/2-1, Field.W - 0.5, trajectory.name);
        
        text(10, Field.W/2, ['angle = ' num2str(displayangle) '°']);
        text(10, Field.W/2-1/2, ['distance = ' num2str(displaydistance) ' m']);
        text(10, Field.W/2-1,  ['vFwd = ' num2str(displayvFwd) ' m/s']);
        
        %isSkewed = isSkewed(Robot.C1_x, Robot.C1_y, Robot.C2_x, Robot.C2_y);
        %text(10, Field.W/2-1,  ['isSkewed = ' num2str(isSkewed) ' m/s']);
        
        %        text(10, Field.W - 0.5, trajectory.name);
        
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
stairs(all_t, Robot.wL_all*Robot.R, 'b');	% Plot left wheel velocities in Blue
stairs(all_t, Robot.wR_all*Robot.R, 'r');	% Plot right wheel velocities in Red
hold off
xlabel('t [s]')
ylabel('v [m/s]')
legend('vL','vR')
%title(trajString)


%   plot wheel accelerations

Robot.aL_all = [ 0 ; diff(Robot.wL_all)/Robot.Ts];
Robot.aR_all = [ 0 ; diff(Robot.wR_all)/Robot.Ts];

if 0,
    
    f2b		= figure;				% open figure
    set(f2b,'DefaultLineLineWidth',3);	% set figure to draw with thick lines by default
    grid on							% draw a grid on the figure
    hold on
    stairs(all_t, Robot.aL_all*Robot.R, 'b');	% Plot left wheel velocities in Blue
    stairs(all_t, Robot.aR_all*Robot.R, 'r');	% Plot right wheel velocities in Red
    hold off
    xlabel('t [s]')
    ylabel('a [m/s^2]')
    legend('aL','aR')
    %title(trajString)
end

if 1,
    
    f3		= figure;				% open figure
    set(f3,'DefaultLineLineWidth',3);	% set figure to draw with thick lines by default
    
    subplot(311)
    title('Robot positions')
   stairs(all_t, Robot.x_all);	% Plot robot x-positions
    grid on							% draw a grid on the figure
    ylabel('x [m]')
    
    subplot(312)
   stairs(all_t, Robot.y_all);	% Plot robot y-positions
    grid on							% draw a grid on the figure
    ylabel('y [m]')
    
    subplot(313)
    stairs(all_t, Robot.theta_all);	% Plot robot angles
    grid on							% draw a grid on the figure
    ylabel('theta [rad]')
    
    xlabel('t [s]')
    
    %    title(trajString)
    
end

Robot.wL_all(1)		= Robot.wL;
Robot.wR_all(1)		= Robot.wR;

all_omega_R     = Robot.wR_all;
all_omega_L     = Robot.wL_all;

t_auto_end      = all_t(end);
i_auto_end      = length(all_t);
