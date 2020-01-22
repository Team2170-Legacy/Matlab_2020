function [h_pix_L,h_pix_R] = calcTargetHeights_v1(Target,Robot)
% Calculate heights of the L and R vision targets, return size in PIXELS

init_Constants
sidey = Target.y - Robot.y;
sidex = Target.x - Robot.x;

distance = sqrt((power(sidey,2)+power(sidex,2)));

Target_L_x  = Target.x + Target.d/2;
Target_L_y  = Target.y;

Target_R_x  = Target.x - Target.d/2;
Target_R_y  = Target.y;

distance_L  = norm([ Target_L_x - Robot.x , Target_L_y - Robot.y ]);
distance_R  = norm([ Target_R_x - Robot.x , Target_R_y - Robot.y ]);


%   calculate target height angles

alpha_L     = atan( Target.h / distance_L);
alpha_R     = atan( Target.h / distance_R);

%   calculate target heights in pixels

h_pix_L     = alpha_L / Target.camera_view * Target.N_pixel;    % calculate height in pixels
h_pix_R     = alpha_R / Target.camera_view * Target.N_pixel;    % calculate height in pixels
