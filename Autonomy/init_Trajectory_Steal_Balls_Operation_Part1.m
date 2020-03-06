trenchCenter = (4*ft + 7.5*in)/2;
trenchEndX = 22*ft + 5.28*in - (2*ft + 6*in);

Steal_Balls_Operation_Part1.x = [...
    AutoLineRed.C1_x...
    
    trenchEndX - Robot.L/2;
    ];
Steal_Balls_Operation_Part1.y = [...
    trenchCenter...
    trenchCenter...
    trenchCenter
    ];

Steal_Balls_Operation_Part1.v = [ 1.6 0.5];
%Steal_Balls_Operation_Part1.t_final = traj_length(Steal_Balls_Operation_Part1) / Steal_Balls_Operation_Part1.v  * 1.3;
Steal_Balls_Operation_Part1.t_final = 5;
Steal_Balls_Operation_Part1.name = 'Steal Balls Operation';
Steal_Balls_Operation_Part1.theta_start = 0*deg;
