LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY) - (targetZone/2); %Y coord of target zone red

To_PwrPort.x =   [   LineR...
                    0
                ];

To_PwrPort.y =   [   TargetR...
                    TargetR
                ];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

To_PwrPort.v = 1.6;
To_PwrPort.t_final = traj_length(To_PwrPort) / To_PwrPort.v  * 1.3;
To_PwrPort.name = 'To Power Port';
To_PwrPort.theta_start = 180*deg;