SecondCubeRightSwitchForwardv2.x = SecondCubeLeftSwitchForwardv2.x;
SecondCubeRightSwitchForwardv2.y = Field.W - SecondCubeLeftSwitchForwardv2.y;


SecondCubeRightSwitchForwardv2.x(length(SecondCubeRightSwitchForwardv2.x)) = SecondCubeRightSwitchForwardv2.x(length(SecondCubeRightSwitchForwardv2.x)) - SecondCubeLeftSwitchForwardv2.add_x + SecondCubeRightSwitchForwardv2.add_x;
SecondCubeRightSwitchForwardv2.y(length(SecondCubeRightSwitchForwardv2.y)) = SecondCubeRightSwitchForwardv2.y(length(SecondCubeRightSwitchForwardv2.y)) - SecondCubeLeftSwitchForwardv2.add_y+ SecondCubeRightSwitchForwardv2.add_y;
SecondCubeRightSwitchForwardv2.y(length(SecondCubeRightSwitchForwardv2.y)-1) = SecondCubeRightSwitchForwardv2.y(length(SecondCubeRightSwitchForwardv2.y)-1) - SecondCubeLeftSwitchForwardv2.add_y+ SecondCubeRightSwitchForwardv2.add_y;

SecondCubeRightSwitchForwardv2.v = 2.0;
SecondCubeRightSwitchForwardv2.name = 'SecondCubeRightSwitchForwardv2';
SecondCubeRightSwitchForwardv2.t_final = 1.0;
SecondCubeRightSwitchForwardv2.Drive_Forward = [...
    false
    false
    ];
