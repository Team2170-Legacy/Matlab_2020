
trajectory = Test1; 


Ts			= Robot.Ts;			% [s]		Simulation sample time
% FRC_2018      tfinal      = all_t(end);
tfinal      = trajectory.t_final;
all_t       = (0:Ts:tfinal);
all_percentage = zeros(size(all_t));
all_percentage(1)   = 0;

for i=2:N
    t					= all_t(i);		% [s] get current simulation time
    all_percentage(i) = traj_percentage_v002(t,trajectory.tstamps, trajectory.sub);
    
%     disp(t)
    
end

figure
plot(all_t, all_percentage);
