

%RSRCLB.x = [Field.RSRC.x, Field.RSwitch.RightP.br_x + .5, Field.RSwitch.RightP.br_x + .5, (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSRCLB.add_x, (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSRCLB.add_x ];
RSRCLBv2.x = RSLCRBv2.x;
RSRCLBv2.y = Field.W - RSLCRBv2.y;

RSRCLBv2.x(length(RSRCLBv2.x)-1) = RSRCLBv2.x(length(RSRCLBv2.x)-1) -  RSLCRBv2.add_x +  RSRCLBv2.add_x;
RSRCLBv2.x(length(RSRCLBv2.x)) = RSRCLBv2.x(length(RSRCLBv2.x)) -  RSLCRBv2.add_x +  RSRCLBv2.add_x;
RSRCLBv2.y(length(RSRCLBv2.y)) = RSRCLBv2.y(length(RSRCLBv2.y)) -  RSLCRBv2.add_y +  RSRCLBv2.add_y;

RSRCLBv2.v = 2.5;
RSRCLBv2.t_final = 6.5;
RSRCLBv2.name = 'RSRCLBv2';

