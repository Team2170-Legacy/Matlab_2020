%
%   init_Trajectory_Test02.m
%
%   2018-04-12 Martin Krucinski Boston
                        
%   Test trajectories to test robot autonomous driving
%
%   Test01 - 2.0 m/s fwd, turn left 90 deg, fwd, turn left 90, fwd
%   Test02 - 1.0 m/s fwd, turn left 90 deg, fwd, turn left 90, fwd
%   Test03 - 2.0 m/s fwd, turn right 90 deg, fwd, turn right 90, fwd
%   Test04 - 1.0 m/s fwd, turn right 90 deg, fwd, turn right 90, fwd


Test02.x = [ 
    0.0 
    2.0 
    2.0 
    0.0 
    ];

Test02.y = [
    0.0
    0.0
    2.0
    2.0
    ];

Test02.v = 1.0;
Test02.t_final = traj_length(Test02) / Test02.v  * 1.4;
Test02.name = 'Test02';
