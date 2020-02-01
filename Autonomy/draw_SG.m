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

hold on;
axis equal;

% plot(SGQ1B(1), SGQ1B(2), 'b*');
% plot(SGQ2B(1), SGQ2B(2), 'b*');
% plot(SGQ3B(1), SGQ3B(2), 'b*');
% plot(SGQ4B(1), SGQ4B(2), 'b*');



%matrix for rotations
SGRotMatrix = [cosd(SGTiltAngle) -1*sind(SGTiltAngle); sind(SGTiltAngle) cosd(SGTiltAngle)];

%multiply
SGQ1B = SGRotMatrix * SGQ1B;
SGQ1S = SGRotMatrix * SGQ1S;
SGQ2B = SGRotMatrix * SGQ2B;
SGQ2S = SGRotMatrix * SGQ2S;
SGQ3B = SGRotMatrix * SGQ3B;
SGQ3S = SGRotMatrix * SGQ3S;
SGQ4B = SGRotMatrix * SGQ4B;
SGQ4S = SGRotMatrix * SGQ4S;

plot(SGQ1B(1) + Field.L/2, SGQ1B(2) + Field.W/2, 'r*');
plot(SGQ2B(1) + Field.L/2, SGQ2B(2) + Field.W/2, 'r*');
plot(SGQ3B(1) + Field.L/2, SGQ3B(2) + Field.W/2, 'b*');
plot(SGQ4B(1) + Field.L/2, SGQ4B(2) + Field.W/2, 'b*');
plot(SGQ1S(1) + Field.L/2, SGQ1S(2) + Field.W/2, 'k*');
plot(SGQ2S(1) + Field.L/2, SGQ2S(2) + Field.W/2, 'k*');
plot(SGQ3S(1) + Field.L/2, SGQ3S(2) + Field.W/2, 'k*');
plot(SGQ4S(1) + Field.L/2, SGQ4S(2) + Field.W/2, 'k*');

SGQ1B(1) = SGQ1B(1) + halfFieldL;
SGQ2B(1) = SGQ2B(1) + halfFieldL;
SGQ3B(1) = SGQ3B(1) + halfFieldL;
SGQ4B(1) = SGQ4B(1) + halfFieldL;
SGQ1S(1) = SGQ1S(1) + halfFieldL;
SGQ2S(1) = SGQ2S(1) + halfFieldL;
SGQ3S(1) = SGQ3S(1) + halfFieldL;
SGQ4S(1) = SGQ4S(1) + halfFieldL;

SGQ1B(2) = SGQ1B(2) + halfFieldW;
SGQ2B(2) = SGQ2B(2) + halfFieldW;
SGQ3B(2) = SGQ3B(2) + halfFieldW;
SGQ4B(2) = SGQ4B(2) + halfFieldW;
SGQ1S(2) = SGQ1S(2) + halfFieldW;
SGQ2S(2) = SGQ2S(2) + halfFieldW;
SGQ3S(2) = SGQ3S(2) + halfFieldW;
SGQ4S(2) = SGQ4S(2) + halfFieldW;

%[((SGQ1S(1) + SGQ4S(1))/2) ((SGQ2S(1) + SGQ3S(1))/2)]
%[((SGQ1S(2) + SGQ4S(2))/2) ((SGQ2S(2) + SGQ3S(2))/2)]
plot([((SGQ1S(1) + SGQ4S(1))/2) ((SGQ2S(1) + SGQ3S(1))/2)], [((SGQ1S(2) + SGQ4S(2))/2) ((SGQ2S(2) + SGQ3S(2))/2)], 'k-');

plot([SGQ1S(1) SGQ2S(1) SGQ3S(1) SGQ4S(1) SGQ1S(1)], [SGQ1S(2) SGQ2S(2) SGQ3S(2) SGQ4S(2) SGQ1S(2)], 'color', [0 0 0]);