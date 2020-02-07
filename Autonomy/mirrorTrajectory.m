function [mirroredTraj] = mirrorTrajectory(trajectory,Field)

mirroredTraj.x = Field.L - trajectory.x;
mirroredTraj.y = Field.W - trajectory.y;
end

