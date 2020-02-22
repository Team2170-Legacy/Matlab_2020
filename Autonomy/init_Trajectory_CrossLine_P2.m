LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY)-targetZone/2; %Y coord of target zone red
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotSep = 12*in;

CrossLine_P2.x =   [   LineR...
                    15*ft
                ];

CrossLine_P2.y =   [   RobotStartY+Robot.W+RobotSep...
                   RobotStartY+Robot.W+RobotSep
                ];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];


CrossLine_P2.v = 1.6;
CrossLine_P2.t_final = traj_length(CrossLine_P2) / CrossLine_P2.v  * 1.3;
CrossLine_P2.name = 'Cross Line P1';
CrossLine_P2.theta_start = 180*deg;