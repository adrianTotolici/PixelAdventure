/// @description Draw main menu

for (var i = 0; i < array_length(menu_options); i++) {
    var text = menu_options[i];
    
    if (i == selected) {
        draw_set_color(c_yellow);
    } else {
        draw_set_color(c_white);
    }
    
    draw_text(x_pos, y_pos + i * 40, text);
}