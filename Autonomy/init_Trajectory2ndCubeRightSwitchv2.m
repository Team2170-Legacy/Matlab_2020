SecondCubeRightSwitchv2.x = SecondCubeLeftSwitchv2.x;
SecondCubeRightSwitchv2.y = Field.W - SecondCubeLeftSwitchv2.y;


SecondCubeRightSwitchv2.x(length(SecondCubeRightSwitchv2.x)) = SecondCubeRightSwitchv2.x(length(SecondCubeRightSwitchv2.x)) - SecondCubeLeftSwitchv2.add_x + SecondCubeRightSwitchv2.add_x;
SecondCubeRightSwitchv2.y(length(SecondCubeRightSwitchv2.y)) = SecondCubeRightSwitchv2.y(length(SecondCubeRightSwitchv2.y)) - SecondCubeLeftSwitchv2.add_y+ SecondCubeRightSwitchv2.add_y;
SecondCubeRightSwitchv2.y(length(SecondCubeRightSwitchv2.y)-1) = SecondCubeRightSwitchv2.y(length(SecondCubeRightSwitchv2.y)-1) - SecondCubeLeftSwitchv2.add_y+ SecondCubeRightSwitchv2.add_y;

% SecondCubeRightSwitchv2.v = 2.0;
% SecondCubeRightSwitchv2.t_final = 3.1;

SecondCubeRightSwitchv2.v = 1.3;
SecondCubeRightSwitchv2.t_final = 4.9;

SecondCubeRightSwitchv2.name = 'SecondCubeRightSwitchv2';
SecondCubeRightSwitchv2.theta_start = 90*deg;
SecondCubeRightSwitchv2.Drive_Forward = [...
    false
    false
    false
    false
    false
    false
    ];