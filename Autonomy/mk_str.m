function [mk_strNew] = mk_str(inputArg1)
%MK_STR Summary of this function goes here
%   Detailed explanation goes here
mk_strArr = char(inputArg1);
mk_strLength = length(inputArg1);
mk_strNew = '';
for iii = 1:mk_strLength
   if(mk_strArr(iii) == '_')
      mk_strNew = strcat(mk_strNew,'\_');
   else
       mk_strNew = strcat(mk_strNew,mk_strArr(iii));
   end
end
end