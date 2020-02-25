LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY)-targetZone/2; %Y coord of target zone red


CrossLine_P1.x =   [   LineR...
                    15*ft
                ];

CrossLine_P1.y =   [   TargetR...
                    TargetR
                ];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];


CrossLine_P1.v = 1.6;
CrossLine_P1.t_final = traj_length(CrossLine_P1) / CrossLine_P1.v  * 1.3;
CrossLine_P1.name = 'Cross Line P1';
CrossLine_P1.theta_start = 180*deg;
CrossLine_P1.Drive_Forward = [...
    false
    false
    ];
