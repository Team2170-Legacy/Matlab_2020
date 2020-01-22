%
%   generate_all_Trajectories_v007.m
%
%   03/04/2018 v005    prepared for Hartford event 2018-04-06 to 2018-04-08
%
%   02/25/2019 v006     preparation to use for 2019 Deep Space season
%
%   03/01/2019 v007     Uses simulate_robot_v008.m, simpler version

make_movies = true
%make_movies = false

init_Constants
Init_Robot_v002
Init_Field_v003
% 03/07/2018    New trajectory names
init_Trajectories_v006

all_Trajectories_String = {
    
'Straight'
};

for traj = 1:length(all_Trajectories_String)
    cmd_str = [ 'all_Trajectories{traj} = ' all_Trajectories_String{traj} ';' ];
    eval(cmd_str);
end


for traj = 1:length(all_Trajectories)
    
    trajectory  = all_Trajectories{traj};
    trajString  = all_Trajectories_String{traj};
    
    simulate_robot_v008;
    
    t_final     = all_t(end);
    
    if make_movies
        %   copy movie file
        
        movie_file_name = [ 'Robot_Movie_' trajString '.mp4' ];
        del_command     = ['!del Movies\' movie_file_name];
        copy_command    = ['!copy Robot_Movie.mp4 ' 'Movies\' movie_file_name];
        eval(del_command);
        eval(copy_command);
        %close all;
    end
    
    make_dot_h_file_v003(trajString ,Robot.wR_all,Robot.wL_all,all_t,Robot,t_auto_end, i_auto_end)
    
end




