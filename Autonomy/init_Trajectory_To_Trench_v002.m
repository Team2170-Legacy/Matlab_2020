%Start point is (X coord of Red Auto line, 
%(Field.W - Field.CornerY)-targetZone/2)
To_Trench.Start.X = AutoLineRed.C1_x; %3.05m
To_Trench.Start.Y = (Field.W - Field.CornerY) - targetZone/2; %5.8338m
To_Trench.End.X = 8.5; %meters
% To_Trench.End.X = 4; %meters
To_Trench.End.Y = 24.6875*ft;

To_Trench.Arc.n = 100;
To_Trench.Arc = get_Curve(270*deg, 90*deg, 0, To_Trench.Arc.n, (To_Trench.End.Y - To_Trench.Start.Y)/2, To_Trench.Start.X, (To_Trench.Start.Y + To_Trench.End.Y)/2);
traj_length(To_Trench.Arc)

To_Trench.x = [
    To_Trench.Arc.x...
    To_Trench.End.X
    ];
To_Trench.y = [
    To_Trench.Arc.y...
    To_Trench.End.Y
    ];

To_Trench.sub = sub_traj_lengths(To_Trench);

To_Trench.v = .8.*ones(1, length(To_Trench.x) - 1);
To_Trench.v(length(To_Trench.v)) = 1.6;

To_Trench.tstamps = traj_timestamps_v002(sub_traj_lengths(To_Trench), To_Trench.v);
To_Trench.v = [0 To_Trench.v];

% To_Trench.t_final = To_Trench.tstamps(length(To_Trench.tstamps));
% To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.7;
To_Trench.t_final = To_Trench.tstamps(end) * 1.3;


To_Trench.name = 'To Trench';
To_Trench.theta_start = 180*deg;