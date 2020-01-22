%   init_Trajectories
%   Version 6
%
%    Adonis Canada, Priyanshu Agrawal, Baris Sengezen
%
%   2018-03-05  Martin Krucinski
%               Added additional starting point Right SR,
%               and additional move distance at end of the move, add_x
%
%   2018-03-07  Martin Krucinski
%               Speed-up of all trajectories & modifications based on
%               2018-03-05 experimental tests on the Team Paragon field
%
%   2018-03-07  Martin Krucinski
%               version 5 simplifies trajectory generation to use only
%               4 points for Switch from the front moves and
%               5 points for Switch from the side moves
%               This enables us to simplify the code a lot and handle
%               calibration adjustments to the end point
%               based on field calibration in a simpler way

%-------------------------------------------------------------------------
%   Straight
Straight.x = [Field.RSR.x, Field.RSR.x+10*ft];
Straight.y = [Field.RSR.y, Field.RSR.y];
%   Martin Krucinski 2018-03-07
%Straight.v = 1;
Straight.v = 1.6;
Straight.t_final = 4;
Straight.name   = 'Straight';

%-------------------------------------------------------------------------
%   Arc
%
%TurnTest.x = [Field.RSR.x];
%TurnTest.y = [Field.RSR.y+5*ft];
Arc = get_Curve(90*deg, -90*deg, 1, 18, 5*ft, 3*ft+Field.RSR.x+12, Field.RSR.y+5*ft);

%   Martin Krucinski 2018-03-07
% Arc.v = 1.0;
% Arc.t_final = 10.0;
Arc.v = 1.6;
Arc.t_final = 6.25;

Arc.x = [12 Arc.x 12];
Arc.y = [Arc.y(1) Arc.y Arc.y(length(Arc.y))];
Arc.name    = 'Arc';

%-------------------------------------------------------------------------

all_traj_color      = 'R';                          % trajectory alliance color
N_traj_color        = length(all_traj_color );
all_start_points    = 'LMR';                        % Left, Middle, Right
N_start_points      = length(all_start_points);
all_switch_loc      = 'LR';                         % Left & Right Switch
N_switch_loc        = length(all_switch_loc);
all_switch_pos      = 'FS';                         % Front and Side Switch position
N_switch_pos        = length(all_switch_pos);

%-------------------------------------------------------------------------
%   Individual end point adjustments based on calibration
%-------------------------------------------------------------------------
%   From SM

% add + 3in MKrucinski 4/7/18 RSMLF.add_x   = 6.0*in;            %   additional x-move distance at the end of trajectory
RSMLF.add_x   = 9.0*in;            %   additional x-move distance at the end of trajectory
RSMLF.add_y   = 0.0;            %   additional y-move distance

%RSMRF.add_x   = 6.0*in;            %   additional x-move distance at the end of trajectory
RSMRF.add_x   = 9.0*in;            %   additional x-move distance at the end of trajectory
RSMRF.add_y   = 0.0;            %   additional y-move distance at the end of trajectory

RSMLS.add_x   = 0.0;            %   additional x-move distance at the end of trajectory
RSMLS.add_y   = 0.0;            %   additional y-move distance

RSMRS.add_x   = 0.0;            %   additional x-move distance at the end of trajectory
RSMRS.add_y   = 0.0;            %   additional y-move distance

%-------------------------------------------------------------------------
%   From SL

RSLLF.add_x   = 6.0*in;      %   additional x-move distance at the end of trajectory
RSLLF.add_y   = 0.0;      %   additional y-move distance

RSLRF.add_x   = 6.0*in;      %   additional x-move distance at the end of trajectory
RSLRF.add_y   = 0.0;      %   additional y-move distance

RSLLS.add_x   = 0.0;      %   additional x-move distance at the end of trajectory
RSLLS.add_y   = 0.0;      %   additional y-move distance

RSLRS.add_x   = 0.0;      %   additional x-move distance at the end of trajectory
RSLRS.add_y   = 0.0;      %   additional y-move distance

%-------------------------------------------------------------------------
%   From SR

RSRLF.add_x   = 6.0*in;      %   additional x-move distance at the end of trajectory
RSRLF.add_y   = 0.0;      %   additional y-move distance

