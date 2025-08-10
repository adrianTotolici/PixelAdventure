/// @description Player movement logic

var moveCost = 0.25;
var discoverCost = 0.5;
var pickCost = 0.2;

//checkFood
lose = checkLoose(inventory);

// Countdown
if (player_timer > 0) {
    player_timer--;
}

// Only move if timer is 0
if (player_timer == 0 && (!win || !loose)) {
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
		inventory = eatFood(inventory, moveCost);
    }
	exploreTerrain(terrain_tiles, player_pos_x, player_pos_y);
}

if (keyboard_check(vk_escape)) {
	 room_goto(rm_main_menu);
}

if (keyboard_check_pressed(vk_space)) {
	discoverRes(terrain_tiles, player_pos_x, player_pos_y);
	inventory = eatFood(inventory, discoverCost);
}

if (keyboard_check_pressed(ord("P"))){
	if (checkItemPick(terrain_tiles[player_pos_x][player_pos_y])){
		var tile = terrain_tiles[player_pos_x][player_pos_y];
		var res_name = tile.resource.name;
		if (res_name == "Wheat" || res_name == "Fish"){
			var quantity = tile.resource.quantity;
			inventory = searchInventory(inventory, "Food", quantity);
		}
		var sprite = tile.resource.sprite;
		terrain_tiles[player_pos_x][player_pos_y].resource = ResourcesStruct(res_name,0,sprite,true,false);
		inventory = eatFood(inventory, pickCost);
	}
}
