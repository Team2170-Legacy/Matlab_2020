%
%   generate_all_Trajectories_v007.m
%
%   03/04/2018 v005    prepared for Hartford event 2018-04-06 to 2018-04-08
%
%   02/25/2019 v006     preparation to use for 2019 Deep Space season
%
%   03/01/2019 v007     Uses simulate_robot_v008.m, simpler version
S
make_movies = true
%make_movies = false

init_Constants;
Init_Robot_v002;
Init_Field_v003;

% init_Trajectory_To_PwrPort_L;
init_Trajectory_To_PwrPort_L_v002;

% init_Trajectory_To_PwrPort_R;
init_Trajectory_To_PwrPort_R_v002;

init_Trajectory_To_PwrPort;

% init_Trajectory_To_Trench;
init_Trajectory_To_Trench_v002;

init_Trajectory_CrossLine_P1;
init_Trajectory_CrossLine_P2;
init_Trajectory_CrossLine_P3;
init_Trajectory_Test1;

all_Trajectories_String = {'To_PwrPort' 'To_PwrPort_R' 'To_PwrPort_L' 'To_Trench'};
% all_Trajectories_String = {'To_PwrPort_L'};

% all_Trajectories_String = {'To_Trench'};
% all_Trajectories_String = {'Test1'};

%all_Trajectories_String = { 'CrossLine_P1' 'CrossLine_P2' 'CrossLine_P3'};
%all_Trajectories_String = {'To_PwrPort_R'};

for traj = 1:length(all_Trajectories_String)
    cmd_str = [ 'all_Trajectories{traj} = ' all_Trajectories_String{traj} ';' ];
    eval(cmd_str);
end


for traj = 1:length(all_Trajectories)
    
    trajectory  = all_Trajectories{traj};
    trajString  = all_Trajectories_String{traj};
    
    if make_movies
        %   copy movie file
        
        movie_file_name = [ 'Robot_Movie_' trajString '.mp4' ];
        del_command     = ['!del ' movie_file_name];
        %copy_command    = ['!copy ' movie_file_name ' ' movie_file_name];
        eval(del_command);
        %eval(copy_command);
        %close all;
    end
    
%    simulate_robot_v006;
%    simulate_robot_v007;
    simulate_robot_v008;
    
    t_final     = all_t(end);
    
    make_dot_h_file_v003(trajString, ...
    Robot.wR_all, ...
    Robot.wL_all, ...
    all_t, Robot, ...
    t_auto_end, ...
    i_auto_end);
    
end