RSRRF.add_x   = 6.0*in;      %   additional x-move distance at the end of trajectory
RSRRF.add_y   = 0.0;      %   additional y-move distance, per 03/05/18 Team Paragon testing

RSRLS.add_x   = 0.0;      %   additional x-move distance at the end of trajectory
RSRLS.add_y   = 0.0;      %   additional y-move distance

RSRRS.add_x   = 0.0;      %   additional x-move distance at the end of trajectory
RSRRS.add_y   = 0.0;      %   additional y-move distance

% RSLCLS.add_x = -12*in;
% RSLCLS.add_y = -1*ft;
%
%   Boston 2018-04-13
%   Remove the corrections for the slower trajectories at 1.3 m/s
RSLCLS.add_x = 0;
RSLCLS.add_y = 0;

%   Boston 2018-04-13
%   Remove the corrections for the slower trajectories at 1.3 m/s
% RSRCRS.add_x = 1*ft;
% RSRCRS.add_y = 1*ft;

RSRCRS.add_x = 0;
RSRCRS.add_y = 0;

RSRCLB.add_x = 0.0;
RSRCLB.add_y = 0.0;

RSLCRB.add_x = 0.0;
RSLCRB.add_y = 0.0;


SecondCubeLeftSwitch.add_x =  -15*in/sqrt(2);
SecondCubeLeftSwitch.add_y = -15*in/sqrt(2);

SecondCubeLeftSwitchForward.add_x = 3*in/sqrt(2);
SecondCubeLeftSwitchForward.add_y = 3*in/sqrt(2);

SecondCubeRightSwitch.add_x = -15*in/sqrt(2);
SecondCubeRightSwitch.add_y = -15*in/sqrt(2);

SecondCubeRightSwitchForward.add_x = 3*in/sqrt(2);
SecondCubeRightSwitchForward.add_y = -3*in/sqrt(2);

SecondCubeLeftSwitchArc.add_x =  0;
SecondCubeLeftSwitchArc.add_y = 0;

SecondCubeLeftSwitchArcForward.add_x =  0;
SecondCubeLeftSwitchArcForward.add_y = 0;

SecondCubeRightSwitchArc.add_x =  0;
SecondCubeRightSwitchArc.add_y = 0;

SecondCubeRightSwitchArcForward.add_x =  0;
SecondCubeRightSwitchArcForward.add_y = 0;


SecondCubeLeftSwitchv2.add_x = -20 * in / sqrt(2) - 16*in/sqrt(2);
SecondCubeLeftSwitchv2.add_y =  20 * in / sqrt(2) - 16*in/sqrt(2);

%   Boston 2018-04-13
%   Remove the corrections for the slower trajectories at 1.3 m/s
% 
% SecondCubeLeftSwitchv3.add_x = -20 * in / sqrt(2) - 16*in/sqrt(2);
% SecondCubeLeftSwitchv3.add_y =  20 * in / sqrt(2) - 16*in/sqrt(2);

SecondCubeLeftSwitchv3.add_x = 0;
SecondCubeLeftSwitchv3.add_y =  0;

%   Boston 2018-04-12
%   Move robot end position slightly lower on the field to grab cube
%   successfully, try 6*in first
%SecondCubeLeftSwitchv3.add_y    = SecondCubeLeftSwitchv3.add_y  - 6*in;
% 2018-04-13
SecondCubeLeftSwitchv3.add_y    = 0;


SecondCubeLeftSwitchForwardv2.add_x = 0;
SecondCubeLeftSwitchForwardv2.add_y = 0;

SecondCubeRightSwitchv2.add_x = -20 * in / sqrt(2) - 16*in/sqrt(2);
SecondCubeRightSwitchv2.add_y =  20 * in / sqrt(2) - 16*in/sqrt(2);

SecondCubeRightSwitchForwardv2.add_x = 0;
SecondCubeRightSwitchForwardv2.add_y = 0;

SecondCubeRightSwitchv3.add_x = 0.0; %-20 * in / sqrt(2) - 16*in/sqrt(2);
SecondCubeRightSwitchv3.add_y =  0.0; %20 * in / sqrt(2) - 16*in/sqrt(2);

