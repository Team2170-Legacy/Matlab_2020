Rocket_line_start.x = 6;
Rocket_line_start.y = 0;
Rocket_line_end.x = Rocket_line_start.x;
Rocket_line_end.y = 18 * in;

plot([Rocket_line_start.x, Rocket_line_end.x] , [Rocket_line_start.y, Rocket_line_end.y] , 'red')



Target.x = Rocket_line_start.x;
Target.y = 0;
