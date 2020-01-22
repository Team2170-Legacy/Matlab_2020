function status = draw_Robot(Robot)
%
%	Draws robot shape in figure given robot position in 
%	Robot.x
%	Robot.y
%	Robot.theta
%
%	and additional robot size information

status = 1;

%	Calculate the 4 corners of the robot C1, C2, C3, C4
%	FWD Left, FWD Right, REAR Left, REAR Right in the driving direction

th		= Robot.theta;
x		= Robot.x;
y		= Robot.y;
W		= Robot.W;
L		= Robot.L;

C1_x	= x + L/2*cos(th)  - W/2*sin(th);	%
C1_y	= y + W/2*cos(th)  + L/2*sin(th);	%

C2_x	= x + L/2*cos(th)  + W/2*sin(th);	%
C2_y	= y - W/2*cos(th)  + L/2*sin(th);	%

C3_x	= x - L/2*cos(th)  - W/2*sin(th);	%
C3_y	= y + W/2*cos(th)  - L/2*sin(th);	%

C4_x	= x - L/2*cos(th)  + W/2*sin(th);	%
C4_y	= y - W/2*cos(th)  - L/2*sin(th);	%

% hold on

%	Plot robot corners
%	C1 - FWD Left using BLUE RING
%	C2 - FWD Right using RED RING
%	C3 - AFT Left using BLUE CROSS
%	C4 - FWD Left using RED CROSS

%plot(C1_x, C1_y, 'bo')
%plot(C2_x, C2_y, 'ro')
%plot(C3_x, C3_y, 'bx')
%plot(C4_x, C4_y, 'rx')

plot([C1_x C2_x], [C1_y C2_y], 'b:')
plot([C2_x C4_x], [C2_y C4_y], 'b')
plot([C4_x C3_x], [C4_y C3_y], 'b')
plot([C3_x C1_x], [C3_y C1_y], 'b')

N=4;
plot([x x+N*L*cos(th)], [y y+N*L*sin(th)], 'b--')
% hold off


