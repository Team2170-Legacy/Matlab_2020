                        %   2018-04-12 Martin Krucinski Boston
                        %   added +/- y adjustements in order not to hit
                        %   wall with new bumpers
                        %


RSLCLS.x = [    Field.RSLC.x,     Field.RSLC.x+Robot.L/2,     (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x + 0.1,     (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];

RSLCLS.y = [    Field.RSLC.y,    Field.RSLC.y,     Field.RSLC.y + .35 - 0.1,     Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];

%RSLCLS.x = [Field.RSLC.x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x, (Field.RSwitch.RightP.tr_x + Field.RSwitch.RightP.tl_x)/2 + RSLCLS.add_x];
%RSLCLS.y = [Field.RSLC.y, Field.RSLC.y, Field.RSwitch.LeftP.tr_y+Robot.L/2 + RSLCLS.add_y];


RSLCLS.v = 1.6;
RSLCLS.t_final = traj_length(RSLCLS) / RSLCLS.v  * 1.3;
RSLCLS.name = 'RSLCLS';