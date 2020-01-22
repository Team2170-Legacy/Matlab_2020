cube_corner_bott_x  = Field.RedPlatZone.Cube1_x-13*in/2;
cube_corner_bott_y  = Field.RedPlatZone.Cube1_y-13*in/2;


SecondCubeRightSwitch.x = SecondCubeLeftSwitch.x ;
SecondCubeRightSwitch.y = Field.W - SecondCubeLeftSwitch.y + .0571;

% removing left switch add x and adding right switch add x
SecondCubeRightSwitch.x(length(SecondCubeRightSwitch.x)) = SecondCubeRightSwitch.x(length(SecondCubeRightSwitch.x)) - SecondCubeLeftSwitch.add_x + SecondCubeRightSwitch.add_x;
SecondCubeRightSwitch.y(length(SecondCubeRightSwitch.y)) = SecondCubeRightSwitch.y(length(SecondCubeRightSwitch.y)) - SecondCubeLeftSwitch.add_y + SecondCubeRightSwitch.add_y;

SecondCubeRightSwitch.v = SecondCubeLeftSwitch.v;
SecondCubeRightSwitch.t_final = SecondCubeLeftSwitch.t_final;

SecondCubeRightSwitch.name = 'SecondCubeRightSwitch';
SecondCubeRightSwitch.Drive_Forward = SecondCubeLeftSwitch.Drive_Forward;
SecondCubeRightSwitch.theta_start = SecondCubeLeftSwitch.theta_start + 180*deg;

