function [percentz] = traj_percentage_v002(intTime,arrTstamps,arrDistances)
%TRAJ_PERCENTAGE Finds the percentage of the traj DISTANCE that time is at
%(percentage of completion of the trajectory)
%   Takes time integer, takes timestamps array, returns percentage
% arrTstamps = arrTstamps(2:length(arrTstamps));
% time_total = arrTstamps(length(arrTstamps));
percentz = 0;
arrDistances = [0 arrDistances];
for pCount = 2:length(arrTstamps)
   if intTime < arrTstamps(pCount)
       percentz = sum(arrDistances(1:pCount - 1)) / sum(arrDistances) * 100;
       additionalPercentz = (intTime - arrTstamps(pCount - 1)) / (arrTstamps(pCount) - arrTstamps(pCount - 1));
       additionalPercentz = additionalPercentz * (sum(arrDistances(pCount - 1:pCount)) - arrDistances(pCount - 1)) / sum(arrDistances) * 100;
       percentz = percentz + additionalPercentz;
       break
   end
end

if intTime == arrTstamps(length(arrTstamps))
   percentz = 100; 
end