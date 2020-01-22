function status = draw_Trajectory(Trajectory)
t = plot(Trajectory.x, Trajectory.y,'c-o');
%set(t,'LineWidth',1.5);
set(t,'LineWidth',5);