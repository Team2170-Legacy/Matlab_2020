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
%Ball spacing is 1ft, 4.5in, 28 slots total
%Boundary Slots for Power Cells
pwrCell.SlotsTopLeft = [0 - (14*ft + 3/4*in)/2 + 1*ft;(13*ft + 3/2*in)/2 - 1*ft];
pwrCell.SlotsTopRightY = (14*ft + 3/4*in)/2 - 1*ft;
pwrCell.SlotsBottomLeft = [0 - (14*ft + 3/4*in)/2 + 1*ft;0 - (13*ft + 3/2*in)/2 + 1*ft];
pwrCell.SlotsX = [(pwrCell.SlotsTopLeft(1) + 1*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 2*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 3*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 4*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 5*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 6*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 7*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(1) + 8*(1*ft + 4.5*in))];
pwrCell.SlotsY = [pwrCell.SlotsTopLeft(2) (pwrCell.SlotsTopLeft(2) - 6*in - 1*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(2) - 6*in - 2*(1*ft + 4.5*in)) (pwrCell.SlotsTopLeft(2) - 6*in - 3*(1*ft + 4.5*in)) (pwrCell.SlotsBottomLeft(2) + 6*in + 3*(1*ft + 4.5*in)) (pwrCell.SlotsBottomLeft(2) + 6*in + 2*(1*ft + 4.5*in)) (pwrCell.SlotsBottomLeft(2) + 6*in + 1*(1*ft + 4.5*in)) pwrCell.SlotsBottomLeft(2)];
%x length is 8, y length is 6 (arr length)

%matrix for rotations
pwrCell.SlotsRotMatrix = [cosd(22.5) -1*sind(22.5); sind(22.5) cosd(22.5)];

%Locations are in this format:
% 1  2  3  4  5  6  7  8
% 9                    10
% 11                   12
% 13                   14
% 15                   16
% 17                   18
% 19                   20
% 21 22 23 24 25 26 27 28
pwrCell.Slots.Location1 = [pwrCell.SlotsX(1);pwrCell.SlotsY(1)];
pwrCell.Slots.Location2 = [pwrCell.SlotsX(2);pwrCell.SlotsY(1)];
pwrCell.Slots.Location3 = [pwrCell.SlotsX(3);pwrCell.SlotsY(1)];
pwrCell.Slots.Location4 = [pwrCell.SlotsX(4);pwrCell.SlotsY(1)];
pwrCell.Slots.Location5 = [pwrCell.SlotsX(5);pwrCell.SlotsY(1)];
pwrCell.Slots.Location6 = [pwrCell.SlotsX(6);pwrCell.SlotsY(1)];
pwrCell.Slots.Location7 = [pwrCell.SlotsX(7);pwrCell.SlotsY(1)];
pwrCell.Slots.Location8 = [pwrCell.SlotsX(8);pwrCell.SlotsY(1)];
pwrCell.Slots.Location9 = [pwrCell.SlotsTopLeft(1);pwrCell.SlotsY(2)];
pwrCell.Slots.Location10 = [pwrCell.SlotsTopRightY;pwrCell.SlotsY(2)];
pwrCell.Slots.Location11 = [pwrCell.SlotsTopLeft(1);pwrCell.SlotsY(3)];
pwrCell.Slots.Location12 = [pwrCell.SlotsTopRightY;pwrCell.SlotsY(3)];
pwrCell.Slots.Location13 = [pwrCell.SlotsTopLeft(1);pwrCell.SlotsY(4)];
pwrCell.Slots.Location14 = [pwrCell.SlotsTopRightY;pwrCell.SlotsY(4)];
pwrCell.Slots.Location15 = [pwrCell.SlotsTopLeft(1);pwrCell.SlotsY(5)];
pwrCell.Slots.Location16 = [pwrCell.SlotsTopRightY;pwrCell.SlotsY(5)];
pwrCell.Slots.Location17 = [pwrCell.SlotsTopLeft(1);pwrCell.SlotsY(6)];
pwrCell.Slots.Location18 = [pwrCell.SlotsTopRightY;pwrCell.SlotsY(6)];
pwrCell.Slots.Location19 = [pwrCell.SlotsTopLeft(1);pwrCell.SlotsY(7)];
pwrCell.Slots.Location20 = [pwrCell.SlotsTopRightY;pwrCell.SlotsY(7)];
pwrCell.Slots.Location21 = [pwrCell.SlotsX(1);pwrCell.SlotsY(8)];
pwrCell.Slots.Location22 = [pwrCell.SlotsX(2);pwrCell.SlotsY(8)];
pwrCell.Slots.Location23 = [pwrCell.SlotsX(3);pwrCell.SlotsY(8)];
pwrCell.Slots.Location24 = [pwrCell.SlotsX(4);pwrCell.SlotsY(8)];
pwrCell.Slots.Location25 = [pwrCell.SlotsX(5);pwrCell.SlotsY(8)];
pwrCell.Slots.Location26 = [pwrCell.SlotsX(6);pwrCell.SlotsY(8)];
pwrCell.Slots.Location27 = [pwrCell.SlotsX(7);pwrCell.SlotsY(8)];
pwrCell.Slots.Location28 = [pwrCell.SlotsX(8);pwrCell.SlotsY(8)];

