function [arrT] = traj_timestamps_v002(arrD,arrV)
%take array of distances between each segment point
%take array of velocities
%return array of timestamps
arrTs = arrD./arrV;

arrTs = cumsum(arrTs);
arrT    = [ 0 arrTs ];