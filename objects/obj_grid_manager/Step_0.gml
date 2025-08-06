// Countdown
if (cursor_timer > 0) {
    cursor_timer--;
}

// Only move if timer is 0
if (cursor_timer == 0) {
    var moved = false;

    if (keyboard_check(vk_left) && cursor_x > 0) {
        cursor_x--;
        moved = true;
    }
    if (keyboard_check(vk_right) && cursor_x < grid_cols - 1) {
        cursor_x++;
        moved = true;
    }
    if (keyboard_check(vk_up) && cursor_y > 0) {
        cursor_y--;
        moved = true;
    }
    if (keyboard_check(vk_down) && cursor_y < grid_rows - 1) {
        cursor_y++;
        moved = true;
    }

    if (moved) {
        cursor_timer = cursor_delay;
    }
	
}

if (keyboard_check(vk_space)) {
	scr_find_res(grid_data[cursor_x, cursor_y], 4);
}