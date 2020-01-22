

x = [...
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2 + .3,
    6.85
    6.65
    6.2
    cube_corner_x+dx1+Robot.L/sqrt(2) - .2 + SecondCubeLeftSwitchv2.add_x;
    ];
y = [...
    Field.RSwitch.LeftP.tl_y+Robot.L/2,
    cube_corner_y+Robot.L+.2,
    7.2
    7.2
    6.5
    5.88 + SecondCubeLeftSwitchv2.add_y
    5.88 + SecondCubeLeftSwitchv2.add_y;
    ];


SecondCubeLeftSwitchv2.x = x;
SecondCubeLeftSwitchv2.y = y;
% SecondCubeLeftSwitchv2.v = 2.0;
% SecondCubeLeftSwitchv2.t_final = 3.1;

SecondCubeLeftSwitchv2.v = 1.3;
SecondCubeLeftSwitchv2.t_final = 4.9;

SecondCubeLeftSwitchv2.name = 'SecondCubeLeftSwitchv2';
SecondCubeLeftSwitchv2.theta_start = -90*deg;
SecondCubeLeftSwitchv2.Drive_Forward = [...
    false
    false
    false
    false
    false
    false
    ];