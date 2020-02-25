function [distances] = sub_traj_lengths(trajectory)

% Calculates the length of a trajectory

N   = length(trajectory.x);       % number of via points
distances   = zeros(1,N-1);       % reserve memory space for all distances and initialize to zero

for j=1:(N-1)
    dx              = trajectory.x(j+1) - trajectory.x(j);
    dy              = trajectory.y(j+1) - trajectory.y(j);
    distances(j)    = sqrt(dx^2 + dy^2);
end