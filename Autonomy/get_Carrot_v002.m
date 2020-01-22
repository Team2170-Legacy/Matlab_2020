function [carrot_location, forward_flag] = get_Carrot_v002(percentage, trajectory)

%   Step 1: calculate distances between each via point and store in new
%           vector (array) named distances

if percentage<0
    percentage =0;
elseif percentage>100
    percentage = 100;
end 

N   = length(trajectory.x);       % number of via points
distances   = zeros(N-1,1);       % reserve memory space for all distances and initialize to zero

for j=1:(N-1)
    dx              = trajectory.x(j+1) - trajectory.x(j);
    dy              = trajectory.y(j+1) - trajectory.y(j);
    distances(j)    = sqrt(dx^2 + dy^2);
    
    
end

cum_distance = [0 ; cumsum(distances)];
full_distance = sum(distances);
cum_percentage = cum_distance ./ full_distance*100;



spot = full_distance*percentage/100;
index = 1;

%find the segment the spot is in
for j=1:(N-1)
%    if (spot<=cum_distance(j+1))
    if spot<= ( cum_distance(j+1) + 10*eps )
        index = j;
        break;
    end
end


%percentage length of the segment that we are in
segment_percentage = cum_percentage(index+1)- cum_percentage(index);

%distance between carrot and first starting point in percent
absolute_segment_percentage = percentage - cum_percentage(index);



%relative percentage of segment
if(absolute_segment_percentage < eps)
    relative_segment_percentage = 0;
else
%OLD    relative_segment_percentage = segment_percentage/absolute_segment_percentage*100;
    relative_segment_percentage = absolute_segment_percentage/segment_percentage*100;
end


carrot_location.x = trajectory.x(index)+(trajectory.x(index+1)-trajectory.x(index))*relative_segment_percentage/100;
carrot_location.y = trajectory.y(index)+(trajectory.y(index+1)-trajectory.y(index))*relative_segment_percentage/100;


if  isfield(trajectory, 'Drive_Forward')
    forward_flag = trajectory.Drive_Forward(index);
else
    forward_flag = true;
end 

%point1_percent = cum_distance(index)/full_distance*100;
%point2_percent = cum_distance(index+1)/full_distance*100;
%percent_space = point2_percent - point1_percent;
%carrot_locpercent = (percentage-point1_percent)/percent_space;
% carrot_location.x = trajectory.x(index)+trajectory.x(index+1)*carrot_locpercent;
% carrot_location.y = trajectory.y(index)+trajectory.y(index+1)*carrot_locpercent;



