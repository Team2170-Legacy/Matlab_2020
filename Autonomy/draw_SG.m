SGTiltAngle = 22.5; %degrees

SGLength = 14*ft + 3/4*in; %corner of baseplate to other baseplate on same side
SGWidth = 13*ft + 3/2*in; %corner of baseplate to other baseplate on same side

SGHalfLength = SGLength/2;
SGHalfWidth = SGWidth/2;

halfFieldL = Field.L/2;
halfFieldW = Field.W/2;

origin.x = 0;
origin.y = 0;

originalAngle = atand(SGHalfWidth/SGHalfLength);
diagonal = sqrt(SGHalfLength ^ 2 + SGHalfWidth ^ 2);

%quadrant 1 new points
%original points
%SG = shield generator, Q = quadrant, 1-4, B or S is big/small radius
SGQ1B = [origin.x + SGHalfLength; origin.y + SGHalfWidth];
SGQ1S = [origin.x + SGHalfLength - 1*ft; origin.y + SGHalfWidth - 1*ft];
SGQ2B = [origin.x - SGHalfLength; origin.y + SGHalfWidth];
SGQ2S = [origin.x - SGHalfLength + 1*ft; origin.y + SGHalfWidth - 1*ft];
SGQ3B = [origin.x - SGHalfLength; origin.y - SGHalfWidth];
SGQ3S = [origin.x - SGHalfLength + 1*ft; origin.y - SGHalfWidth + 1*ft];
SGQ4B = [origin.x + SGHalfLength; origin.y - SGHalfWidth];
SGQ4S = [origin.x + SGHalfLength - 1*ft; origin.y - SGHalfWidth + 1*ft];

%rest of the points to show truss
%L and R here represent left and right side points in comparison to SGQ_B
SGQ1L = [origin.x + SGHalfLength - 1*ft; origin.y + SGHalfWidth];
SGQ1R = [origin.x + SGHalfLength; origin.y + SGHalfWidth - 1*ft];
SGQ2L = [origin.x - SGHalfLength; origin.y + SGHalfWidth - 1*ft];
SGQ2R = [origin.x - SGHalfLength + 1*ft; origin.y + SGHalfWidth];
SGQ3L = [origin.x - SGHalfLength + 1*ft; origin.y - SGHalfWidth];
SGQ3R = [origin.x - SGHalfLength; origin.y - SGHalfWidth + 1*ft];
SGQ4L = [origin.x + SGHalfLength; origin.y - SGHalfWidth + 1*ft];
SGQ4R = [origin.x + SGHalfLength - 1*ft; origin.y - SGHalfWidth];

hold on;
axis equal;

% plot(SGQ1B(1), SGQ1B(2), 'b*');
% plot(SGQ2B(1), SGQ2B(2), 'b*');
% plot(SGQ3B(1), SGQ3B(2), 'b*');
% plot(SGQ4B(1), SGQ4B(2), 'b*');



%matrix for rotations
SGRotMatrix = [cosd(SGTiltAngle) -1*sind(SGTiltAngle); sind(SGTiltAngle) cosd(SGTiltAngle)];

%multiply inside and outside corners
SGQ1B = SGRotMatrix * SGQ1B;
SGQ1S = SGRotMatrix * SGQ1S;
SGQ2B = SGRotMatrix * SGQ2B;
SGQ2S = SGRotMatrix * SGQ2S;
SGQ3B = SGRotMatrix * SGQ3B;
SGQ3S = SGRotMatrix * SGQ3S;
SGQ4B = SGRotMatrix * SGQ4B;
SGQ4S = SGRotMatrix * SGQ4S;

%multiply other truss corners
SGQ1L = SGRotMatrix * SGQ1L;
SGQ1R = SGRotMatrix * SGQ1R;
SGQ2L = SGRotMatrix * SGQ2L;
SGQ2R = SGRotMatrix * SGQ2R;
SGQ3L = SGRotMatrix * SGQ3L;
SGQ3R = SGRotMatrix * SGQ3R;
SGQ4L = SGRotMatrix * SGQ4L;
SGQ4R = SGRotMatrix * SGQ4R;

%plot inside and outside corners, everything is commented because the lines
%will later include these points
% plot(SGQ1B(1) + Field.L/2, SGQ1B(2) + Field.W/2, 'k*');
% plot(SGQ2B(1) + Field.L/2, SGQ2B(2) + Field.W/2, 'k*');
% plot(SGQ3B(1) + Field.L/2, SGQ3B(2) + Field.W/2, 'k*');
% plot(SGQ4B(1) + Field.L/2, SGQ4B(2) + Field.W/2, 'k*');
% plot(SGQ1S(1) + Field.L/2, SGQ1S(2) + Field.W/2, 'r*');
% plot(SGQ2S(1) + Field.L/2, SGQ2S(2) + Field.W/2, 'r*');
% plot(SGQ3S(1) + Field.L/2, SGQ3S(2) + Field.W/2, 'b*');
% plot(SGQ4S(1) + Field.L/2, SGQ4S(2) + Field.W/2, 'b*');

