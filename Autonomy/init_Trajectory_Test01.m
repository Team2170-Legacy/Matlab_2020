%
%   init_Trajectory_Test01.m
%
%   2018-04-12 Martin Krucinski Boston
                        
%   Test trajectories to test robot autonomous driving
%
%   Test01 - 2.0 m/s fwd, turn left 90 deg, fwd, turn left 90, fwd
%   Test02 - 1.0 m/s fwd, turn left 90 deg, fwd, turn left 90, fwd
%   Test03 - 2.0 m/s fwd, turn right 90 deg, fwd, turn right 90, fwd
%   Test04 - 1.0 m/s fwd, turn right 90 deg, fwd, turn right 90, fwd


Test01.x = [ 
    0.0 
    2.0 
    2.0 
    0.0 
    ];

Test01.y = [
    0.0
    0.0
    2.0
    2.0
    ];

Test01.v = 2.0;
Test01.t_final = traj_length(Test01) / Test01.v  * 1.3;
Test01.name = 'Test01';
