function [v,omega] = Controller_v002(distance, angle ,Robot)
%   NOTE _v002 uses DISTANCE in ft AND angle in PIXELS
%   OUTPUT is v in ft/s   AND omega in -rad/s

%   Martin Krucinski 2018-03-07
%Kp = 2.0;

    % This is 2019-03-02 tuning
Kp = 2; 
%Kp_omega = 0.10;
Kp_omega = 0.10;
%   MK 2019-03-02 override Robot.v_max here to ensure IT IS INCLUDED in C-code
Robot.v_max = 1.5;

% *** TUNED VALUE 2019-03-01 Kp = 2;%0.5;
%Kp_omega = 0.05;


%   2018-03-05  Martin Krucinski
%   Try to get robot to track angle better, increase Kp_omega from 8.0 to
%   larger value, OR IS IT Robot.omega_max that limits this???
%   Robot.omega_max  was set to 1.0!!

%0.04;
%Kp_omega = 32;

% Angle

stop_turning_distance   = 1;    % [ft]  distance when steering control stops
start_cruising_distance = 1;    % [ft]  distance when velocity
%       P-control turns off and cruising at
%       constant velocity starts

if distance > stop_turning_distance,    % distance units are in ft
    omega_temp = Kp_omega*angle;
else
    omega_temp = 0;
end

omega_max = Robot.omega_max;

if omega_temp > omega_max
    omega = omega_max;
elseif omega_temp < -omega_max
    omega = -omega_max;
else
    omega = omega_temp;
end

% Distance
%
%   MK 2019-03-02
%   NOTE THAT VELOCITIES are in ft!!!
%   Need to convert v_max to ft !!!

v_max       = Robot.v_max;
ft          = 0.305;
v_max_ft    = v_max / ft;

v_offset    = 1; % [ ft/s ]


if distance < start_cruising_distance,    % distance units are in ft
    v_temp = v_offset;
else
    v_temp = Kp*distance + v_offset;
end

if v_temp > v_max_ft
    v = v_max_ft;
elseif v_temp < -v_max_ft
    v = -v_max_ft;
else
    v = v_temp;
end


%******************** OVERRIDES *****************

%v = 0.5;
%omega = 1;