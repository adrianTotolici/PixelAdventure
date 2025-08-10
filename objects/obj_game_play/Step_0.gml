/// @description Player movement logic

var moveCost = 0.15;
var discoverCost = 0.1;
var pickCost = 0.05;
var hp_loos_huger = 0.5;

if (pl_health <= 0 ){
	lose = true;
}

// Countdown
if (player_timer > 0) {
    player_timer--;
}

// Only move if timer is 0
if (player_timer == 0 && (!win || !lose)) {
    var moved = false;

    if (keyboard_check(vk_left) && player_pos_x> 0 && checkPassable(terrain_tiles[player_pos_x-1][player_pos_y]) && !lose && !win) {
        player_pos_x--;
        moved = true;
    }
    if (keyboard_check(vk_right) && player_pos_x < grid_cols - 1 && checkPassable(terrain_tiles[player_pos_x+1][player_pos_y]) && !lose && !win) {
        player_pos_x++;
        moved = true;
    }
    if (keyboard_check(vk_up) && player_pos_y > 0 && checkPassable(terrain_tiles[player_pos_x][player_pos_y-1]) && !lose && !win) {
        player_pos_y--;
        moved = true;
    }
    if (keyboard_check(vk_down) && player_pos_y < grid_rows - 1 && checkPassable(terrain_tiles[player_pos_x][player_pos_y+1]) && !lose && !win) {
        player_pos_y++;
        moved = true;
    }

    if (moved && !lose && !win) {
        player_timer = player_speed;
		win = checkWin(terrain_tiles[player_pos_x][player_pos_y]);
		inventory = eatFood(inventory, moveCost, hunger);
		hunger = checkHunger(inventory);
		if (hunger) {
			pl_health = pl_health - hp_loos_huger;
		}
    }
	exploreTerrain(terrain_tiles, player_pos_x, player_pos_y);
}

if (keyboard_check(vk_escape)) {
	 room_goto(rm_main_menu);
}

if (keyboard_check_pressed(vk_space)) {
	discoverRes(terrain_tiles, player_pos_x, player_pos_y);
	inventory = eatFood(inventory, discoverCost, hunger);
	hunger = checkHunger(inventory);
	if (hunger) {
		pl_health = pl_health - hp_loos_huger;
	}
}

if (keyboard_check_pressed(ord("P"))){
	if (checkItemPick(terrain_tiles[player_pos_x][player_pos_y])){
		var tile = terrain_tiles[player_pos_x][player_pos_y];
		var res_name = tile.resource.name;
		if (res_name == "Wheat" || res_name == "Fish"){
			var quantity = tile.resource.quantity;
			inventory = searchInventory(inventory, "Food", quantity);
			if (pl_health>0 && pl_health<100){
				pl_health += hp_loos_huger;
			}
		}
		if (res_name == "Wood"){
			var quantity = tile.resource.quantity;
			inventory = searchInventory(inventory, "Materials", quantity);
		}
		
		var sprite = tile.resource.sprite;
		terrain_tiles[player_pos_x][player_pos_y].resource = ResourcesStruct(res_name,0,sprite,true,false);
		inventory = eatFood(inventory, pickCost, hunger);
		hunger = checkHunger(inventory);
		if (hunger) {
			pl_health = pl_health - hp_loos_huger;
		}
	}
}
