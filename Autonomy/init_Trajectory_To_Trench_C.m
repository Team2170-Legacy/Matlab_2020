%Start point is (X coord of Red Auto line, 
%(Field.W - Field.CornerY)-targetZone/2)
To_Trench_C.Start.X = AutoLineRed.C1_x; %3.05m
To_Trench_C.Start.Y = (Field.W - Field.CornerY) - targetZone/2; %5.8338m
To_Trench_C.End.X = 8.5; %meters
To_Trench_C.End.X = 8.0; %meters
% To_Trench_C.End.X = 4; %meters
To_Trench_C.End.Y = 24.6875*ft;

To_Trench_C.Arc.n = 100;
To_Trench_C.Arc = get_Curve(270*deg, 90*deg, 0, To_Trench_C.Arc.n, (To_Trench_C.End.Y - To_Trench_C.Start.Y)/2, To_Trench_C.Start.X, (To_Trench_C.Start.Y + To_Trench_C.End.Y)/2);
traj_length(To_Trench_C.Arc)

To_Trench_C.x = [
    To_Trench_C.Arc.x...
    To_Trench_C.End.X
    ];
To_Trench_C.y = [
    To_Trench_C.Arc.y...
    To_Trench_C.End.Y
    ];

To_Trench_C.sub = sub_traj_lengths(To_Trench_C);

To_Trench_C.v = .8.*ones(1, length(To_Trench_C.x) - 1);
To_Trench_C.v(length(To_Trench_C.v)) = 1.6;

To_Trench_C.tstamps = traj_timestamps_v002(sub_traj_lengths(To_Trench_C), To_Trench_C.v);
To_Trench_C.v = [0 To_Trench_C.v];

% To_Trench_C.t_final = To_Trench_C.tstamps(length(To_Trench_C.tstamps));
% To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.7;
To_Trench_C.t_final = To_Trench_C.tstamps(end) * 1.3;


To_Trench_C.name = 'To_Trench_C';
To_Trench_C.theta_start = 180*deg;