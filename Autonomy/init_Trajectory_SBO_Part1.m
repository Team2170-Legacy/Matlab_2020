trenchCenter = (4*ft + 7.5*in)/2;
trenchEndX = 22*ft + 5.28*in - (2*ft + 6*in);

SBO_Part1.x = [...
    AutoLineRed.C1_x...
    trenchEndX - 5*ft...
    trenchEndX - Robot.L/2
    ];
SBO_Part1.y = [...
    trenchCenter...
    trenchCenter...
    trenchCenter
    ];

SBO_Part1.v = [ 1.6 0.5];
%Steal_Balls_Operation_Part1.t_final = traj_length(Steal_Balls_Operation_Part1) / Steal_Balls_Operation_Part1.v  * 1.3;
SBO_Part1.t_final = 5;
SBO_Part1.name = 'Steal Balls Operation';
SBO_Part1.sub = sub_traj_lengths(SBO_Part1);
SBO_Part1.tstamps = traj_timestamps_v002(sub_traj_lengths(SBO_Part1), SBO_Part1.v);
SBO_Part1.v = [0 SBO_Part1.v];
SBO_Part1.t_final = SBO_Part1.tstamps(end) * 1.3;
SBO_Part1.theta_start = 0*deg;
