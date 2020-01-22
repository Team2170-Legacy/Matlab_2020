function rounded = roundNumber(places, number)
number = (round(number * 10^places)/10^places);
 rounded = num2str(number);