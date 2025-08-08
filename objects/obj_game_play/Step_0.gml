/// @description Player movement logic

// Countdown
if (player_timer > 0) {
    player_timer--;
}

// Only move if timer is 0
if (player_timer == 0 && !win) {
    var moved = false;

    if (keyboard_check(vk_left) && player_pos_x> 0 && checkPassable(terrain_tiles[player_pos_x-1][player_pos_y])) {
        player_pos_x--;
        moved = true;
    }
    if (keyboard_check(vk_right) && player_pos_x < grid_cols - 1 && checkPassable(terrain_tiles[player_pos_x+1][player_pos_y])) {
        player_pos_x++;
        moved = true;
    }
    if (keyboard_check(vk_up) && player_pos_y > 0 && checkPassable(terrain_tiles[player_pos_x][player_pos_y-1])) {
        player_pos_y--;
        moved = true;
    }
    if (keyboard_check(vk_down) && player_pos_y < grid_rows - 1 && checkPassable(terrain_tiles[player_pos_x][player_pos_y+1])) {
        player_pos_y++;
        moved = true;
    }

    if (moved) {
        player_timer = player_speed;
		win = checkWin(terrain_tiles[player_pos_x][player_pos_y]);
    }
	exploreTerrain(terrain_tiles, player_pos_x, player_pos_y);
}

if (keyboard_check(vk_escape)) {
	 room_goto(rm_main_menu);
}

if (keyboard_check(vk_space)) {
	discoverRes(terrain_tiles, player_pos_x, player_pos_y);
}
