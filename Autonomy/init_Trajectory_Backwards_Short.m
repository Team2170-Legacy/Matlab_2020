%This trajectory moves robot backwards...
%
%   a SHORT distance

LineR = AutoLineRed.C1_x; %X coord of Red Auto line

TargetR = (Field.W - Field.CornerY) - (targetZone/2); %Y coord of target zone red
           
Backwards_Short.x = [    LineR ...
               LineR + 1.5...
               LineR + 1.5...
               ];

Backwards_Short.y = [    TargetR...
               TargetR...
               TargetR...
               ];

% plot(Backwards_Short.x, Backwards_Short.y, 'r*');
                
Backwards_Short.v = 1.6;
Backwards_Short.t_final = traj_length(Backwards_Short) / Backwards_Short.v  * 1.3;
Backwards_Short.name = 'Backwards_Short';
Backwards_Short.theta_start = 180*deg;

% Backwards_Short.Drive_Forward = true;
Backwards_Short.Drive_Forward = [false...
    false];