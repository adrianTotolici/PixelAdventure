draw_set_font(fnt_main_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_gray);
//Start Button
draw_rectangle(room_width/2 - 100, 200, room_width/2 + 100, 250, false);
//Exit Button
draw_rectangle(room_width/2 - 100, 200, room_width/2 + 200, 350, false);


draw_set_color(c_white);
draw_text(room_width/2, 100, "Adventure Guy");
draw_text(room_width/2, 225, "START");
draw_text(room_width/2, 325, "EXIT");