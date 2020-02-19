function [percentz] = traj_percentage(intTime,arrTstamps)
%TRAJ_PERCENTAGE Finds the percentage of the traj time that time is at
%(percentage of completion of the trajectory)
%   Takes time integer, takes timestamps array, returns percentage
% arrTstamps = arrTstamps(2:length(arrTstamps));
% time_total = arrTstamps(length(arrTstamps));
percentz = 0;
for pCount = 2:length(arrTstamps)
   if intTime < arrTstamps(pCount)
%        disp(pCount);
      if pCount > 2 && intTime ~= 0
%           disp(pCount);
         percentz = (pCount - 2) / (length(arrTstamps) - 1) * 100;
%          disp(intTime);
%          disp(percentz);
      end
      additionalPercentz = (intTime - arrTstamps(pCount - 1)) / (arrTstamps(pCount) - arrTstamps(pCount - 1)) * 100;
      disp(additionalPercentz)
      additionalPercentz = additionalPercentz * (1/(length(arrTstamps) - 1));
%       disp(additionalPercentz)
%       disp('time')
%       disp(intTime)
%       disp('%')
%       disp(additionalPercentz)
      percentz = percentz + additionalPercentz;
      break
   end
end

if intTime == arrTstamps(length(arrTstamps))
   percentz = 100; 
end