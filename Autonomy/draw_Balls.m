pwrCell.r = 3.5*in;

%red trench run first 3 balls (from left)
pwrCell.x = 20.5*ft;
pwrCell.y = 24.6875*ft;
pwrCell.th = 0:pi/100:2*pi;
pwrCell.a = pwrCell.r*cos(pwrCell.th) + pwrCell.x;
pwrCell.b = pwrCell.r*sin(pwrCell.th) + pwrCell.y;
for ball_i = 1:3
    plot(pwrCell.a,pwrCell.b,'y','linewidth', 6);
    pwrCell.a = pwrCell.a + 3*ft;
end
%red trench double balls 1.7291665
pwrCell.x = 32.2891665*ft;
pwrCell.y = 25.4583335*ft;
for ball_i = 1:2
    pwrCell.a = pwrCell.r*cos(pwrCell.th) + pwrCell.x;
    pwrCell.b = pwrCell.r*sin(pwrCell.th) + pwrCell.y;
    plot(pwrCell.a,pwrCell.b,'y','linewidth', 6);
    pwrCell.y = 23.9166665*ft;
end

%blue trench run first 3 balls (from left)
pwrCell.x = 32.5*ft;
pwrCell.y = 2.3125*ft;
pwrCell.th = 0:pi/100:2*pi;
pwrCell.a = pwrCell.r*cos(pwrCell.th) + pwrCell.x;
pwrCell.b = pwrCell.r*sin(pwrCell.th) + pwrCell.y;
for ball_i = 1:3
    plot(pwrCell.a,pwrCell.b,'y','linewidth', 6);
    pwrCell.a = pwrCell.a - 3*ft;
end
%blue trench double balls 1.7291665
pwrCell.x = 20.71*ft;
pwrCell.y = 1.5416665*ft;
for ball_i = 1:2
    pwrCell.a = pwrCell.r*cos(pwrCell.th) + pwrCell.x;
    pwrCell.b = pwrCell.r*sin(pwrCell.th) + pwrCell.y;
    plot(pwrCell.a,pwrCell.b,'y','linewidth', 6);
    pwrCell.y = 3.0833335*ft;
end

%SG Balls: 6 balls each short side, 8 balls each long side
%Total can only be 5 balls per alliance in SG so...
%Ball spacing is 1ft, 4.5in
