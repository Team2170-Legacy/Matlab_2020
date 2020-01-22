function [Points] = get_Curve(startangle, endangle, direction, n, radius, centerx, centery)
%%angle is angle of curve in radians
%direction is 1 or 0, 1 makes curve go forward
%n is number of points
%radius is radius of the arc
%centerx and centery are the center points of the arc

%figure
%hold on

interval = (endangle - startangle) / n;
for j=0:(n)
    x = cos(j*interval+startangle) * radius + centerx;
    y = sin(j*interval+startangle) * radius + centery;
    Points.x(j+1) = x;
    Points.y(j+1) = y;
    % plot(x,y);
end
if(direction == 1)
    Points.x = fliplr(Points.x);
    Points.y = fliplr(Points.y);
end
