targetZone = 4*ft;
loadingZone = 5*ft;

%Field.CornerY

%red target zone
plot([0 0], [(Field.W - Field.CornerY) Field.W - Field.CornerY - targetZone] , 'r-*');
%red loading zone
plot([Field.L Field.L], [(Field.W - Field.CornerY) (Field.W - Field.CornerY - loadingZone)] , 'r-*');
%blue target zone
plot([Field.L Field.L], [Field.CornerY (Field.CornerY + targetZone)] , 'b-*');
%blue loading zone
plot([0 0], [Field.CornerY (Field.CornerY + loadingZone)] , 'b-*');
