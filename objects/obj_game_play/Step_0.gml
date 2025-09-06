/// @description Player movement logic

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
		pl_health = checkMobAttack(terrain_tiles[player_pos_x][player_pos_y], pl_health);
		if (hunger) {
			pl_health = pl_health - hp_loos_huger;
		}
    }
	exploreTerrain(terrain_tiles, player_pos_x, player_pos_y);
}

if (keyboard_check(vk_escape)) {
	 room_goto(rm_main_menu);
}

if (keyboard_check_pressed(ord("P"))){
	if (checkItemPick(terrain_tiles[player_pos_x][player_pos_y])){
		var tile = terrain_tiles[player_pos_x][player_pos_y];
		if (tile.building == noone){
			var res_name = tile.resource.name;
			if (res_name == wheat || res_name == fish || res_name == mushrooms){
				var quantity = tile.resource.quantity;
				inventory = addToInventory(inventory, food, food, quantity);
				if (pl_health>0 && pl_health<100){
					pl_health += hp_loos_huger;
				}
			}
			if (res_name == wood){
				var quantity = tile.resource.quantity;
				inventory = addToInventory(inventory, materials, materials, quantity);
			}
			if (res_name == rock){
				var quantity = tile.resource.quantity;
				inventory = addToInventory(inventory, materials, materials, quantity);
			}
		
			var sprite = tile.resource.sprite;
			terrain_tiles[player_pos_x][player_pos_y].resource = ResourcesStruct(res_name,0,sprite,true,false);
			inventory = eatFood(inventory, pickCost, hunger);
			hunger = checkHunger(inventory);
			if (hunger) {
				pl_health = pl_health - hp_loos_huger;
			}
		
			var mob = tile.mob;
			if (mob.discovered && mob.alive){
				pl_health = attack(mob.atk, pl_health);
			}
		}else{
			var res_name = tile.building.resource.name;
			if (res_name == wheat || res_name == fish || res_name == mushrooms){
				var quantity = tile.building.resource.quantity;
				inventory = addToInventory(inventory, food, food, quantity);
				if (pl_health>0 && pl_health<100){
					pl_health += hp_loos_huger;
				}
			}
		}
	}
}

if (keyboard_check_pressed(ord("B"))){
	build_open = !build_open;
}

if (keyboard_check_pressed(ord("R")) && build_open){
	var raft_recepies = getBuildRecepies(recepies, raft);
	if (raft_recepies != noone && checkInventoryQuantity(inventory, raft_recepies.res_name , raft_recepies.res_quantity)){
		addToInventory(inventory, raft_recepies.name, raft_recepies.name, 1);
		removeFromInventory(inventory, raft_recepies.res_name, raft_recepies.res_quantity, raft_recepies.res_name)
	}
}

if (keyboard_check_pressed(ord("C")) && build_open){
	var w_club_recepies = getBuildRecepies(recepies, woden_club);
	if (w_club_recepies != noone && checkInventoryQuantity(inventory, w_club_recepies.res_name , w_club_recepies.res_quantity)){
		removeFromInventory(inventory, w_club_recepies.res_name, w_club_recepies.res_quantity, weapon);
		if (! checkInventoryQuantity(inventory, weapon, 0)){
			pl_atk = pl_atk + wooden_club_dmg;
		}
		addToInventory(inventory, weapon, woden_club, 1);
	}
}

if (keyboard_check_pressed(ord("F")) && build_open){
	var tile = terrain_tiles[player_pos_x, player_pos_y];
	if (tile.name == grass && ! tile.mob.alive && !tile.resource.available){
		var farm_plot_recepies = getBuildRecepies(recepies, farm_plot);
		if (farm_plot_recepies != noone && checkInventoryQuantity(inventory, farm_plot_recepies.res_name, farm_plot_recepies.res_quantity)){
			buildStructures(tile, spr_b_farm_plot, farm_plot);
		}
	}
}

if (keyboard_check_pressed(ord("A"))){
	var tile = terrain_tiles[player_pos_x][player_pos_y];
	var mob = tile.mob;
	if (mob.discovered && mob.alive){
		var mobHp = attack(pl_atk, mob.hp);
		terrain_tiles[player_pos_x][player_pos_y].mob = MobStruct(mob.sprite, mob.name, mobHp, mob.atk, mob.spd, mob.discovered);
		pl_health = attack(mob.atk, pl_health);
	}
}