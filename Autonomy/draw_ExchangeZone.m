% Draw Red Exchange Zone

REZ = Field.RedExchangeZone;
BEZ = Field.BlueExchangeZone;

plot([REZ.tl_x REZ.tr_x REZ.br_x REZ.bl_x REZ.tl_x], [REZ.tl_y REZ.tr_y REZ.br_y REZ.bl_y REZ.tl_y], 'r-*');
plot([BEZ.tl_x BEZ.tr_x BEZ.br_x BEZ.bl_x BEZ.tl_x], [BEZ.tl_y BEZ.tr_y BEZ.br_y BEZ.bl_y BEZ.tl_y], 'b-*');