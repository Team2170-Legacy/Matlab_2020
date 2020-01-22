% Field.Scale.TopP.br_x = 29.5 * ft;
% Field.Scale.TopP.br_y = 18*ft;
% 
% Field.Scale.TopP.bl_x = 25.5*ft;
% Field.Scale.TopP.bl_y = Field.Scale.TopP.br_y;
% 
% Field.Scale.TopP.tl_x = Field.Scale.TopP.bl_x;
% Field.Scale.TopP.tl_y = 22*ft;
% 
% Field.Scale.TopP.tr_x = Field.Scale.TopP.br_x;
% Field.Scale.TopP.tr_y = Field.Scale.TopP.tl_y;

plot([Field.Scale.TopP.br_x Field.Scale.TopP.bl_x Field.Scale.TopP.tl_x Field.Scale.TopP.tr_x Field.Scale.TopP.br_x], [
Field.Scale.TopP.br_y Field.Scale.TopP.bl_y Field.Scale.TopP.tl_y Field.Scale.TopP.tr_y Field.Scale.TopP.br_y], 'g-*');

plot([Field.Scale.BottP.br_x Field.Scale.BottP.bl_x Field.Scale.BottP.tl_x Field.Scale.BottP.tr_x Field.Scale.BottP.br_x], [
Field.Scale.BottP.br_y Field.Scale.BottP.bl_y Field.Scale.BottP.tl_y Field.Scale.BottP.tr_y Field.Scale.BottP.br_y], 'g-*');