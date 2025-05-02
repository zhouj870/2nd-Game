//Health bar
draw_set_color(c_black);
draw_rectangle(20, 20, 220, 50, false);

draw_set_color(c_red);
var bar_width = 200 * (hp / max_hp);
draw_rectangle(20, 20, 20 + bar_width, 50, false);

draw_set_color(c_white);
draw_text(25, 25, "HP: " + string(hp) + " / " + string(max_hp));




// Fire gauge bar
draw_set_color(c_orange);
draw_rectangle(20, 60, 220, 90, false);

var gauge_width = 200 * (fireGauge / fireGaugeMax);
draw_set_color(c_red);
draw_rectangle(20, 60, 20 + gauge_width, 90, false);

draw_set_color(c_white);
draw_text(25, 65, "Fire Gauge: " + string(floor(fireGauge)) + "%");
