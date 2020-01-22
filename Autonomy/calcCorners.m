function [Points] = calcCorners(pointx, pointy, distance, directionx, directiony) 
p1.x = pointx + distance*directionx;
p1.y = pointy;

p2.x = pointx;
p2.y = pointy + distance*directiony;

Points.x = [p1.x, p2.x];
Points.y = [p1.y, p2.y];