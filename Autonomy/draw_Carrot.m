function status = draw_Carrot(carrot)

c_color = [0.9100 0.4100 0.1700];
c = plot(carrot.x,carrot.y,'^');
set(c,'Color',c_color);
set(c,'LineWidth',1.5);