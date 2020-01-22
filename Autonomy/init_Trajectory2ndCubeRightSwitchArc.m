
SecondCubeRightSwitchArc.x = [...
    (Field.RSwitch.RightP.tl_x+Field.RSwitch.RightP.tr_x)/2,
    (Field.RSwitch.RightP.tl_x+Field.RSwitch.RightP.tr_x)/2,
    (Field.RSwitch.RightP.tl_x+Field.RSwitch.RightP.tr_x)/2 + .3, 
    SecondCubeLeftArc.x' + SecondCubeRightSwitchArc.add_x
     cube_corner_x+dx1+Robot.L/sqrt(2) - .4 + SecondCubeRightSwitchArc.add_x;
    ];


SecondCubeRightSwitchArc.y = [...
  Field.W -  (Field.RSwitch.LeftP.tl_y+Robot.L/2),
 Field.W -   (cube_corner_y+Robot.L+.2),
  Field.W - SecondCubeLeftArc.y(1)
    Field.W - SecondCubeLeftArc.y' + SecondCubeRightSwitchArc.add_y
    Field.W - SecondCubeLeftArc.y(length(SecondCubeLeftArc.y) + SecondCubeRightSwitchArc.add_y)
    ];

SecondCubeRightSwitchArc.v = 2.0;
SecondCubeRightSwitchArc.t_final = 2.8;
SecondCubeRightSwitchArc.name = 'SecondCubeRightSwitchArc';
SecondCubeRightSwitchArc.theta_start = 90*deg;
SecondCubeRightSwitchArc.Drive_Forward = [...
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
