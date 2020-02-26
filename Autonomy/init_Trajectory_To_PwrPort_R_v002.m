targetZone = 4*ft;
RobotSep = 12*in;
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotStartX = AutoLineRed.C1_x;

To_PwrPort_R.Arc1.n = 100;
To_PwrPort_R.Arc1.radius = 2;
To_PwrPort_R.Arc1 = get_Curve(120*deg, 130*deg, 0, To_PwrPort_R.Arc1.n, To_PwrPort_R.Arc1.radius, RobotStartX - 1.25*ft - To_PwrPort_R.Arc1.radius * cosd(110), RobotStartY + Robot.W + RobotSep - 0.125*ft - To_PwrPort_R.Arc1.radius);

To_PwrPort_R.Arc2.n = 100;
To_PwrPort_R.Arc2.radius = 2.25;
To_PwrPort_R.Arc2 = get_Curve(300*deg, 270*deg, 0, To_PwrPort_R.Arc2.n, To_PwrPort_R.Arc2.radius, .7, RobotStartY + To_PwrPort_R.Arc2.radius);

To_PwrPort_R.x = [RobotStartX...
                  RobotStartX - 0.9344*ft...
                  To_PwrPort_R.Arc1.x...
                  To_PwrPort_R.Arc2.x...
                  Robot.L/2];
              
To_PwrPort_R.y = [RobotStartY + Robot.W + RobotSep...
                  RobotStartY + Robot.W + RobotSep - 0.3562*ft...
                  To_PwrPort_R.Arc1.y...
                  To_PwrPort_R.Arc2.y...
                  RobotStartY];

% axis equal
% plot(To_PwrPort_R.x, To_PwrPort_R.y, 'r*');
% axis equal            
RobotStartTangentX = To_PwrPort_R.x(1) - To_PwrPort_R.x(length(To_PwrPort_R.x));
RobotStartTangentY = To_PwrPort_R.y(1) - To_PwrPort_R.y(length(To_PwrPort_R.y));

To_PwrPort_R.v = 1.6;
To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.7;

To_PwrPort_R.name = 'To Power Port Right';
To_PwrPort_R.theta_start = (atan(RobotStartTangentY/RobotStartTangentX)+180*deg);