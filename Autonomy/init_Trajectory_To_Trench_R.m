%Start point is (X coord of Red Auto line, 

%Useful points
targetZone = 4*ft;
RobotSep = 12*in;

%Starting points
To_Trench_R.Start.X = AutoLineRed.C1_x;
To_Trench_R.Start.Y = (Field.W - Field.CornerY) - (targetZone/2);

%End points
To_Trench_R.End.X = 8.5; %meters
To_Trench_R.End.Y = 24.6875*ft;

%Starting angle tangents
To_Trench_R.RobotStartTangentX = AutoLineRed.C1_x - Robot.L/2;
To_Trench_R.RobotStartTangentY = (Field.W - Field.CornerY) - (targetZone/2) + Robot.W + RobotSep - RobotStartY;
To_Trench_R.theta_start = (atan(To_Trench_R.RobotStartTangentY/To_Trench_R.RobotStartTangentX)+180*deg);

%Generate Arc
To_Trench_R.Arc.n = 100;
To_Trench_R.Arc.radius = .5;
To_Trench_R.Arc = get_Curve(300*deg, 90*deg, 0, To_Trench_R.Arc.n, To_Trench_R.Arc.radius, To_Trench_R.Start.X - cosd(339.1325), To_Trench.End.Y - To_Trench_R.Arc.radius);
traj_length(To_Trench_R.Arc)

To_Trench_R.x = [
    To_Trench_R.Start.X...
    To_Trench_R.Arc.x...
    To_Trench_R.End.X
    ];

To_Trench_R.y = [
    To_Trench_R.Start.Y + Robot.W + RobotSep...
    To_Trench_R.Arc.y...
    To_Trench_R.End.Y
    ];

% axis equal
% plot(To_Trench_R.x, To_Trench_R.y, 'r*');
% axis equal  

To_Trench_R.sub = sub_traj_lengths(To_Trench_R);

To_Trench_R.v = .5.*ones(1, length(To_Trench_R.x) - 1);
To_Trench_R.v(length(To_Trench_R.v)) = 1.6;

To_Trench_R.tstamps = traj_timestamps_v002(sub_traj_lengths(To_Trench_R), To_Trench_R.v);
To_Trench_R.v = [0 To_Trench_R.v];

To_Trench_R.t_final = To_Trench_R.tstamps(end) * 1.3;


To_Trench_R.name = 'To Trench R';