%multiply with rotational matrix
%SG.Q1.L = SGRotMatrix * SG.Q1.L;
pwrCell.Slots.Location1 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location1;
pwrCell.Slots.Location2 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location2;
pwrCell.Slots.Location3 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location3;
pwrCell.Slots.Location4 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location4;
pwrCell.Slots.Location5 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location5;
pwrCell.Slots.Location6 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location6;
pwrCell.Slots.Location7 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location7;
pwrCell.Slots.Location8 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location8;
pwrCell.Slots.Location9 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location9;
pwrCell.Slots.Location10 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location10;
pwrCell.Slots.Location11 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location11;
pwrCell.Slots.Location12 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location12;
pwrCell.Slots.Location13 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location13;
pwrCell.Slots.Location14 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location14;
pwrCell.Slots.Location15 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location15;
pwrCell.Slots.Location16 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location16;
pwrCell.Slots.Location17 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location17;
pwrCell.Slots.Location18 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location18;
pwrCell.Slots.Location19 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location19;
pwrCell.Slots.Location20 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location20;
pwrCell.Slots.Location21 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location21;
pwrCell.Slots.Location22 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location22;
pwrCell.Slots.Location23 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location23;
pwrCell.Slots.Location24 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location24;
pwrCell.Slots.Location25 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location25;
pwrCell.Slots.Location26 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location26;
pwrCell.Slots.Location27 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location27;
pwrCell.Slots.Location28 = pwrCell.SlotsRotMatrix * pwrCell.Slots.Location28;

