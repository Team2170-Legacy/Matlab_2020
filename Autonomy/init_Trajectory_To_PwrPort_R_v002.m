targetZone = 4*ft;
RobotSep = 12*in;
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotStartX = AutoLineRed.C1_x;

To_PwrPort_R.Arc1.n = 100;
To_PwrPort_R.Arc1 = get_Curve(100*deg, 130*deg, 0, To_PwrPort_R.Arc1.n, 1, RobotStartX - .1, RobotStartY);

To_PwrPort_R.Arc2.n = 100;
To_PwrPort_R.Arc2 = get_Curve(310*deg, 290*deg, 0, To_PwrPort_R.Arc2.n, 2, To_PwrPort_R.Arc1.x(length(To_PwrPort_R.Arc1.x) - 1) - 1.6, To_PwrPort_R.Arc1.y(length(To_PwrPort_R.Arc1.y) - 1) + 1.2);

To_PwrPort_R.x = [RobotStartX...
                  To_PwrPort_R.Arc1.x...
                  To_PwrPort_R.Arc2.x...
                  Robot.L/2 + .5...
                  Robot.L/2];
              
To_PwrPort_R.y = [RobotStartY+Robot.W+RobotSep...
                  To_PwrPort_R.Arc1.y...
                  To_PwrPort_R.Arc2.y...
                  RobotStartY...
                  RobotStartY];

% axis equal
% plot(To_PwrPort_R.x, To_PwrPort_R.y, 'r*');
% axis equal            
RobotStartTangentX = To_PwrPort_R.x(1)-To_PwrPort_R.x(3);
RobotStartTangentY = To_PwrPort_R.y(1)-To_PwrPort_R.y(3);

To_PwrPort_R.v = 1.6;
To_PwrPort_R.t_final = traj_length(To_PwrPort_R) / To_PwrPort_R.v  * 1.7;

To_PwrPort_R.name = 'To Power Port Right';
To_PwrPort_R.theta_start = (atan(RobotStartTangentY/RobotStartTangentX)+180*deg);