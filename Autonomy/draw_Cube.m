function y=draw_Cube(x, y)
init_Constants

halflength = 13/2*in;


plot([x-halflength x-halflength x+halflength x+halflength x-halflength], [y+halflength y-halflength y-halflength y+halflength y+halflength], 'gre-');

