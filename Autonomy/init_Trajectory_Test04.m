%
%   init_Trajectory_Test04.m
%
%   2018-04-12 Martin Krucinski Boston
                        
%   Test trajectories to test robot autonomous driving
%
%   Test01 - 2.0 m/s fwd, turn left 90 deg, fwd, turn left 90, fwd
%   Test02 - 1.0 m/s fwd, turn left 90 deg, fwd, turn left 90, fwd
%   Test03 - 2.0 m/s fwd, turn right 90 deg, fwd, turn right 90, fwd
%   Test04 - 1.0 m/s fwd, turn right 90 deg, fwd, turn right 90, fwd


Test04.x = [ 
    0.0 
    2.0 
    2.0 
    0.0 
    ];

Test04.y = [
    2.0
    2.0
    0.0
    0.0
    ];

Test04.v = 1.0;
Test04.t_final = traj_length(Test04) / Test04.v  * 1.4;
Test04.name = 'Test04';
