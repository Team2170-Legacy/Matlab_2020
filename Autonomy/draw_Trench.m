trenchRunL = 18*ft;
trenchRunW = 4*ft + 7.5*in;

%red trench run
arrX = [(Field.L/2 - trenchRunL/2) (Field.L/2 - trenchRunL/2) (Field.L/2 + trenchRunL/2) (Field.L/2 + trenchRunL/2)];
arrY = [Field.W (Field.W - trenchRunW) (Field.W - trenchRunW) Field.W];
plot(arrX, arrY, 'linewidth', 2, 'color', [1 0 0]);

%blue trench run
arrX = [(Field.L/2 - trenchRunL/2) (Field.L/2 - trenchRunL/2) (Field.L/2 + trenchRunL/2) (Field.L/2 + trenchRunL/2)];
arrY = [0*ft trenchRunW trenchRunW 0*ft];
plot(arrX, arrY, 'linewidth', 2, 'color', [0 0 1]);

%30.56 draw trenchs
%Red Trench
redTrenchCenterX = 30*ft + 6.72*in;
blueTrenchCenterX = 22*ft + 5.28*in;
trenchX = 2*ft + 6*in;

arrX = [(redTrenchCenterX - trenchX/2) (redTrenchCenterX - trenchX/2) (redTrenchCenterX + trenchX/2) (redTrenchCenterX + trenchX/2) (redTrenchCenterX - trenchX/2)];
arrY = [Field.W (Field.W - trenchRunW) (Field.W - trenchRunW) Field.W Field.W];
plot(arrX, arrY, 'linewidth', 3, 'color', [.5 .5 .5]);
%Blue Trench
arrX = [(blueTrenchCenterX - trenchX/2) (blueTrenchCenterX - trenchX/2) (blueTrenchCenterX + trenchX/2) (blueTrenchCenterX + trenchX/2) (blueTrenchCenterX - trenchX/2)];
arrY = [0*ft trenchRunW trenchRunW 0*ft 0*ft];
plot(arrX, arrY, 'linewidth', 3, 'color', [.5 .5 .5]);
    
%draw baseplates