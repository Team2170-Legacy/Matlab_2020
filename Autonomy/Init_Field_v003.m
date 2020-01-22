
Field.L = 54*ft;
Field.W = 27*ft;

if 0, %     MK 2019-03-02 COMMENT OUT FRC2017
    
    %   STARTING POSITIONS MOVED TO END OF THIS FILE SINCE THEY NEED FIELD
    %   DIMENSIONS TO BE CALCULATED
    
    %-------------------------------------------------------------------------
    
    % vision targets on switch
    
    %Field.RSwitch.LVT_x = 11.875*ft;
    %   UPDATED 03/08/2018 Martin Krucinski
    Field.RSwitch.LVT_x = 140*in;
    
    %Field.RSwitch.LVT_y = 18*ft;
    %   UPDATED 03/08/2018 Martin Krucinski
    Field.RSwitch.LVT_y = Field.W/2 + (12/2 - 3/2)*ft;  % THIS IS ACTUALLY 18 FT
    
    Field.RSwitch.RVT_x = Field.RSwitch.LVT_x;
    %Field.RSwitch.RVT_y = 9*ft;
    Field.RSwitch.RVT_y = Field.W/2 - (12/2 - 3/2)*ft;  % THIS IS ACTUALLY9 FT
    
    Field.BSwitch.LVT_x = Field.L - Field.RSwitch.LVT_x;
    Field.BSwitch.LVT_y = Field.RSwitch.RVT_y;
    
    Field.BSwitch.RVT_x = Field.L - Field.RSwitch.RVT_x;
    Field.BSwitch.RVT_y = Field.RSwitch.LVT_y;
    
    %Right Platform Red Switch
    Field.RSwitch.RightP.bl_x = 12*ft;
    Field.RSwitch.RightP.bl_y = 7.5*ft;
    
    Field.RSwitch.RightP.tl_x = Field.RSwitch.RightP.bl_x;
    Field.RSwitch.RightP.tl_y = 10.5*ft+2.25*in;
    Field.RSwitch.RightP.tr_x = 16*ft+1.5*in;
    Field.RSwitch.RightP.tr_y = Field.RSwitch.RightP.tl_y;
    
    Field.RSwitch.RightP.br_x = Field.RSwitch.RightP.tr_x;
    Field.RSwitch.RightP.br_y = Field.RSwitch.RightP.bl_y;
    
    % Left Platform Red Switch
    Field.RSwitch.LeftP.bl_x = Field.RSwitch.RightP.bl_x;
    Field.RSwitch.LeftP.bl_y = 16.5*ft-2.25*in;
    
    Field.RSwitch.LeftP.tl_x = Field.RSwitch.RightP.bl_x;
    Field.RSwitch.LeftP.tl_y = Field.RSwitch.LeftP.bl_y+3*ft+2.25*in;
    
    Field.RSwitch.LeftP.tr_x = Field.RSwitch.RightP.tr_x;
    Field.RSwitch.LeftP.tr_y = Field.RSwitch.LeftP.tl_y;
    
    Field.RSwitch.LeftP.br_x = Field.RSwitch.LeftP.tr_x;
    Field.RSwitch.LeftP.br_y = Field.RSwitch.LeftP.bl_y;
    
    % Right Platform Blue Switch
    Field.BSwitch.RightP.bl_x = Field.L - Field.RSwitch.RightP.bl_x;
    Field.BSwitch.RightP.bl_y = Field.RSwitch.RightP.bl_y;
    
    Field.BSwitch.RightP.tl_x = Field.BSwitch.RightP.bl_x;
    Field.BSwitch.RightP.tl_y = Field.RSwitch.RightP.tl_y;
    
    Field.BSwitch.RightP.tr_x = Field.L - Field.RSwitch.RightP.tr_x;
    Field.BSwitch.RightP.tr_y = Field.RSwitch.RightP.tl_y;
    
    Field.BSwitch.RightP.br_x = Field.BSwitch.RightP.tr_x;
    Field.BSwitch.RightP.br_y = Field.RSwitch.RightP.bl_y;
    
    %Left Platform Blue Switch
    Field.BSwitch.LeftP.bl_x = Field.L - Field.RSwitch.RightP.bl_x;
    Field.BSwitch.LeftP.bl_y = Field.RSwitch.LeftP.bl_y;
    
    Field.BSwitch.LeftP.tl_x = Field.BSwitch.LeftP.bl_x;
    Field.BSwitch.LeftP.tl_y = Field.RSwitch.LeftP.tl_y;
    
    Field.BSwitch.LeftP.tr_x = Field.L - Field.RSwitch.RightP.tr_x;
    Field.BSwitch.LeftP.tr_y = Field.RSwitch.LeftP.tr_y;
    
    Field.BSwitch.LeftP.br_x = Field.BSwitch.LeftP.tr_x;
    Field.BSwitch.LeftP.br_y =Field.RSwitch.LeftP.br_y;
    
    % Scale Ramps (Areas below scale)
    Field.ScaleRamp.bl_x = 261.47*in;
    Field.ScaleRamp.bl_y = 95.25*in;
    
    Field.ScaleRamp.tl_x = 261.47*in;
    Field.ScaleRamp.tl_y = Field.W - Field.ScaleRamp.bl_y;
    
    Field.ScaleRamp.tr_x = Field.L - Field.ScaleRamp.tl_x;
    Field.ScaleRamp.tr_y = Field.ScaleRamp.tl_y;
    
    Field.ScaleRamp.br_x = Field.ScaleRamp.tr_x;
    Field.ScaleRamp.br_y = Field.ScaleRamp.bl_y;
    
    
    %Top Plate of Scale from Looking Down (Red side is on the right)
    Field.Scale.TopP.br_x = (Field.L/2)+2*ft;
    Field.Scale.TopP.br_y = 18*ft;
    
    Field.Scale.TopP.bl_x = (Field.L/2)-2*ft;
    Field.Scale.TopP.bl_y = Field.Scale.TopP.br_y;
    
    Field.Scale.TopP.tl_x = Field.Scale.TopP.bl_x;
    Field.Scale.TopP.tl_y = 22*ft;
    
    Field.Scale.TopP.tr_x = Field.Scale.TopP.br_x;
    Field.Scale.TopP.tr_y = Field.Scale.TopP.tl_y;
    
    %Bottom Plate of Scale from Looking Down (Red side is on the right)
    Field.Scale.BottP.br_x = Field.Scale.TopP.br_x;
    Field.Scale.BottP.br_y = 5*ft;
    
    Field.Scale.BottP.bl_x = Field.Scale.TopP.bl_x;
    Field.Scale.BottP.bl_y = Field.Scale.BottP.br_y;
    
    Field.Scale.BottP.tl_x = Field.Scale.TopP.tl_x;
    Field.Scale.BottP.tl_y = 9*ft;
    
    Field.Scale.BottP.tr_x = Field.Scale.TopP.tr_x;
    Field.Scale.BottP.tr_y = Field.Scale.BottP.tl_y;
    
    % Red Exchange Zone
    
    Field.RedExchangeZone.tl_x = 0;
    %Field.RedExchangeZone.tl_y = 18*ft;
    %   UPDATED 03/08/2018 Martin Krucinski
    Field.RedExchangeZone.tl_y = Field.W/2 + 12*in + 48*in;
    
    %Field.RedExchangeZone.tr_x = 4*ft;
    %   UPDATED 03/08/2018 Martin Krucinski
    Field.RedExchangeZone.tr_x = 36*in;
    Field.RedExchangeZone.tr_y = Field.RedExchangeZone.tl_y;
    
    Field.RedExchangeZone.br_x = Field.RedExchangeZone.tr_x;
    %Field.RedExchangeZone.br_y = 14*ft;
    %   UPDATED 03/08/2018 Martin Krucinski
    Field.RedExchangeZone.br_y = Field.W/2 + 12*in;
    
    Field.RedExchangeZone.bl_x = Field.RedExchangeZone.tl_x;
    Field.RedExchangeZone.bl_y = Field.RedExchangeZone.br_y;
    
    % Blue Exchange Zone
    
    Field.BlueExchangeZone.tl_x = Field.L;
    Field.BlueExchangeZone.tl_y = Field.W - Field.RedExchangeZone.tl_y;
    
    Field.BlueExchangeZone.tr_x = Field.L - Field.RedExchangeZone.tr_x;
    Field.BlueExchangeZone.tr_y = Field.W - Field.RedExchangeZone.tl_y;
    
    Field.BlueExchangeZone.br_x = Field.L - Field.RedExchangeZone.tr_x;
    Field.BlueExchangeZone.br_y = Field.W - Field.RedExchangeZone.br_y;
    
    Field.BlueExchangeZone.bl_x = Field.L - Field.RedExchangeZone.tl_x;
    Field.BlueExchangeZone.bl_y = Field.W - Field.RedExchangeZone.br_y;
    
    %auto lines
    AutoLineRed.C1_x = 10*ft;
    AutoLineRed.C1_y = 0*ft;
    AutoLineRed.C2_x = AutoLineRed.C1_x;
    AutoLineRed.C2_y = 27*ft;
    
    AutoLineBlue.C1_x = Field.L - AutoLineRed.C1_x;
    AutoLineBlue.C1_y = AutoLineRed.C1_y;
    AutoLineBlue.C2_x = AutoLineBlue.C1_x;
    AutoLineBlue.C2_y = AutoLineRed.C2_y;
    
    Field.AutoLineRed = AutoLineRed;
    Field.AutoLineBlue = AutoLineBlue;
    
    
    
    
    %Cubes
    %Cubes in Red Platform Zone
    spaceBetweenSwitches = Field.RSwitch.LeftP.tl_y - Field.RSwitch.RightP.bl_y;
    space = (spaceBetweenSwitches- 6*13*in)/5  + 13*in;
    
    Field.RedPlatZone.Cube1_x = Field.RSwitch.RightP.br_x+13/2*in;
    Field.RedPlatZone.Cube1_y = Field.RSwitch.RightP.br_y+13/2*in;
    %Field.RedPlatZone.Cube1_y = 8.041667*ft;
    
    Field.RedPlatZone.Cube2_x = Field.RedPlatZone.Cube1_x;
    Field.RedPlatZone.Cube2_y = Field.RedPlatZone.Cube1_y + space;
    
    Field.RedPlatZone.Cube3_x = Field.RedPlatZone.Cube1_x;
    Field.RedPlatZone.Cube3_y = Field.RedPlatZone.Cube1_y + space*2;
    
    Field.RedPlatZone.Cube4_x = Field.RedPlatZone.Cube1_x;
    Field.RedPlatZone.Cube4_y = Field.RedPlatZone.Cube1_y + space*3;
    
    Field.RedPlatZone.Cube5_x = Field.RedPlatZone.Cube1_x;
    Field.RedPlatZone.Cube5_y = Field.RedPlatZone.Cube1_y + space*4;
    
    Field.RedPlatZone.Cube6_x = Field.RedPlatZone.Cube1_x;
    Field.RedPlatZone.Cube6_y = Field.RedPlatZone.Cube1_y + space*5;
    
    
    %Cubes in Red Pyramid
    Field.RedPyramid.Cube1_x = 11.458333*ft;
    Field.RedPyramid.Cube1_y = 13.5*ft;
    
    Field.RedPyramid.Cube2_x = Field.RedPyramid.Cube1_x;
    Field.RedPyramid.Cube2_y = 14.58333*ft;
    
    Field.RedPyramid.Cube3_x = Field.RedPyramid.Cube1_x;
    Field.RedPyramid.Cube3_y = 12.41667*ft;
    
    Field.RedPyramid.Cube4_x = 10.375*ft;
    Field.RedPyramid.Cube4_y = 14.041667*ft;
    
    Field.RedPyramid.Cube5_x = Field.RedPyramid.Cube4_x;
    Field.RedPyramid.Cube5_y = 12.958333*ft;
    
    Field.RedPyramid.Cube6_x = 9.291667*ft;
    Field.RedPyramid.Cube6_y = Field.RedPyramid.Cube1_y;
    
    % Cubes in Blue Platform Zone
    
    Field.BluePlatZone.Cube1_x = Field.L - Field.RedPlatZone.Cube1_x;
    Field.BluePlatZone.Cube1_y = Field.RedPlatZone.Cube1_y;
    
    Field.BluePlatZone.Cube2_x = Field.BluePlatZone.Cube1_x;
    Field.BluePlatZone.Cube2_y = Field.RedPlatZone.Cube1_y + space;
    
    Field.BluePlatZone.Cube3_x = Field.BluePlatZone.Cube1_x;
    Field.BluePlatZone.Cube3_y = Field.RedPlatZone.Cube1_y + space*2;
    
    Field.BluePlatZone.Cube4_x = Field.BluePlatZone.Cube1_x;
    Field.BluePlatZone.Cube4_y = Field.RedPlatZone.Cube1_y + space*3;
    
    Field.BluePlatZone.Cube5_x = Field.BluePlatZone.Cube1_x;
    Field.BluePlatZone.Cube5_y = Field.RedPlatZone.Cube1_y + space*4;
    
    Field.BluePlatZone.Cube6_x = Field.BluePlatZone.Cube1_x;
    Field.BluePlatZone.Cube6_y = Field.RedPlatZone.Cube1_y + space*5;
    
    %Cubes in Blue Pyramid
    Field.BluePyramid.Cube1_x = Field.L - Field.RedPyramid.Cube1_x;
    Field.BluePyramid.Cube1_y = Field.RedPyramid.Cube1_y;
    
    Field.BluePyramid.Cube2_x = Field.L - Field.RedPyramid.Cube2_x;
    Field.BluePyramid.Cube2_y = Field.RedPyramid.Cube2_y;
    
    Field.BluePyramid.Cube3_x = Field.L - Field.RedPyramid.Cube3_x;
    Field.BluePyramid.Cube3_y = Field.RedPyramid.Cube3_y;
    
    Field.BluePyramid.Cube4_x = Field.L - Field.RedPyramid.Cube4_x;
    Field.BluePyramid.Cube4_y = Field.RedPyramid.Cube4_y;
    
    Field.BluePyramid.Cube5_x = Field.L - Field.RedPyramid.Cube5_x;
    Field.BluePyramid.Cube5_y = Field.RedPyramid.Cube5_y;
    
    Field.BluePyramid.Cube6_x = Field.L - Field.RedPyramid.Cube6_x;
    Field.BluePyramid.Cube6_y = Field.RedPyramid.Cube6_y;
    
    % Corner Line
    % First Point for red touches alliance station
    % Second Point for blue touches alliance station
    
    % Red Right
    Field.CornerLine.RR.P1_x = 0*in;
    Field.CornerLine.RR.P1_y = 29.69*in;
    Field.CornerLine.RR.P2_x = 36*in;
    Field.CornerLine.RR.P2_y = 0*in;
    
    % Red Left
    Field.CornerLine.RL.P1_x = 0*in;
    Field.CornerLine.RL.P1_y = Field.W - Field.CornerLine.RR.P1_y;
    Field.CornerLine.RL.P2_x = 36*in;
    Field.CornerLine.RL.P2_y = Field.W;
    
    % Blue Right
    Field.CornerLine.BR.P1_x = Field.L - 36*in;
    Field.CornerLine.BR.P1_y = Field.W;
    Field.CornerLine.BR.P2_x = Field.L;
    Field.CornerLine.BR.P2_y = Field.W - 26.29*in;
    
    %Blue Left
    Field.CornerLine.BL.P1_x = Field.L - 36*in;
    Field.CornerLine.BL.P1_y = 0;
    Field.CornerLine.BL.P2_x = Field.L;
    Field.CornerLine.BL.P2_y = 26.29*in;
    
    %-------------------------------------------------------------------------
    % Starting Points RED side, needs to be changed
    %-------------------------------------------------------------------------
    Field.RSM.x = Robot.L/2;
    %Field.RSM.y = 12*ft; % Keep this location, 7 in to the right of the Exchange zone tape for our robot
    %   New location is robot eddge to be 8.5 in to the right of Exchange zone tape
    Field.RSM.y = Field.RedExchangeZone.bl_y - 8.5*in - Robot.W/2;
    the_dist1   = Field.RedExchangeZone.bl_y - (Field.RSM.y + Robot.W/2);
    disp([ 'RSM.y distance to the RIGHT of Red Exchange tape edge = ' ...
        num2str(the_dist1) ' [m] = ' num2str(the_dist1/in) ' [in]' ]);
    
    Field.RSR.x = Robot.L/2;
    %Field.RSR.y = 6*ft; % Needs to be changed
    Field.RSR.y = Field.RSM.y - (40 + 10)*in;   % use 40 in max robot width and 10 in safety margin
    the_dist2    = Field.RedExchangeZone.bl_y - (Field.RSR.y + Robot.W/2);
    disp([ 'RSR.y distance to the RIGHT of Red Exchange tape edge = ' ...
        num2str(the_dist2) ' [m] = ' num2str(the_dist2/in) ' [in]' ]);
    
    Field.RSL.x = Robot.L/2;
    %Field.RSL.y = 24*ft; % Needs to be changed
    Field.RSL.y = Field.W/2 + 12*in + 48*in + 8.5*in + Robot.W/2;   % 8.5 in to the left of the Exchange Tape
    the_dist3    = Field.RSL.y - Robot.W/2 - Field.RedExchangeZone.tl_y;
    disp([ 'RSL.y distance to the LEFT of Red Exchange tape edge = ' ...
        num2str(the_dist3) ' [m] = ' num2str(the_dist3/in) ' [in]' ]);
    
    Field.RSLC.x = Robot.L/2;
    Field.RSLC.y = Field.CornerLine.RL.P1_y - Robot.W/2;
    
    Field.RSRC.x = Robot.L/2;
    Field.RSRC.y = Field.CornerLine.RR.P1_y + Robot.W/2;
    
    %-------------------------------------------------------------------------
    % Starting Points BLUE side (not used at this time)
    %-------------------------------------------------------------------------
    Field.BSR.x = Field.L - Robot.L/2;
    Field.BSR.y = Field.W - Field.RSL.y;
    
    Field.BSM.x = Field.L - Robot.L/2;
    Field.BSM.y = Field.W - Field.RSM.y;
    
    Field.BSL.x = Field.L - Robot.L/2;
    Field.BSL.y = Field.W - Field.RSR.y;
    
    Field.BSLC.x = Field.L - Robot.L/2;
    Field.BSLC.y = Field.W - Field.RSLC.y;
    
    Field.BSRC.x = Field.L - Robot.L/2;
    Field.BSRC.y = Field.W - Field.RSRC.y;
    
    
end
