
RSLCRB.x = [...
    Field.RSLC.x,  
    Field.RSwitch.RightP.br_x + 1.1, 
    Field.RSwitch.RightP.br_x + 1.1,
    (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSLCRB.add_x, 
    (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSLCRB.add_x ];
RSLCRB.y = [...
    Field.RSLC.y,  
    Field.RSLC.y,
    Field.RSRC.y-.2, 
    Field.RSRC.y-.2,  
    Field.RSwitch.RightP.br_y + RSRCLB.add_y - Robot.L/2];
RSLCRB.v = 2.0;
%RSLCRB.t_final = traj_length(RSLCRB) / RSLCRB.v  * 1.3;
RSLCRB.t_final = 8.6;
RSLCRB.name = 'RSLCRB';
