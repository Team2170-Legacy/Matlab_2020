%Start point is (X coord of Red Auto line, 

%Useful points
targetZone = 4*ft;
RobotSep = 12*in;

%Starting points
To_Trench_L.Start.X = AutoLineRed.C1_x;
To_Trench_L.Start.Y = (Field.W - Field.CornerY) - (targetZone/2);

%End points
To_Trench_L.End.X = 8.5; %meters
To_Trench_L.End.X = 8.0; %meters
To_Trench_L.End.Y = 24.6875*ft;

%Starting angle tangents
To_Trench_L.RobotStartTangentX = AutoLineRed.C1_x - Robot.L/2;
To_Trench_L.RobotStartTangentY = (Field.W - Field.CornerY) - (targetZone/2) - To_Trench_L.Start.Y - Robot.W - RobotSep;
To_Trench_L.theta_start = (atan(To_Trench_L.RobotStartTangentY/To_Trench_L.RobotStartTangentX)+180*deg);

%Generate Arc
To_Trench_L.Arc.n = 100;
To_Trench_L.Arc.radius = (To_Trench_L.End.Y - (To_Trench_L.Start.Y - Robot.W - RobotSep)) / 2;
To_Trench_L.Arc = get_Curve(250*deg, 90*deg, 0, To_Trench_L.Arc.n, To_Trench_L.Arc.radius, To_Trench_L.Start.X, To_Trench_L.End.Y - To_Trench_L.Arc.radius);
traj_length(To_Trench_L.Arc)

To_Trench_L.x = [
    To_Trench_L.Start.X...
    To_Trench_L.Arc.x...
    To_Trench_L.End.X
    ];

To_Trench_L.y = [
    To_Trench_L.Start.Y - Robot.W - RobotSep...
    To_Trench_L.Arc.y...
    To_Trench_L.End.Y
    ];

% axis equal
% plot(To_Trench_L.x, To_Trench_L.y, 'r*');
% axis equal  

To_Trench_L.sub = sub_traj_lengths(To_Trench_L);

To_Trench_L.v = 1.2.*ones(1, length(To_Trench_L.x) - 1);
To_Trench_L.v(length(To_Trench_L.v)) = 1.6;

To_Trench_L.tstamps = traj_timestamps_v002(sub_traj_lengths(To_Trench_L), To_Trench_L.v);
To_Trench_L.v = [0 To_Trench_L.v];

To_Trench_L.t_final = To_Trench_L.tstamps(end) * 1.3;


To_Trench_L.name = 'To Trench L';