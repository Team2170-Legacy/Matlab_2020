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

init_Trajectory_To_PwrPort_C;
init_Trajectory_To_PwrPort_C_Slow;

%***init_Trajectory_To_PwrPort_L_v002;
init_Trajectory_To_PwrPort_L_v003;

%init_Trajectory_To_PwrPort_R_v002;
init_Trajectory_To_PwrPort_R_v003;

init_Trajectory_CrossLine_P1;
init_Trajectory_CrossLine_P2;
init_Trajectory_CrossLine_P3;

init_Trajectory_To_Trench_C;
init_Trajectory_To_Trench_L;
init_Trajectory_To_Trench_R;

init_Trajectory_Backwards_Short;
init_Trajectory_Backwards_Long;

init_Trajectory_SBO_Part1;
init_Trajectory_SBO_Part2;


init_Trajectory_To_PwrPort_Trench_v002;
%-----------------------------------------------------------------------
%   This generates ALL trajectories
%
%all_Trajectories_String = {'To_PwrPort_C' 'To_PwrPort_R' 'To_PwrPort_L' 'To_Trench_C' 'To_Trench_L' 'To_Trench_R' 'Backwards_Short' 'Backwards_Long'};
%-----------------------------------------------------------------------
%all_Trajectories_String = {'SBO_Part1' 'SBO_Part2'};
% all_Trajectories_String = {'To_PwrPort_C_Slow'};
% all_Trajectories_String = {'To_PwrPort_C'};

all_Trajectories_String = {'To_PwrPort_Trench'};

% all_Trajectories_String = { 'Backwards_Long' };
% all_Trajectories_String = { 'Backwards_Short' };

% all_Trajectories_String = {'To_Trench_C'};

% all_Trajectories_String = {'To_PwrPort_R' 'To_PwrPort_L'};
% all_Trajectories_String = {'To_PwrPort_R'};
% all_Trajectories_String = {'To_PwrPort_L'};


% all_Trajectories_String = {'Test1'};
% all_Trajectories_String = {'Test2'};

%all_Trajectories_String = { 'CrossLine_P1' 'CrossLine_P2' 'CrossLine_P3'};
%all_Trajectories_String = {'To_PwrPort_L'};

%-----------------------------------------------------------------------


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
    
    make_dot_h_file_v004(trajString, ...
        Robot.wR_all, ...
        Robot.wL_all, ...
        all_t, Robot, ...
        t_auto_end, ...
        i_auto_end);
    
end




