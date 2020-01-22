SecondCubeRightSwitchv3.x = SecondCubeLeftSwitchv3.x;
SecondCubeRightSwitchv3.y = Field.W - SecondCubeLeftSwitchv3.y;


SecondCubeRightSwitchv3.x(length(SecondCubeRightSwitchv3.x)) = SecondCubeRightSwitchv3.x(length(SecondCubeRightSwitchv3.x)) - SecondCubeLeftSwitchv3.add_x + SecondCubeRightSwitchv3.add_x;
SecondCubeRightSwitchv3.y(length(SecondCubeRightSwitchv3.y)) = SecondCubeRightSwitchv3.y(length(SecondCubeRightSwitchv3.y)) - SecondCubeLeftSwitchv3.add_y+ SecondCubeRightSwitchv3.add_y;
SecondCubeRightSwitchv3.y(length(SecondCubeRightSwitchv3.y)-1) = SecondCubeRightSwitchv3.y(length(SecondCubeRightSwitchv3.y)-1) - SecondCubeLeftSwitchv3.add_y+ SecondCubeRightSwitchv3.add_y;

% SecondCubeRightSwitchv3.v = 2.0;
% SecondCubeRightSwitchv3.t_final = 3.1;

SecondCubeRightSwitchv3.v = 1.6;
SecondCubeRightSwitchv3.t_final = 3.7;% 2018-04-13     4.9;

SecondCubeRightSwitchv3.name = 'SecondCubeRightSwitchv3';
SecondCubeRightSwitchv3.theta_start = 90*deg;
SecondCubeRightSwitchv3.Drive_Forward = [...
    false
    false
    false
    false
    false
    false
    ];