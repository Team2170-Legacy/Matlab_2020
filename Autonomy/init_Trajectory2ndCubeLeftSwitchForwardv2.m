x = [...
  SecondCubeLeftSwitchv2.x(length(SecondCubeLeftSwitchv2.x)) - SecondCubeLeftSwitchv2.add_x
    (cube_corner_x+dx1+Robot.L/sqrt(2) - 1.5*ft)+SecondCubeLeftSwitchForwardv2.add_x];
y = [...
   SecondCubeLeftSwitchv2.y(length(SecondCubeLeftSwitchv2.y))  + SecondCubeLeftSwitchForwardv2.add_y
   SecondCubeLeftSwitchv2.y(length(SecondCubeLeftSwitchv2.y)) + SecondCubeLeftSwitchForwardv2.add_y];

SecondCubeLeftSwitchForwardv2.x = x;
SecondCubeLeftSwitchForwardv2.y = y;
SecondCubeLeftSwitchForwardv2.v = 2.0;
SecondCubeLeftSwitchForwardv2.t_final = 1.0;
SecondCubeLeftSwitchForwardv2.name = 'SecondCubeLeftSwitchForwardv2';
SecondCubeLeftSwitchForwardv2.theta_start = 0*deg;
SecondCubeLeftSwitchForwardv2.Drive_Forward = [false];