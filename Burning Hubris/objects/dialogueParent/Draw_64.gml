if (showing_dialogue == true) {
    var text_x = 0;
    var text_y = 0;
    var height = 32;
    var border = 5;
    var padding = 10;
    

    draw_set_font(50);  


    height = string_height_ext(current_dialogue.message, 10, display_get_gui_width());


    if (sprite_exists(current_dialogue.sprite)) {
        if (sprite_get_height(current_dialogue.sprite) > height) {
            height = sprite_get_height(current_dialogue.sprite);
        }
    }

    height += padding * 2;


    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var y_base = gui_h - height - border * 2;

    if (sprite_exists(current_dialogue.sprite)) {
        text_x = sprite_get_width(current_dialogue.sprite) + padding * 2;
    }

 
    var text_width = display_get_gui_width() - text_x - padding * 2;
    var text_height = string_height_ext(current_dialogue.message, 10, text_width);  
    text_y = y_base + (height - text_height) / 2; 

   
    draw_set_color(c_blue);
    draw_rectangle(0, y_base, gui_w, gui_h, false);

    draw_set_color(c_black);
    draw_rectangle(border, y_base + border, gui_w - border, gui_h - border, false);

    draw_set_color(c_blue);
    draw_rectangle(border * 2, y_base + border * 2, gui_w - border * 2, gui_h - border * 2, false);


    if (sprite_exists(current_dialogue.sprite)) {
        draw_sprite(current_dialogue.sprite, 0, border * 3, y_base + border * 3);
    }


    draw_set_color(c_ltgray);
    draw_text_ext(text_x, text_y, current_dialogue.message, 10, text_width);
}
