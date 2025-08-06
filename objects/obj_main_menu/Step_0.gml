// Move selection
if (keyboard_check_pressed(vk_down)) selected += 1;
if (keyboard_check_pressed(vk_up)) selected -= 1;

selected = clamp(selected, 0, array_length(menu_options) - 1);

// Select option
if (keyboard_check_pressed(vk_enter)) {
    if (selected == 0) {
        room_goto(rm_world);
    } else if (selected == 1) {
        game_end();
    }
}
