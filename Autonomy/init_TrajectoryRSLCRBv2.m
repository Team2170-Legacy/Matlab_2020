cornerdistance = .5;
endcornerdistance = .2;
[Points] = calcCorners( Field.RSwitch.RightP.br_x + 1.1,   Field.RSLC.y, cornerdistance, -1, -1);
[Points2] = calcCorners( Field.RSwitch.RightP.br_x + 1.1, Field.RSRC.y-.2, cornerdistance, -1, 1);
[Points3] = calcCorners( (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSLCRBv2.add_x, Field.RSRC.y-.2, endcornerdistance, 1, 1);
RSLCRBv2.x = [...
    Field.RSLC.x,
    Points.x',
  Points2.x(2),
   Points2.x(1),
    Points3.x',
    (Field.RSwitch.LeftP.tl_x + Field.RSwitch.LeftP.tr_x)/2 + RSLCRBv2.add_x ];
RSLCRBv2.y = [...
    Field.RSLC.y,
    Points.y',
   Points2.y(2),
   Points2.y(1),
   Points3.y',
    Field.RSwitch.RightP.br_y + RSRCLB.add_y - Robot.L/2];
RSLCRBv2.v = 2.5;
%RSLCRB.t_final = traj_length(RSLCRB) / RSLCRB.v  * 1.3;
RSLCRBv2.t_final = 6.5;
RSLCRBv2.name = 'RSLCRBv2';
