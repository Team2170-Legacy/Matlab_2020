function [arrT] = traj_timestamps(arrD,arrV)
%TRAJ_TIMESTAMPS Summary of this function goes here
%   Detailed explanation goes here
uniqueNum = 1;

for tsCounter = 1:length(arrD) - 1
    if arrD(tsCounter) ~= arrD(tsCounter+1)
        uniqueNum = uniqueNum + 1;
    end
end
arrT = zeros(1,uniqueNum);
arrTcounter = 1;
arrTindex = 0;
for tsCounter = 1:length(arrD)-1
    if abs(arrD(tsCounter + 1) - arrD(tsCounter)) < 0.001 %arrD(tsCounter) ~= arrD(tsCounter + 1)
        if arrTcounter == 1 && arrTcounter < uniqueNum
            arrT(arrTcounter) = (arrD(tsCounter) *(tsCounter - arrTindex))/arrV(arrTcounter);
        else
            arrT(arrTcounter) = arrT(arrTcounter - 1) + arrD(tsCounter) * (tsCounter - arrTindex) / arrV(arrTcounter); 
%             arrV(uniqueNum);
        end
        arrTindex = tsCounter;
        arrTcounter = arrTcounter + 1;
    end
end
% arrT(uniqueNum) = arrTindex / arrV(uniqueNum);
arrT(uniqueNum) = arrD(length(arrD)) * (length(arrD) - arrTindex) / arrV(uniqueNum);
if uniqueNum > 1
    arrT(uniqueNum) = arrT(uniqueNum - 1) + arrT(uniqueNum);
end
%arrT(arrTcounter) = arrT(arrTcounter - 1) + arrD(tsCounter) * (tsCounter - arrTindex) / arrV(arrTcounter-1)