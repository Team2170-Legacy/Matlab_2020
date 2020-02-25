SG.TiltAngle = 22.5; %degrees

SG.Length = 14*ft + 3/4*in; %corner of baseplate to other baseplate on same side
SG.Width = 13*ft + 3/2*in; %corner of baseplate to other baseplate on same side

SG.HalfLength = SG.Length/2;
SG.HalfWidth = SG.Width/2;

SG.HalfField.L = Field.L/2;
SG.HalfField.W = Field.W/2;

origin.x = 0;
origin.y = 0;

originalAngle = atand(SG.HalfWidth/SG.HalfLength);
diagonal = sqrt(SG.HalfLength ^ 2 + SG.HalfWidth ^ 2);

%quadrant 1 new points
%original points
%SG = shield generator, Q = quadrant, 1-4, B or S is big/small radius
SG.Q1.B = [origin.x + SG.HalfLength; origin.y + SG.HalfWidth];
SG.Q1.S = [origin.x + SG.HalfLength - 1*ft; origin.y + SG.HalfWidth - 1*ft];
SG.Q2.B = [origin.x - SG.HalfLength; origin.y + SG.HalfWidth];
SG.Q2.S = [origin.x - SG.HalfLength + 1*ft; origin.y + SG.HalfWidth - 1*ft];
SG.Q3.B = [origin.x - SG.HalfLength; origin.y - SG.HalfWidth];
SG.Q3.S = [origin.x - SG.HalfLength + 1*ft; origin.y - SG.HalfWidth + 1*ft];
SG.Q4.B = [origin.x + SG.HalfLength; origin.y - SG.HalfWidth];
SG.Q4.S = [origin.x + SG.HalfLength - 1*ft; origin.y - SG.HalfWidth + 1*ft];

%rest of the points to show truss
%L and R here represent left and right side points in comparison to SGQ_B
SG.Q1.L = [origin.x + SG.HalfLength - 1*ft; origin.y + SG.HalfWidth];
SG.Q1.R = [origin.x + SG.HalfLength; origin.y + SG.HalfWidth - 1*ft];
SG.Q2.L = [origin.x - SG.HalfLength; origin.y + SG.HalfWidth - 1*ft];
SG.Q2.R = [origin.x - SG.HalfLength + 1*ft; origin.y + SG.HalfWidth];
SG.Q3.L = [origin.x - SG.HalfLength + 1*ft; origin.y - SG.HalfWidth];
SG.Q3.R = [origin.x - SG.HalfLength; origin.y - SG.HalfWidth + 1*ft];
SG.Q4.L = [origin.x + SG.HalfLength; origin.y - SG.HalfWidth + 1*ft];
SG.Q4.R = [origin.x + SG.HalfLength - 1*ft; origin.y - SG.HalfWidth];

hold on;
axis equal;

% plot(SG.Q1.B(1), SG.Q1.B(2), 'b*');
% plot(SG.Q2.B(1), SG.Q2.B(2), 'b*');
% plot(SG.Q3.B(1), SG.Q3.B(2), 'b*');
% plot(SG.Q4.B(1), SG.Q4.B(2), 'b*');



%matrix for rotations
SGRotMatrix = [cosd(SG.TiltAngle) -1*sind(SG.TiltAngle); sind(SG.TiltAngle) cosd(SG.TiltAngle)];

%multiply inside and outside corners
SG.Q1.B = SGRotMatrix * SG.Q1.B;
SG.Q1.S = SGRotMatrix * SG.Q1.S;
SG.Q2.B = SGRotMatrix * SG.Q2.B;
SG.Q2.S = SGRotMatrix * SG.Q2.S;
SG.Q3.B = SGRotMatrix * SG.Q3.B;
SG.Q3.S = SGRotMatrix * SG.Q3.S;
SG.Q4.B = SGRotMatrix * SG.Q4.B;
SG.Q4.S = SGRotMatrix * SG.Q4.S;

%multiply other truss corners
SG.Q1.L = SGRotMatrix * SG.Q1.L;
SG.Q1.R = SGRotMatrix * SG.Q1.R;
SG.Q2.L = SGRotMatrix * SG.Q2.L;
SG.Q2.R = SGRotMatrix * SG.Q2.R;
SG.Q3.L = SGRotMatrix * SG.Q3.L;
SG.Q3.R = SGRotMatrix * SG.Q3.R;
SG.Q4.L = SGRotMatrix * SG.Q4.L;
SG.Q4.R = SGRotMatrix * SG.Q4.R;

%plot inside and outside corners, everything is commented because the lines
%will later include these points
% plot(SG.Q1.B(1) + Field.L/2, SG.Q1.B(2) + Field.W/2, 'k*');
% plot(SG.Q2.B(1) + Field.L/2, SG.Q2.B(2) + Field.W/2, 'k*');
% plot(SG.Q3.B(1) + Field.L/2, SG.Q3.B(2) + Field.W/2, 'k*');
% plot(SG.Q4.B(1) + Field.L/2, SG.Q4.B(2) + Field.W/2, 'k*');
% plot(SG.Q1.S(1) + Field.L/2, SG.Q1.S(2) + Field.W/2, 'r*');
% plot(SG.Q2.S(1) + Field.L/2, SG.Q2.S(2) + Field.W/2, 'r*');
% plot(SG.Q3.S(1) + Field.L/2, SG.Q3.S(2) + Field.W/2, 'b*');
% plot(SG.Q4.S(1) + Field.L/2, SG.Q4.S(2) + Field.W/2, 'b*');

