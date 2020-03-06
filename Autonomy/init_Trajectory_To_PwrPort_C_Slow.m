%   init_Trajectory_To_PwrPort_C_Slow.m
%
%   2020-03-01

% 2020-03-01 Notes on robot dimensions & placement
%
%   Note: Robot is aligned with starting line at the front of the rear
%   bumpers, so robot center is already 10" FORWARD
%   and
%   9" intake extendsion past bumpers
%   so robot should drive 19" shorter


targetZone = 4*ft;
LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY) - (targetZone/2); %Y coord of target zone red

temp1   = LineR - 19*in;    %   starting position adjusted by decreased driving distance

To_PwrPort_C_Slow.x =   [  temp1...
                    (temp1*0.3 + (Robot.L/2)*0.7)... % use 30 / 70 % split for slow down portion of trajectory
                    Robot.L/2
                ];

To_PwrPort_C_Slow.y =   [   TargetR...
                    TargetR...
                    TargetR
                ];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

To_PwrPort_C_Slow.v = [ 1.6 0.5];
%To_PwrPort_C_Slow.t_final = traj_length(To_PwrPort_C_Slow) / To_PwrPort_C_Slow.v  * 1.3;
To_PwrPort_C_Slow.t_final = 5;
To_PwrPort_C_Slow.name = 'To Power Port C Slow';

To_PwrPort_C_Slow.sub = sub_traj_lengths(To_PwrPort_C_Slow);

To_PwrPort_C_Slow.tstamps = traj_timestamps_v002(sub_traj_lengths(To_PwrPort_C_Slow), To_PwrPort_C_Slow.v);
To_PwrPort_C_Slow.v = [0 To_PwrPort_C_Slow.v];

% To_Trench_C.t_final = To_Trench_C.tstamps(length(To_Trench_C.tstamps));
% To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.7;
To_PwrPort_C_Slow.t_final = To_PwrPort_C_Slow.tstamps(end) * 1.3;
To_PwrPort_C_Slow.theta_start = 180*deg;