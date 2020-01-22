
dx1             = sqrt(18*in^2/2);
dy1             = dx1;
cube_corner_x   = Field.RedPlatZone.Cube6_x+13*in/2;
cube_corner_y   = Field.RedPlatZone.Cube6_y+13*in/2;

x = [ ...
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2
    cube_corner_x+Robot.L
    cube_corner_x+2*Robot.L-4*in-.5
    cube_corner_x+Robot.L
    cube_corner_x+dx1+Robot.L/sqrt(2)+ SecondCubeLeftSwitch.add_x;
    ];

y = [...
    Field.RSwitch.LeftP.tl_y+Robot.L/2
    cube_corner_y+Robot.L
    cube_corner_y+Robot.L
    cube_corner_y+2*Robot.L-4*in-.5
    cube_corner_y+Robot.L
    cube_corner_y+dy1+Robot.L/sqrt(2)+SecondCubeLeftSwitch.add_y;
    ];

SecondCubeLeftSwitch.x = x;
SecondCubeLeftSwitch.y = y;
SecondCubeLeftSwitch.v = 2.0;
SecondCubeLeftSwitch.t_final = 2.5;
SecondCubeLeftSwitch.name = 'SecondCubeLeftSwitch';
SecondCubeLeftSwitch.theta_start = -90*deg;
SecondCubeLeftSwitch.Drive_Forward = [...
    false
    false
    false
    true
    true
    ];

