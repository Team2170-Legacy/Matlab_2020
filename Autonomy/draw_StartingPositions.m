%Plot starting positions
ARSL = plot(Field.RSL.x, Field.RSL.y, 'rx');
ARSM = plot(Field.RSM.x, Field.RSM.y, 'rx');
ARSR = plot(Field.RSR.x, Field.RSR.y, 'rx');

ABSL = plot(Field.BSL.x, Field.BSL.y, 'bx');
ABSM = plot(Field.BSM.x, Field.BSM.y, 'bx');
ABSR = plot(Field.BSR.x, Field.BSR.y, 'bx');
 
% left corner red side 
ARSLC = plot(Field.RSLC.x, Field.RSLC.y, 'rx');

% right corner red side 
ARSRC = plot(Field.RSRC.x, Field.RSRC.y, 'rx');

% Left Corner Blue Side
ABSLC = plot(Field.BSLC.x, Field.BSLC.y, 'bx');

% Right Corner Blue Side
ABSRC = plot(Field.BSRC.x, Field.BSRC.y, 'bx');
