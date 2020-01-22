function [v,omega] = Controller_v001(distance, angle ,Robot) 


%   Martin Krucinski 2018-03-07
%Kp = 2.0;
Kp = 0.5;

%   2018-03-05  Martin Krucinski
%   Try to get robot to track angle better, increase Kp_omega from 8.0 to
%   larger value, OR IS IT Robot.omega_max that limits this???
%   Robot.omega_max  was set to 1.0!!
Kp_omega = 1.00;
%Kp_omega = 32;
    
% Angle

omega_max = Robot.omega_max;

omega_temp = Kp_omega*angle;

if omega_temp > omega_max
    omega = omega_max;
elseif omega_temp < -omega_max
    omega = -omega_max;
else
    omega = omega_temp;
end

% Distance

v_max = Robot.v_max;

v_temp = Kp*distance;

if v_temp > v_max
    v = v_max;
elseif v_temp < -v_max
    v = -v_max;
else
    v = v_temp;
end


%******************** OVERRIDES *****************

%v = 0.5;
%omega = 1;