%   init_Trajectory2ndCubeLeftSwitchv3.m
%
%   2018-04-08 Update of v2 to v3 at Hartford to remove chamfered corners
%   to keep max accel's in trajectory down

% x = [...
%     (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
% %   (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
%     (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
%     6.85
%     6.65
%     6.2
%     cube_corner_x+dx1+Robot.L/sqrt(2) - .2 + SecondCubeLeftSwitchv3.add_x;
%     ];
% y = [...
%     Field.RSwitch.LeftP.tl_y+Robot.L/2,
%     cube_corner_y+Robot.L+.2,
% %    7.2
%     7.2
%     6.5
%     5.88 + SecondCubeLeftSwitchv3.add_y
%     5.88 + SecondCubeLeftSwitchv3.add_y;
%     ];


x = [...
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
    (Field.RSwitch.LeftP.tl_x+Field.RSwitch.LeftP.tr_x)/2,
    6.1
    6.1
    cube_corner_x+dx1+Robot.L/sqrt(2) - .2 + SecondCubeLeftSwitchv3.add_x;
    ];
y = [...
    Field.RSwitch.LeftP.tl_y+Robot.L/2,
    7.2
    7.2
    5.88 - 0.0 + SecondCubeLeftSwitchv3.add_y;
    5.88       + SecondCubeLeftSwitchv3.add_y;
    ];




SecondCubeLeftSwitchv3.x = x;
SecondCubeLeftSwitchv3.y = y;
% SecondCubeLeftSwitchv3.v = 2.0;
% SecondCubeLeftSwitchv3.t_final = 3.1;

SecondCubeLeftSwitchv3.v = 1.6;
SecondCubeLeftSwitchv3.t_final = 3.7; % 2018-04-13  4.9;

SecondCubeLeftSwitchv3.name = 'SecondCubeLeftSwitchv3';
SecondCubeLeftSwitchv3.theta_start = -90*deg;
SecondCubeLeftSwitchv3.Drive_Forward = [...
    false
    false
    false
    false
    false
    false
    ];