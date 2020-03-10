targetZone = 4*ft;
LineR = AutoLineRed.C1_x; %X coord of Red Auto line
TargetR = (Field.W - Field.CornerY) - (targetZone/2); %Y coord of target zone red

To_PwrPort_Trench.Start.X = 8.0; %meters
To_PwrPort_Trench.Start.Y = 24.6875*ft;

To_PwrPort_Trench.Arc1.n = 100;
To_PwrPort_Trench.Arc1 = get_Curve(90*deg, -90*deg, 0, To_PwrPort_Trench.Arc1.n, 0.8480, 1.5, To_PwrPort_Trench.Start.Y - 0.8480);

To_PwrPort_Trench.x = [ To_PwrPort_Trench.Start.X...
                        1.0...
                        To_PwrPort_Trench.Arc1.x...
                        Robot.L/2
                        ];
                    
To_PwrPort_Trench.y = [ To_PwrPort_Trench.Start.Y...
                        To_PwrPort_Trench.Start.Y...
                        To_PwrPort_Trench.Arc1.y...
                        TargetR
                        ];

% hold on
% axis equal
% plot(To_PwrPort_Trench.x, To_PwrPort_Trench.y, 'r*');

To_PwrPort_Trench.sub = sub_traj_lengths(To_PwrPort_Trench);

To_PwrPort_Trench.v = 1.6;

To_PwrPort_Trench.t_final = traj_length(To_PwrPort_Trench) / To_PwrPort_Trench.v * 1.3;

To_PwrPort_Trench.name = 'To_PwrPort_Trench';
To_PwrPort_Trench.theta_start = 0*deg;

To_PwrPort_Trench.Drive_Forward = true(1, 104);
To_PwrPort_Trench.Drive_Forward(1) = false;