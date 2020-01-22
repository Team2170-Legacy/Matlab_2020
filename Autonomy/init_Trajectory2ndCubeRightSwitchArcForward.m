SecondCubeRightSwitchArcForward.x = [...
    SecondCubeRightSwitchArc.x(length(SecondCubeRightSwitchArc.x))
    SecondCubeLeftSwitchArcForward.x(length(SecondCubeLeftSwitchArcForward.x)) + SecondCubeRightSwitchArcForward.add_x
];
    

SecondCubeRightSwitchArcForward.y = [...
     SecondCubeRightSwitchArc.y(length(SecondCubeRightSwitchArc.y))
Field.W -  SecondCubeLeftSwitchArcForward.y(length(SecondCubeLeftSwitchArcForward.y)) + SecondCubeRightSwitchArcForward.add_y  
];

SecondCubeRightSwitchForward.v = 2.0;
SecondCubeRightSwitchForward.t_final = 1.0;
SecondCubeRightSwitchForward.name = 'SecondCubeRightSwitchForward';
SecondCubeRightSwitchForward.theta_start = -135*deg;