%   Boston 2018-04-12
%   Move robot end position slightly lower on the field to grab cube
%   successfully, try 6*in first
% 2018-04-13
%SecondCubeRightSwitchv3.add_y = SecondCubeRightSwitchv3.add_y + 6*in;
SecondCubeRightSwitchv3.add_y = 0;

RSRCLBv2.add_x = 0.0;
RSRCLBv2.add_y = 0.0;

RSLCRBv2.add_x = 0.0;
RSLCRBv2.add_y = 0.0;
%-------------------------------------------------------------------------
%   Generate all trajectories depending on
%   the color,
%   start point,
%   switch location and
%   switch position flags
%-------------------------------------------------------------------------


for c=1:N_traj_color,
    for s=1:N_start_points,
        for l=1:N_switch_loc,
            for p=1:N_switch_pos,
                
                trajString  = [ all_traj_color(c) 'S' all_start_points(s) ...
                    all_switch_loc(l) all_switch_pos(p) ];
                
                clear traj
                
                traj.name   = trajString;
                traj.add_x  = eval( [ trajString '.add_x'] );
                traj.add_y  = eval( [ trajString '.add_y'] );
                
                Start_string = [ 'Field.' all_traj_color(c) 'S' all_start_points(s)];
                traj.x(1)   = eval([ Start_string '.x']);
                traj.y(1)   = eval([ Start_string '.y']);
                
                %   Modification in Boston 2018-04-12
                %   with larger bumpers, back corner probably hits back
                %   wall
                %   when robot turns at the start, add 8*in
                
                %                traj.x(2)   = traj.x(1) + Robot.L/2;
                traj.x(2)   = traj.x(1) + Robot.L/2 + 8*in;
                traj.y(2)   = traj.y(1);
                
                if all_switch_pos(p) == 'F',    % FRONT switch position
                    traj.x(3)   = traj.x(2) + 3*ft;
                    traj.x(4)   = Field.RSwitch.LVT_x - Robot.L/2 + traj.add_x;
                    if all_switch_loc(l) == 'L',    %   LEFT switch
                        
                        %traj.y(3)   = Field.RSwitch.LVT_y - traj.add_y;
                        
                        % MKrucinski 2018-03-08 Keep sign of add_y in the
                        % POSITIVE direction for ALL the FRONT moves,
                        %   i.e. positive add_y will increase y, i.e. shift
                        %   end position to the LEFT
                        %   this is DIFFERENT from SIDE position where
                        %   positive add_y drives the robot FURTHER into
                        %   the switch
                        %
                        
                        traj.y(3)   = Field.RSwitch.LVT_y + traj.add_y;
                        traj.y(4)   = traj.y(3);
                    else % switch_loc == 'R'        %   RIGHT switch
                        traj.y(3)   = Field.RSwitch.RVT_y + traj.add_y;
                        traj.y(4)   = traj.y(3);
                    end
                    % RSMR.x = [Field.RSM.x, Field.RSM.x + Robot.L, Field.RSM.x + Robot.L + 3*ft, Field.RSwitch.LVT_x - Robot.L/2 + RSMR.add_x];
                    % RSMR.y = [Field.RSM.y, Field.RSM.y, Field.RSwitch.RVT_y + RSMR.add_y, Field.RSwitch.RVT_y + RSMR.add_y];
                    
                    traj.v      = 2.0;
                    traj.t_final= ( traj_length(traj) / traj.v ) * 1.3;
                    
                else %switch_pos(p) == 'S'  % SIDE  switch position
                    %                    traj.x(3)   = traj.x(2);
                    %                   traj.x(3)   = traj.x(2) + 1.0;
                    % MKrucinski 03/10/18 Make turn 90 deg in order to avoid other robots
                    traj.x(3)   = traj.x(2) + 0.0;
                    traj.x(4)   = (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.br_x)/2 + traj.add_x;
                    traj.x(5)   = traj.x(4);
                    
                    %   2018-04-12 Martin Krucinski Boston
                    %   added +/- y adjustements in order not to hit
                    %   wall with new bumpers, start with 0.1 m
                    %   adjustement
                    %
                    if all_switch_loc(l) == 'L',    %   LEFT switch
                        traj.y(3)   = Field.RSwitch.LVT_y + 2*Robot.L - traj.add_y - 0.1;
                        traj.y(4)   = traj.y(3);
                        % RSMLS.y = [Field.RSM.y, Field.RSM.y, 4.04, 5.1723, 6.8, 7.2, 7.2, 6.8, Field.RSwitch.LeftP.tl_y+Robot.L/2 - add_y];
                        traj.y(5)   = Field.RSwitch.LeftP.tl_y + Robot.L/2 - traj.add_y;
                    else % switch_loc == 'R'        %   RIGHT switch
                        traj.y(3)   = Field.RSwitch.RVT_y - 2*Robot.L + traj.add_y + 0.1;
                        traj.y(4)   = traj.y(3);
                        %traj.y(5)   = RSMRS.y =  1.8 + traj.add_y;
                        traj.y(5)   = Field.RSwitch.RightP.bl_y - Robot.L/2 + traj.add_y;
                    end
                    
                    %(Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.br_x)/2*[1.01 1]+add_x
                    
                    %traj.v      = 2.0;
                    % *** Martin Krucinski 2018-04-13
                    % Slow down all Side Switch trajectories to 1.0
                    % 1.0 gives t_final 12.7 s for RSLRS, speed up a bit,
                    % to 1.3 m/s
                    traj.v      = 1.3;
                    traj.t_final= ( traj_length(traj) / traj.v ) * 1.3;
                end
                
                disp([ trajString ' via points initialized...' ] )
                eval([ trajString ' = traj;' ])
                
            end
        end
    end
