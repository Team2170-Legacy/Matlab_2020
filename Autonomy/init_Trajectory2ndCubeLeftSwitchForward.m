x = [...
  SecondCubeLeftSwitch.x(length(SecondCubeLeftSwitch.x))
    (cube_corner_x+dx1+Robot.L/sqrt(2) - 1.5*ft)+SecondCubeLeftSwitchForward.add_x];
y = [...
   SecondCubeLeftSwitch.y(length(SecondCubeLeftSwitch.y))
    (cube_corner_y+dy1+Robot.L/sqrt(2) - 1.5*ft)+SecondCubeLeftSwitchForward.add_y];

SecondCubeLeftSwitchForward.x = x;
SecondCubeLeftSwitchForward.y = y;
SecondCubeLeftSwitchForward.v = 2.0;
SecondCubeLeftSwitchForward.t_final = 1.0;
SecondCubeLeftSwitchForward.name = 'SecondCubeLeftSwitchForward';
SecondCubeLeftSwitchForward.theta_start = -135*deg;