targetZone = 4*ft;
RobotSep = 12*in;
RobotStartY = (Field.W - Field.CornerY) - (targetZone/2);
RobotStartX = AutoLineRed.C1_x;

To_PwrPort_L.Arc1.n = 100;
To_PwrPort_L.Arc1.radius = 2;
To_PwrPort_L.Arc1 = get_Curve(230*deg, 240*deg, 1, To_PwrPort_L.Arc1.n, To_PwrPort_L.Arc1.radius, RobotStartX - 1.25*ft - To_PwrPort_L.Arc1.radius * cosd(110), RobotStartY - Robot.W - RobotSep + 0.3562*ft + To_PwrPort_L.Arc1.radius);

To_PwrPort_L.Arc2.n = 100;
To_PwrPort_L.Arc2.radius = 1.8;
To_PwrPort_L.Arc2 = get_Curve(90*deg, 50*deg, 1, To_PwrPort_L.Arc2.n, To_PwrPort_L.Arc2.radius, .6, RobotStartY - To_PwrPort_L.Arc2.radius);

To_PwrPort_L.x =   [   RobotStartX...
                       RobotStartX - 0.9344*ft...
                       To_PwrPort_L.Arc1.x...
                       To_PwrPort_L.Arc2.x...
                       Robot.L/2];
            
To_PwrPort_L.y =   [   RobotStartY - Robot.W - RobotSep...
                       RobotStartY - Robot.W - RobotSep + 0.3562*ft...
                       To_PwrPort_L.Arc1.y...
                       To_PwrPort_L.Arc2.y...
                       RobotStartY];

% axis equal
% plot(To_PwrPort_L.x, To_PwrPort_L.y, 'r*');
% axis equal  

RobotStartTangentX = To_PwrPort_L.x(1)-To_PwrPort_L.x(3);
RobotStartTangentY = To_PwrPort_L.y(1)-To_PwrPort_L.y(3);

To_PwrPort_L.v = 1.6;
To_PwrPort_L.t_final = traj_length(To_PwrPort_L) / To_PwrPort_L.v  * 1.7;

To_PwrPort_L.name = 'To Power Port L';
To_PwrPort_L.theta_start = (180*deg+atan(RobotStartTangentY/RobotStartTangentX));