%translate all points x
pwrCell.Slots.Location1(1) = pwrCell.Slots.Location1(1) + Field.L/2;
pwrCell.Slots.Location2(1) = pwrCell.Slots.Location2(1) + Field.L/2;
pwrCell.Slots.Location3(1) = pwrCell.Slots.Location3(1) + Field.L/2;
pwrCell.Slots.Location4(1) = pwrCell.Slots.Location4(1) + Field.L/2;
pwrCell.Slots.Location5(1) = pwrCell.Slots.Location5(1) + Field.L/2;
pwrCell.Slots.Location6(1) = pwrCell.Slots.Location6(1) + Field.L/2;
pwrCell.Slots.Location7(1) = pwrCell.Slots.Location7(1) + Field.L/2;
pwrCell.Slots.Location8(1) = pwrCell.Slots.Location8(1) + Field.L/2;
pwrCell.Slots.Location9(1) = pwrCell.Slots.Location9(1) + Field.L/2;
pwrCell.Slots.Location10(1) = pwrCell.Slots.Location10(1) + Field.L/2;
pwrCell.Slots.Location11(1) = pwrCell.Slots.Location11(1) + Field.L/2;
pwrCell.Slots.Location12(1) = pwrCell.Slots.Location12(1) + Field.L/2;
pwrCell.Slots.Location13(1) = pwrCell.Slots.Location13(1) + Field.L/2;
pwrCell.Slots.Location14(1) = pwrCell.Slots.Location14(1) + Field.L/2;
pwrCell.Slots.Location15(1) = pwrCell.Slots.Location15(1) + Field.L/2;
pwrCell.Slots.Location16(1) = pwrCell.Slots.Location16(1) + Field.L/2;
pwrCell.Slots.Location17(1) = pwrCell.Slots.Location17(1) + Field.L/2;
pwrCell.Slots.Location18(1) = pwrCell.Slots.Location18(1) + Field.L/2;
pwrCell.Slots.Location19(1) = pwrCell.Slots.Location19(1) + Field.L/2;
pwrCell.Slots.Location20(1) = pwrCell.Slots.Location20(1) + Field.L/2;
pwrCell.Slots.Location21(1) = pwrCell.Slots.Location21(1) + Field.L/2;
pwrCell.Slots.Location22(1) = pwrCell.Slots.Location22(1) + Field.L/2;
pwrCell.Slots.Location23(1) = pwrCell.Slots.Location23(1) + Field.L/2;
pwrCell.Slots.Location24(1) = pwrCell.Slots.Location24(1) + Field.L/2;
pwrCell.Slots.Location25(1) = pwrCell.Slots.Location25(1) + Field.L/2;
pwrCell.Slots.Location26(1) = pwrCell.Slots.Location26(1) + Field.L/2;
pwrCell.Slots.Location27(1) = pwrCell.Slots.Location27(1) + Field.L/2;
pwrCell.Slots.Location28(1) = pwrCell.Slots.Location28(1) + Field.L/2;
%translate all points y
pwrCell.Slots.Location1(2) = pwrCell.Slots.Location1(2) + Field.W/2;
pwrCell.Slots.Location2(2) = pwrCell.Slots.Location2(2) + Field.W/2;
pwrCell.Slots.Location3(2) = pwrCell.Slots.Location3(2) + Field.W/2;
pwrCell.Slots.Location4(2) = pwrCell.Slots.Location4(2) + Field.W/2;
pwrCell.Slots.Location5(2) = pwrCell.Slots.Location5(2) + Field.W/2;
pwrCell.Slots.Location6(2) = pwrCell.Slots.Location6(2) + Field.W/2;
pwrCell.Slots.Location7(2) = pwrCell.Slots.Location7(2) + Field.W/2;
pwrCell.Slots.Location8(2) = pwrCell.Slots.Location8(2) + Field.W/2;
pwrCell.Slots.Location9(2) = pwrCell.Slots.Location9(2) + Field.W/2;
pwrCell.Slots.Location10(2) = pwrCell.Slots.Location10(2) + Field.W/2;
pwrCell.Slots.Location11(2) = pwrCell.Slots.Location11(2) + Field.W/2;
pwrCell.Slots.Location12(2) = pwrCell.Slots.Location12(2) + Field.W/2;
pwrCell.Slots.Location13(2) = pwrCell.Slots.Location13(2) + Field.W/2;
pwrCell.Slots.Location14(2) = pwrCell.Slots.Location14(2) + Field.W/2;
pwrCell.Slots.Location15(2) = pwrCell.Slots.Location15(2) + Field.W/2;
pwrCell.Slots.Location16(2) = pwrCell.Slots.Location16(2) + Field.W/2;
pwrCell.Slots.Location17(2) = pwrCell.Slots.Location17(2) + Field.W/2;
pwrCell.Slots.Location18(2) = pwrCell.Slots.Location18(2) + Field.W/2;
pwrCell.Slots.Location19(2) = pwrCell.Slots.Location19(2) + Field.W/2;
pwrCell.Slots.Location20(2) = pwrCell.Slots.Location20(2) + Field.W/2;
pwrCell.Slots.Location21(2) = pwrCell.Slots.Location21(2) + Field.W/2;
pwrCell.Slots.Location22(2) = pwrCell.Slots.Location22(2) + Field.W/2;
pwrCell.Slots.Location23(2) = pwrCell.Slots.Location23(2) + Field.W/2;
pwrCell.Slots.Location24(2) = pwrCell.Slots.Location24(2) + Field.W/2;
pwrCell.Slots.Location25(2) = pwrCell.Slots.Location25(2) + Field.W/2;
pwrCell.Slots.Location26(2) = pwrCell.Slots.Location26(2) + Field.W/2;
pwrCell.Slots.Location27(2) = pwrCell.Slots.Location27(2) + Field.W/2;
pwrCell.Slots.Location28(2) = pwrCell.Slots.Location28(2) + Field.W/2;

