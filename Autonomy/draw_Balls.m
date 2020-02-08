r = 3.5*in;

%red trench run first 3 balls (from left)
x = 20.5*ft;
y = 24.6875*ft;
th = 0:pi/100:2*pi;
a = r*cos(th) + x;
b = r*sin(th) + y;
for ball_i = 1:3
    circ = plot(a,b,'y','linewidth', 6);
    a = a + 3*ft;
end
%red trench double balls 1.7291665
x = 32.2891665*ft;
y = 25.4583335*ft;
for ball_i = 1:2
    a = r*cos(th) + x;
    b = r*sin(th) + y;
    circ = plot(a,b,'y','linewidth', 6);
    y = 23.9166665*ft;
end

%blue trench run first 3 balls (from left)
x = 32.5*ft;
y = 2.3125*ft;
th = 0:pi/100:2*pi;
a = r*cos(th) + x;
b = r*sin(th) + y;
for ball_i = 1:3
    circ = plot(a,b,'y','linewidth', 6);
    a = a - 3*ft;
end
%blue trench double balls 1.7291665
x = 20.71*ft;
y = 1.5416665*ft;
for ball_i = 1:2
    a = r*cos(th) + x;
    b = r*sin(th) + y;
    circ = plot(a,b,'y','linewidth', 6);
    y = 3.0833335*ft;
end