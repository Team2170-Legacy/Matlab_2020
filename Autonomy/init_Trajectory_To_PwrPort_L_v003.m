%
%   v003
%

targetZone = 4*ft;
RobotSep = 12*in;
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotStartX = AutoLineRed.C1_x;

To_PwrPort_L.x =   [   RobotStartX...
                     RobotStartX-1.0...
                    Robot.L/2];
            
RobotStartTangentX = To_PwrPort_L.x(1)-To_PwrPort_L.x(3);

To_PwrPort_L.y =   [   RobotStartY - Robot.W - RobotSep...
                     RobotStartY...
                    RobotStartY];
            
RobotStartTangentY = To_PwrPort_L.y(1)-To_PwrPort_L.y(3);

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

To_PwrPort_L.v = 1.1;
%To_PwrPort_L.t_final = traj_length(To_PwrPort_L) / To_PwrPort_L.v  * 1.3;
To_PwrPort_L.t_final = traj_length(To_PwrPort_L) / To_PwrPort_L.v  * 1.7;

To_PwrPort_L.name = 'To Power Port Left';
To_PwrPort_L.theta_start = (atan(RobotStartTangentY/RobotStartTangentX)+180*deg);