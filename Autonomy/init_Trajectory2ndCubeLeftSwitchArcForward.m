x = [...
  SecondCubeLeftSwitchArc.x(length(SecondCubeLeftSwitchArc.x))
    (cube_corner_x+dx1+Robot.L/sqrt(2) - 1.5*ft)+SecondCubeLeftSwitchArcForward.add_x];
y = [...
   SecondCubeLeftSwitchArc.y(length(SecondCubeLeftSwitchArc.y))  + SecondCubeLeftSwitchArcForward.add_y
   SecondCubeLeftSwitchArc.y(length(SecondCubeLeftSwitchArc.y)) + SecondCubeLeftSwitchArcForward.add_y];

SecondCubeLeftSwitchArcForward.x = x;
SecondCubeLeftSwitchArcForward.y = y;
SecondCubeLeftSwitchArcForward.v = 2.0;
SecondCubeLeftSwitchArcForward.t_final = 1.0;
SecondCubeLeftSwitchArcForward.name = 'SecondCubeLeftSwitchArcForward';
SecondCubeLeftSwitchArcForward.theta_start = 0*deg;
SecondCubeLeftSwitchArcForward.Drive_Forward = [false];