end


init_TrajectoryRSLCLS
disp ('RSLCLS via points initialized...');

init_TrajectoryRSRCRS
disp ('RSRCLS via points initialized...');

% following trajectoies from this to next comment no longer in use
init_TrajectoryRSLCRB
disp ('RSLCRB via points initialized...');

init_TrajectoryRSRCLB
disp ('RSRCLB via points initialized...');

init_Trajectory2ndCubeLeftSwitch
disp ('SecondCubeLeftSwitch via points initialized...');

init_Trajectory2ndCubeLeftSwitchv3
disp('init_Trajectory2ndCubeLeftSwitchv3 via points initialized')

init_Trajectory2ndCubeLeftSwitchForward
disp ('SecondCubeLeftSwitchForward via points initialized...');

init_Trajectory2ndCubeRightSwitch
disp ('SecondCubeRightSwitch via points initialized...');

init_Trajectory2ndCubeRightSwitchForward
disp ('SecondCubeRightSwitchForward via points initialized...');

init_Trajectory2ndCubeLeftSwitchArc
disp ('SecondCubeLeftSwitchArc via points initialized...');

init_Trajectory2ndCubeLeftSwitchArcForward
disp ('SecondCubeLeftSwitchArcForward via points initialized...');

init_Trajectory2ndCubeRightSwitchArc
disp ('SecondCubeRightSwitchArc via points initialized...');

init_Trajectory2ndCubeRightSwitchArcForward
disp ('SecondCubeRightSwitchArcForward via points initialized...');
% useless trajectories end here

init_Trajectory2ndCubeLeftSwitchv2
disp ('SecondCubeLeftSwitchv2 via points initialized...');

init_Trajectory2ndCubeLeftSwitchForwardv2
disp ('SecondCubeLeftSwitchForwardv2 via points initialized...');

init_Trajectory2ndCubeRightSwitchv2
disp ('SecondCubeRightSwitchv2 via points initialized...');

init_Trajectory2ndCubeRightSwitchv3
disp ('SecondCubeRightSwitchv3 via points initialized...');

init_Trajectory2ndCubeRightSwitchForwardv2
disp ('SecondCubeRightSwitchForwardv2 via points initialized...');

init_TrajectoryRSLCRBv2
disp ('RSLCRBv2 via points initialized...');

init_TrajectoryRSRCLBv2
disp ('RSRCLBv2 via points initialized...');

init_Trajectory_Test01
init_Trajectory_Test02
init_Trajectory_Test03
init_Trajectory_Test04
disp('Test Trajectories initialized...')
