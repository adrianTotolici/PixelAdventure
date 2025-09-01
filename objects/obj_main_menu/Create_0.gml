/// @description Initialize Main menu
window_set_fullscreen(false);

x_pos_title = room_width/2 -180;
y_pos_title = 100;
title = "Pixel Adventure";

menu_options = ["Start", "Exit"];
x_pos = room_width/2 - 100;
y_pos = room_height/2 - 50;

version = "v0.2";
x_pos_ver = room_width - 100;
y_pos_ver = room_height- 100;

draw_set_font(fnt_main_menu);