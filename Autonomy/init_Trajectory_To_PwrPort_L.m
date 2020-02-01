targetZone = 4*ft;
RobotSep = 12*in;
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotStartX = AutoLineRed.C1_x;

To_PwrPort_L.x =   [   RobotStartX...
                        RobotStartX-0.25...
                     RobotStartX-0.5...
                     RobotStartX-1.0...
                    Robot.L/2
                ];
            
RobotStartTangentX = To_PwrPort_L.x(1)-To_PwrPort_L.x(5);

To_PwrPort_L.y =   [   RobotStartY-Robot.W-RobotSep...
                        RobotStartY-Robot.W*3/4.0...
                     RobotStartY-Robot.W/3.0...
                     RobotStartY...
                    RobotStartY
                ];
            
RobotStartTangentY = To_PwrPort_L.y(1)-To_PwrPort_L.y(5);


%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

To_PwrPort_L.v = 1.6;
To_PwrPort_L.t_final = traj_length(To_PwrPort_L) / To_PwrPort_L.v  * 1.3;
To_PwrPort_L.name = 'To Power Port L';
To_PwrPort_L.theta_start = (180*deg+atan(RobotStartTangentY/RobotStartTangentX));