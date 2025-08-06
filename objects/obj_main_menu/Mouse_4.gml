// Check if mouse is over START button
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mx > room_width/2 - 100 && mx < room_width/2 + 100 &&
    my > 200 && my < 250) {
    room_goto(rm_world);
}

if (mx > room_width/2 - 100 && mx < room_width/2 + 100 &&
    my > 300  && my < 350) {
		game_end();
}