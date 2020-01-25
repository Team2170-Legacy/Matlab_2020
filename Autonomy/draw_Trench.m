%red trench run
arrX = [17.5*ft 17.5*ft 35.5*ft 35.5*ft];
arrY = [27*ft 22.375*ft 22.375*ft 27*ft];
plot(arrX, arrY, 'linewidth', 2, 'color', [1 0 0]);

%blue trench run
arrX = [17.5*ft 17.5*ft 35.5*ft 35.5*ft];
arrY = [0*ft 4.625*ft 4.625*ft 0*ft];
plot(arrX, arrY, 'linewidth', 2, 'color', [0 0 1]);

%30.56 draw trenchs
%Red Trench
arrX = [29.31*ft 29.31*ft 31.81*ft 31.81*ft 29.31*ft];
arrY = [27*ft 22.375*ft 22.375*ft 27*ft 27*ft];
plot(arrX, arrY, 'linewidth', 3, 'color', [.5 .5 .5]);
%Blue Trench
arrX = [21.19*ft 21.19*ft 23.69*ft 23.69*ft 21.19*ft];
arrY = [0*ft 4.625*ft 4.625*ft 0*ft 0*ft];
plot(arrX, arrY, 'linewidth', 3, 'color', [.5 .5 .5]);
    
%draw baseplates