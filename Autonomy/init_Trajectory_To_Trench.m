targetZone = 4*ft
MidR = 24.6875*ft; %Y coord of midline of red trench run
LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY)-targetZone/2; %Y coord of target zone red

To_Trench.x =   [   LineR...
                    LineR-0.5...
                    LineR-0.6...
                    LineR-0.5...
                    LineR...
                    17.5*ft...
                    8.9395 - Robot.L/2
                ];

To_Trench.y =   [   TargetR...
                    TargetR+0.2354...
                    TargetR+0.4708...
                    TargetR+0.7062...
                    TargetR+0.9416...
                    MidR...
                    MidR
                ];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];


To_Trench.v = 1.6;
To_Trench.t_final = traj_length(To_Trench) / To_Trench.v  * 1.3;
To_Trench.name = 'To Trench';
To_Trench.theta_start = 180*deg;