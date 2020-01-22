
%figure; 
%hold on

title_text = title('FRC Team 2170 Robot Simulator');
%text(Field.L/2-1, Field.W/2+1/2, ['time = ' num2str(Field.t) ' secs']);
text(10, Field.W/2+1/2, ['time = ' num2str(Field.t) ' secs']);
% Plot field
%OutsideSquare = plot([0 0 Field.L Field.L 0], [0 Field.L Field.L 0 0], 'g');


% xlim([0 54*ft]);
% ylim([0 27*ft]);
Arcade = plot([0 Field.L Field.L 0 0], [0 0 Field.W Field.W 0],'gre');

%draw_StartingPositions();
%draw_AutoLine();
%draw_Switch();
%draw_Scale();
%draw_ExchangeZone();
%draw_FieldCorners();

%plot([10*ft+3*in 126*in 14*ft 14*ft 10*ft+3*in], [11*ft+8*in 15*ft+2*in 183.5*in 138.5*in 11*ft+8*in], 'g');
%plot([Field.L-10*ft+3*in Field.L-10*ft+3*in Field.L-14*ft Field.L-14*ft Field.L-10*ft+3*in], [11*ft+8*in 15*ft+2*in 15*ft+2*in 11*ft+8*in 11*ft+8*in], 'g');

% plot([Field.ScaleRamp.bl_x, Field.ScaleRamp.tl_x] , [Field.ScaleRamp.bl_y,  Field.ScaleRamp.tl_y], 'red');
% plot([Field.ScaleRamp.br_x, Field.ScaleRamp.tr_x] , [Field.ScaleRamp.br_y, Field.ScaleRamp.tr_y], 'blue');
% plot([Field.ScaleRamp.bl_x, Field.ScaleRamp.br_x] , [Field.ScaleRamp.bl_y, Field.ScaleRamp.br_y], 'Color',[0.4940, 0.1840, 0.5560]);
% plot([Field.ScaleRamp.tl_x, Field.ScaleRamp.tr_x] , [Field.ScaleRamp.tl_y, Field.ScaleRamp.tr_y], 'Color', [0.4940, 0.1840, 0.5560]);

draw_Rocket_Line;


%plot([6,0] , [6,0 + (18*in)]);
% 
% draw_Cube(Field.RedPlatZone.Cube1_x, Field.RedPlatZone.Cube1_y);
% draw_Cube(Field.RedPlatZone.Cube2_x, Field.RedPlatZone.Cube2_y);
% draw_Cube(Field.RedPlatZone.Cube3_x, Field.RedPlatZone.Cube3_y);
% draw_Cube(Field.RedPlatZone.Cube4_x, Field.RedPlatZone.Cube4_y);
% draw_Cube(Field.RedPlatZone.Cube5_x, Field.RedPlatZone.Cube5_y);
% draw_Cube(Field.RedPlatZone.Cube6_x, Field.RedPlatZone.Cube6_y);
% 
% draw_Cube(Field.BluePlatZone.Cube1_x, Field.BluePlatZone.Cube1_y);
% draw_Cube(Field.BluePlatZone.Cube2_x, Field.BluePlatZone.Cube2_y);
% draw_Cube(Field.BluePlatZone.Cube3_x, Field.BluePlatZone.Cube3_y);
% draw_Cube(Field.BluePlatZone.Cube4_x, Field.BluePlatZone.Cube4_y);
% draw_Cube(Field.BluePlatZone.Cube5_x, Field.BluePlatZone.Cube5_y);
% draw_Cube(Field.BluePlatZone.Cube6_x, Field.BluePlatZone.Cube6_y);
% 
% draw_Cube(Field.RedPyramid.Cube1_x, Field.RedPyramid.Cube1_y);
% draw_Cube(Field.RedPyramid.Cube2_x, Field.RedPyramid.Cube2_y);
% draw_Cube(Field.RedPyramid.Cube3_x, Field.RedPyramid.Cube3_y);
% draw_Cube(Field.RedPyramid.Cube4_x, Field.RedPyramid.Cube4_y);
% draw_Cube(Field.RedPyramid.Cube5_x, Field.RedPyramid.Cube5_y);
% draw_Cube(Field.RedPyramid.Cube6_x, Field.RedPyramid.Cube6_y);
% 
% draw_Cube(Field.BluePyramid.Cube1_x, Field.BluePyramid.Cube1_y);
% draw_Cube(Field.BluePyramid.Cube2_x, Field.BluePyramid.Cube2_y);
% draw_Cube(Field.BluePyramid.Cube3_x, Field.BluePyramid.Cube3_y);
% draw_Cube(Field.BluePyramid.Cube4_x, Field.BluePyramid.Cube4_y);
% draw_Cube(Field.BluePyramid.Cube5_x, Field.BluePyramid.Cube5_y);
% draw_Cube(Field.BluePyramid.Cube6_x, Field.BluePyramid.Cube6_y);
