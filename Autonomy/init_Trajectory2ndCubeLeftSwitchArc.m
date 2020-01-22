dxarc = .07;
dyarc = .3;
[SecondCubeLeftArc] = get_Curve(-90*deg, 90*deg, 1, 5, .72, 5.8 + dxarc, 6.3 + dyarc);

%  x = [(Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,(Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2, (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2 + .3, SecondCubeLeftArc.x + SecondCubeLeftSwitchArc.add_x,  cube_corner_x+dx1+Robot.L/sqrt(2)+ SecondCubeLeftSwitchArc.add_x;];
%  y = [Field.RSwitch.LeftP.tl_y+Robot.L/2, cube_corner_y+Robot.L,cube_corner_y+Robot.L, SecondCubeLeftArc.y + SecondCubeLeftSwitchArc.add_y, SecondCubeLeftArc.y(length(SecondCubeLeftArc.y) + SecondCubeLeftSwitchArc.add_y)];



x = [...
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2 + .3, 
    SecondCubeLeftArc.x' + SecondCubeLeftSwitchArc.add_x
     cube_corner_x+dx1+Robot.L/sqrt(2) - .4 + SecondCubeLeftSwitchArc.add_x;
    ];
y = [...
    Field.RSwitch.LeftP.tl_y+Robot.L/2,
    cube_corner_y+Robot.L+.2,
    SecondCubeLeftArc.y(1)
    SecondCubeLeftArc.y' + SecondCubeLeftSwitchArc.add_y
    SecondCubeLeftArc.y(length(SecondCubeLeftArc.y) + SecondCubeLeftSwitchArc.add_y)
    ];


SecondCubeLeftSwitchArc.x = x;
SecondCubeLeftSwitchArc.y = y;
SecondCubeLeftSwitchArc.v = 2.0;
SecondCubeLeftSwitchArc.t_final = 2.8;
SecondCubeLeftSwitchArc.name = 'SecondCubeLeftSwitchArc';
SecondCubeLeftSwitchArc.theta_start = -90*deg;
SecondCubeLeftSwitchArc.Drive_Forward = [...
    false
    false
    false
    false
   false
    false
    false
    false
    false
    ];