%transform inside and outside corners to center of field
SGQ1B(1) = SGQ1B(1) + halfFieldL;
SGQ2B(1) = SGQ2B(1) + halfFieldL;
SGQ3B(1) = SGQ3B(1) + halfFieldL;
SGQ4B(1) = SGQ4B(1) + halfFieldL;
SGQ1S(1) = SGQ1S(1) + halfFieldL;
SGQ2S(1) = SGQ2S(1) + halfFieldL;
SGQ3S(1) = SGQ3S(1) + halfFieldL;
SGQ4S(1) = SGQ4S(1) + halfFieldL;
%now the y values
SGQ1B(2) = SGQ1B(2) + halfFieldW;
SGQ2B(2) = SGQ2B(2) + halfFieldW;
SGQ3B(2) = SGQ3B(2) + halfFieldW;
SGQ4B(2) = SGQ4B(2) + halfFieldW;
SGQ1S(2) = SGQ1S(2) + halfFieldW;
SGQ2S(2) = SGQ2S(2) + halfFieldW;
SGQ3S(2) = SGQ3S(2) + halfFieldW;
SGQ4S(2) = SGQ4S(2) + halfFieldW;

%transform truss corners
SGQ1L(1) = SGQ1L(1) + halfFieldL;
SGQ1R(1) = SGQ1R(1) + halfFieldL;
SGQ2L(1) = SGQ2L(1) + halfFieldL;
SGQ2R(1) = SGQ2R(1) + halfFieldL;
SGQ3L(1) = SGQ3L(1) + halfFieldL;
SGQ3R(1) = SGQ3R(1) + halfFieldL;
SGQ4L(1) = SGQ4L(1) + halfFieldL;
SGQ4R(1) = SGQ4R(1) + halfFieldL;
%now y values
SGQ1L(2) = SGQ1L(2) + halfFieldW;
SGQ1R(2) = SGQ1R(2) + halfFieldW;
SGQ2L(2) = SGQ2L(2) + halfFieldW;
SGQ2R(2) = SGQ2R(2) + halfFieldW;
SGQ3L(2) = SGQ3L(2) + halfFieldW;
SGQ3R(2) = SGQ3R(2) + halfFieldW;
SGQ4L(2) = SGQ4L(2) + halfFieldW;
SGQ4R(2) = SGQ4R(2) + halfFieldW;

%plot line between rendevous boxes
plot([((SGQ1S(1) + SGQ4S(1))/2) ((SGQ2S(1) + SGQ3S(1))/2)], [((SGQ1S(2) + SGQ4S(2))/2) ((SGQ2S(2) + SGQ3S(2))/2)], 'k-');

%plot boundary lines
plot([((SGQ1S(1) + SGQ4S(1))/2) SGQ1S(1) SGQ2S(1) ((SGQ2S(1) + SGQ3S(1))/2)], [((SGQ1S(2) + SGQ4S(2))/2) SGQ1S(2) SGQ2S(2) ((SGQ2S(2) + SGQ3S(2))/2)], 'color', [1 0 0]);
plot([((SGQ2S(1) + SGQ3S(1))/2) SGQ3S(1) SGQ4S(1) ((SGQ1S(1) + SGQ4S(1))/2)], [((SGQ2S(2) + SGQ3S(2))/2) SGQ3S(2) SGQ4S(2) ((SGQ1S(2) + SGQ4S(2))/2)], 'color', [0 0 1]);

%plot trusses, color
plot([SGQ1B(1) SGQ1L(1) SGQ1S(1) SGQ1R(1) SGQ1B(1)], [SGQ1B(2) SGQ1L(2) SGQ1S(2) SGQ1R(2) SGQ1B(2)], 'k-'); %Q1
plot([SGQ2B(1) SGQ2L(1) SGQ2S(1) SGQ2R(1) SGQ2B(1)], [SGQ2B(2) SGQ2L(2) SGQ2S(2) SGQ2R(2) SGQ2B(2)], 'k-'); %Q2
plot([SGQ3B(1) SGQ3L(1) SGQ3S(1) SGQ3R(1) SGQ3B(1)], [SGQ3B(2) SGQ3L(2) SGQ3S(2) SGQ3R(2) SGQ3B(2)], 'k-'); %Q3
plot([SGQ4B(1) SGQ4L(1) SGQ4S(1) SGQ4R(1) SGQ4B(1)], [SGQ4B(2) SGQ4L(2) SGQ4S(2) SGQ4R(2) SGQ4B(2)], 'k-'); %Q4