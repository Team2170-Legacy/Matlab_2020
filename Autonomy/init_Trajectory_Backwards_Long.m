%This trajectory moves robot backwards...
%
%   Long distance, to be used from PowerPort

LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY) - (targetZone/2); %Y coord of target zone red
           
Backwards_Long.x = [    Robot.L/2 ...
               Robot.L/2 + 3.5...
               Robot.L/2 + 3.5...
               ];

Backwards_Long.y = [    TargetR...
               TargetR...
               TargetR...
               ];

% plot(Backwards_Long.x, Backwards_Long.y, 'r*');
                
Backwards_Long.v = 1.6;
Backwards_Long.t_final = traj_length(Backwards_Long) / Backwards_Long.v  * 1.3;
Backwards_Long.name = 'Backwards_Long';
Backwards_Long.theta_start = 180*deg;

% Backwards_Long.Drive_Forward = true;
Backwards_Long.Drive_Forward = [false...
    false];