%plot all locations as green points
plot(pwrCell.Slots.Location1(1), pwrCell.Slots.Location1(2), 'g*');
plot(pwrCell.Slots.Location2(1), pwrCell.Slots.Location2(2), 'g*');
plot(pwrCell.Slots.Location3(1), pwrCell.Slots.Location3(2), 'g*');
plot(pwrCell.Slots.Location4(1), pwrCell.Slots.Location4(2), 'g*');
plot(pwrCell.Slots.Location5(1), pwrCell.Slots.Location5(2), 'g*');
plot(pwrCell.Slots.Location6(1), pwrCell.Slots.Location6(2), 'g*');
plot(pwrCell.Slots.Location7(1), pwrCell.Slots.Location7(2), 'g*');
plot(pwrCell.Slots.Location8(1), pwrCell.Slots.Location8(2), 'g*');
plot(pwrCell.Slots.Location9(1), pwrCell.Slots.Location9(2), 'g*');
plot(pwrCell.Slots.Location10(1), pwrCell.Slots.Location10(2), 'g*');
plot(pwrCell.Slots.Location11(1), pwrCell.Slots.Location11(2), 'g*');
plot(pwrCell.Slots.Location12(1), pwrCell.Slots.Location12(2), 'g*');
plot(pwrCell.Slots.Location13(1), pwrCell.Slots.Location13(2), 'g*');
plot(pwrCell.Slots.Location14(1), pwrCell.Slots.Location14(2), 'g*');
plot(pwrCell.Slots.Location15(1), pwrCell.Slots.Location15(2), 'g*');
plot(pwrCell.Slots.Location16(1), pwrCell.Slots.Location16(2), 'g*');
plot(pwrCell.Slots.Location17(1), pwrCell.Slots.Location17(2), 'g*');
plot(pwrCell.Slots.Location18(1), pwrCell.Slots.Location18(2), 'g*');
plot(pwrCell.Slots.Location19(1), pwrCell.Slots.Location19(2), 'g*');
plot(pwrCell.Slots.Location20(1), pwrCell.Slots.Location20(2), 'g*');
plot(pwrCell.Slots.Location21(1), pwrCell.Slots.Location21(2), 'g*');
plot(pwrCell.Slots.Location22(1), pwrCell.Slots.Location22(2), 'g*');
plot(pwrCell.Slots.Location23(1), pwrCell.Slots.Location23(2), 'g*');
plot(pwrCell.Slots.Location24(1), pwrCell.Slots.Location24(2), 'g*');
plot(pwrCell.Slots.Location25(1), pwrCell.Slots.Location25(2), 'g*');
plot(pwrCell.Slots.Location26(1), pwrCell.Slots.Location26(2), 'g*');
plot(pwrCell.Slots.Location27(1), pwrCell.Slots.Location27(2), 'g*');
plot(pwrCell.Slots.Location28(1), pwrCell.Slots.Location28(2), 'g*');