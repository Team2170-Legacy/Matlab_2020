

%RSRCLB.x = [Field.RSRC.x, Field.RSwitch.RightP.br_x + .5, Field.RSwitch.RightP.br_x + .5, (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSRCLB.add_x, (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSRCLB.add_x ];
RSRCLB.x = RSLCRB.x;
RSRCLB.y = [Field.RSRC.y, Field.RSRC.y, Field.RSLC.y+.2,  Field.RSLC.y+.2,  Field.RSwitch.LeftP.tr_y + RSRCLB.add_y + Robot.L/2];
RSRCLB.v = 2.5;
RSRCLB.t_final = 8.6;
RSRCLB.name = 'RSRCLB';

