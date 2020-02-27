
Field.L = 53*ft;
Field.W = 27*ft;

Field.PlayerStation = 6*ft + 3*in;
Field.CornerX = Field.PlayerStation * sind(20);
Field.CornerY = Field.PlayerStation * cosd(20);

%auto lines - *** UPDATE TO 2020 LOCATIONS!!! ***

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