%transform inside and outside corners to center of field
SG.Q1.B(1) = SG.Q1.B(1) + SG.HalfField.L;
SG.Q2.B(1) = SG.Q2.B(1) + SG.HalfField.L;
SG.Q3.B(1) = SG.Q3.B(1) + SG.HalfField.L;
SG.Q4.B(1) = SG.Q4.B(1) + SG.HalfField.L;
SG.Q1.S(1) = SG.Q1.S(1) + SG.HalfField.L;
SG.Q2.S(1) = SG.Q2.S(1) + SG.HalfField.L;
SG.Q3.S(1) = SG.Q3.S(1) + SG.HalfField.L;
SG.Q4.S(1) = SG.Q4.S(1) + SG.HalfField.L;
%now the y values
SG.Q1.B(2) = SG.Q1.B(2) + SG.HalfField.W;
SG.Q2.B(2) = SG.Q2.B(2) + SG.HalfField.W;
SG.Q3.B(2) = SG.Q3.B(2) + SG.HalfField.W;
SG.Q4.B(2) = SG.Q4.B(2) + SG.HalfField.W;
SG.Q1.S(2) = SG.Q1.S(2) + SG.HalfField.W;
SG.Q2.S(2) = SG.Q2.S(2) + SG.HalfField.W;
SG.Q3.S(2) = SG.Q3.S(2) + SG.HalfField.W;
SG.Q4.S(2) = SG.Q4.S(2) + SG.HalfField.W;

%transform truss corners
SG.Q1.L(1) = SG.Q1.L(1) + SG.HalfField.L;
SG.Q1.R(1) = SG.Q1.R(1) + SG.HalfField.L;
SG.Q2.L(1) = SG.Q2.L(1) + SG.HalfField.L;
SG.Q2.R(1) = SG.Q2.R(1) + SG.HalfField.L;
SG.Q3.L(1) = SG.Q3.L(1) + SG.HalfField.L;
SG.Q3.R(1) = SG.Q3.R(1) + SG.HalfField.L;
SG.Q4.L(1) = SG.Q4.L(1) + SG.HalfField.L;
SG.Q4.R(1) = SG.Q4.R(1) + SG.HalfField.L;
%now y values
SG.Q1.L(2) = SG.Q1.L(2) + SG.HalfField.W;
SG.Q1.R(2) = SG.Q1.R(2) + SG.HalfField.W;
SG.Q2.L(2) = SG.Q2.L(2) + SG.HalfField.W;
SG.Q2.R(2) = SG.Q2.R(2) + SG.HalfField.W;
SG.Q3.L(2) = SG.Q3.L(2) + SG.HalfField.W;
SG.Q3.R(2) = SG.Q3.R(2) + SG.HalfField.W;
SG.Q4.L(2) = SG.Q4.L(2) + SG.HalfField.W;
SG.Q4.R(2) = SG.Q4.R(2) + SG.HalfField.W;

%plot line between rendevous boxes
plot([((SG.Q1.S(1) + SG.Q4.S(1))/2) ((SG.Q2.S(1) + SG.Q3.S(1))/2)], [((SG.Q1.S(2) + SG.Q4.S(2))/2) ((SG.Q2.S(2) + SG.Q3.S(2))/2)], 'k-');

%plot boundary lines
plot([((SG.Q1.S(1) + SG.Q4.S(1))/2) SG.Q1.S(1) SG.Q2.S(1) ((SG.Q2.S(1) + SG.Q3.S(1))/2)], [((SG.Q1.S(2) + SG.Q4.S(2))/2) SG.Q1.S(2) SG.Q2.S(2) ((SG.Q2.S(2) + SG.Q3.S(2))/2)], 'color', [1 0 0]);
plot([((SG.Q2.S(1) + SG.Q3.S(1))/2) SG.Q3.S(1) SG.Q4.S(1) ((SG.Q1.S(1) + SG.Q4.S(1))/2)], [((SG.Q2.S(2) + SG.Q3.S(2))/2) SG.Q3.S(2) SG.Q4.S(2) ((SG.Q1.S(2) + SG.Q4.S(2))/2)], 'color', [0 0 1]);

%plot trusses, color
plot([SG.Q1.B(1) SG.Q1.L(1) SG.Q1.S(1) SG.Q1.R(1) SG.Q1.B(1)], [SG.Q1.B(2) SG.Q1.L(2) SG.Q1.S(2) SG.Q1.R(2) SG.Q1.B(2)], 'k-'); %Q1
plot([SG.Q2.B(1) SG.Q2.L(1) SG.Q2.S(1) SG.Q2.R(1) SG.Q2.B(1)], [SG.Q2.B(2) SG.Q2.L(2) SG.Q2.S(2) SG.Q2.R(2) SG.Q2.B(2)], 'k-'); %Q2
plot([SG.Q3.B(1) SG.Q3.L(1) SG.Q3.S(1) SG.Q3.R(1) SG.Q3.B(1)], [SG.Q3.B(2) SG.Q3.L(2) SG.Q3.S(2) SG.Q3.R(2) SG.Q3.B(2)], 'k-'); %Q3
plot([SG.Q4.B(1) SG.Q4.L(1) SG.Q4.S(1) SG.Q4.R(1) SG.Q4.B(1)], [SG.Q4.B(2) SG.Q4.L(2) SG.Q4.S(2) SG.Q4.R(2) SG.Q4.B(2)], 'k-'); %Q4