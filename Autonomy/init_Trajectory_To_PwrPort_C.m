targetZone = 4*ft;
LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY) - (targetZone/2); %Y coord of target zone red

To_PwrPort_C.x =   [   LineR...
                    Robot.L/2
                ];

To_PwrPort_C.y =   [   TargetR...
                    TargetR
                ];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

To_PwrPort_C.v = 1.6;
To_PwrPort_C.t_final = traj_length(To_PwrPort_C) / To_PwrPort_C.v  * 1.3;
To_PwrPort_C.name = 'To Power Port C';
To_PwrPort_C.theta_start = 180*deg;