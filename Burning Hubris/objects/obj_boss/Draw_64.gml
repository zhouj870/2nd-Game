draw_self();

//Health Bar
var bar_width = 100;
var bar_height = 10;
var health_ratio = hp/max_hp;
var bx = x - bar_width/2;
var by = y - bar_height/2;

draw_set_color(c_red);
draw_rectangle(bx, by, bx + bar_width, by + bar_height, false);

draw_set_color(c_lime);
draw_rectangle(bx, by, bx + (bar_width * health_ratio), by + bar_height, false);