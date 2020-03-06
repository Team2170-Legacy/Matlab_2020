%
%   v003
%

targetZone = 4*ft;
RobotSep = 12*in;
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotStartX = AutoLineRed.C1_x;

To_PwrPort_R.x =   [   RobotStartX...
                     RobotStartX-1.0...
                    Robot.L/2];
            
RobotStartTangentX = To_PwrPort_R.x(1)-To_PwrPort_R.x(3);

To_PwrPort_R.y =   [   RobotStartY+Robot.W+RobotSep...
                     RobotStartY...
                    RobotStartY];
            
RobotStartTangentY = To_PwrPort_R.y(1)-To_PwrPort_R.y(3);

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

To_PwrPort_R.v = 1.1;
%To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.3;
To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.7;

To_PwrPort_R.name = 'To Power Port Right';
To_PwrPort_R.theta_start = (atan(RobotStartTangentY/RobotStartTangentX)+180*deg);