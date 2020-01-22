SecondCubeRightSwitchForward.x = SecondCubeLeftSwitchForward.x ;

Leftside.y = [...
   SecondCubeLeftSwitch.y(length(SecondCubeLeftSwitch.y))
    (cube_corner_y+dy1+Robot.L/sqrt(2) - 1.5*ft)+SecondCubeLeftSwitchForward.add_y];


SecondCubeRightSwitchForward.y = [...
   SecondCubeRightSwitch.y(length(SecondCubeRightSwitch.y))
    (cube_corner_bott_y-dy1-Robot.L/sqrt(2) + 1.5*ft)+SecondCubeLeftSwitchForward.add_y];

% removing left switch add x and adding right switch add x
SecondCubeRightSwitchForward.x(length(SecondCubeRightSwitchForward.x)) = SecondCubeRightSwitchForward.x(length(SecondCubeRightSwitchForward.x)) - SecondCubeLeftSwitchForward.add_x + SecondCubeRightSwitchForward.add_x;
SecondCubeRightSwitchForward.y(length(SecondCubeRightSwitchForward.y)) = SecondCubeRightSwitchForward.y(length(SecondCubeRightSwitchForward.y)) - SecondCubeLeftSwitchForward.add_y + SecondCubeRightSwitchForward.add_y;

SecondCubeRightSwitchForward.v = 2.0;
SecondCubeRightSwitchForward.t_final = 1.0;
SecondCubeRightSwitchForward.name = 'SecondCubeRightSwitchForward';
SecondCubeRightSwitchForward.theta_start = 45*deg;