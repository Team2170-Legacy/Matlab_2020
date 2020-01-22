                        %   2018-04-12 Martin Krucinski Boston
                        %   added +/- y adjustements in order not to hit
                        %   wall with new bumpers
                        %

RSRCRS.x = [Field.RSRC.x, Field.RSRC.x + Robot.L/2, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSRCRS.add_x + 0.1, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSRCRS.add_x];
RSRCRS.y = [Field.RSRC.y, Field.RSRC.y, Field.RSRC.y-.35 + 0.1, Field.RSwitch.RightP.br_y-Robot.L/2 + RSRCRS.add_y];

%RSRCRS.x = [Field.RSRC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSRCRS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSRCRS.add_x];
%RSRCRS.y = [Field.RSRC.y, Field.RSRC.y, Field.RSwitch.RightP.br_y-Robot.L/2 + RSRCRS.add_y];

RSRCRS.v = 1.6;
%RSRCRS.t_final = traj_length(RSRCRS) / RSRCRS.v  * 1.3;
RSRCRS.t_final = traj_length(RSRCRS) / RSRCRS.v  * 1.3;
RSRCRS.name = 'RSRCRS';