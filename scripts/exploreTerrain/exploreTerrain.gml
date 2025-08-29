// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function exploreTerrain(terrain_data, pl_pos_x, pl_pos_y){
	
	// x * *
	// * & *
	// * * *
	if (pl_pos_x>0)  && (pl_pos_y>0){
		tile = terrain_data[pl_pos_x-1, pl_pos_y-1];
		if (!tile.explored){
			terrain_data[pl_pos_x-1, pl_pos_y-1].explored = true;
		}
	}
	
	// * * *
	// x & *
	// * * *
	if (pl_pos_x >0){
		tile = terrain_data[pl_pos_x-1, pl_pos_y];
		if (!tile.explored){
			terrain_data[pl_pos_x-1, pl_pos_y].explored = true;
		}
	}
	
	// * * *
	// * & *
	// x * *
	if (pl_pos_x > 0) && (pl_pos_y < (array_length(terrain_data[0]) - 1)) {
		tile = terrain_data[pl_pos_x-1, pl_pos_y+1];
		if (!tile.explored){
			terrain_data[pl_pos_x-1, pl_pos_y+1].explored = true;
		}
	}
	
	// * * *
	// * & *
	// * x *
	if (pl_pos_y < array_length(terrain_data[0]) - 1) {
		tile = terrain_data[pl_pos_x, pl_pos_y+1];
		if (!tile.explored){
			terrain_data[pl_pos_x, pl_pos_y+1].explored = true;
		}
	}
	
	// * * *
	// * & *
	// * * x
	if (pl_pos_x < array_length(terrain_data) - 1) && (pl_pos_y < array_length(terrain_data[0]) - 1) {
		tile = terrain_data[pl_pos_x+1, pl_pos_y+1];
		if (!tile.explored){
			terrain_data[pl_pos_x+1, pl_pos_y+1].explored = true;
		}
	}
	
	// * * *
	// * & x
	// * * *
	if (pl_pos_x < array_length(terrain_data) - 1) {
		tile = terrain_data[pl_pos_x+1, pl_pos_y];
		if (!tile.explored){
			terrain_data[pl_pos_x+1, pl_pos_y].explored = true;
		}
	}
	
	// * * x
	// * & *
	// * * *
	if (pl_pos_x < array_length(terrain_data) - 1) && (pl_pos_y > 0){
		tile = terrain_data[pl_pos_x+1, pl_pos_y-1];
		if (!tile.explored){
			terrain_data[pl_pos_x+1, pl_pos_y-1].explored = true;
		}
	}
	
	// * x *
	// * & *
	// * * *
	if (pl_pos_y > 0){
		tile = terrain_data[pl_pos_x, pl_pos_y-1];
		if (!tile.explored){
			terrain_data[pl_pos_x, pl_pos_y-1].explored = true;
		}
	}
	
	tile = terrain_data[pl_pos_x, pl_pos_y];
	if (!tile.explored){
		terrain_data[pl_pos_x, pl_pos_y].explored = true;
	}
	
	checkMobsCurrentTile(tile);
}

function checkMobsCurrentTile(tile){
	var mob = tile.mob;
	if (mob != noone && mob.alive && mob.discovered){
		current_mob_hp = mob.hp;
		current_mob_name = mob.name;
		current_mob_atk = mob.atk;
	}else{
		current_mob_hp = 0;
		current_mob_name = noone;
		current_mob_atk = 0;
	}
}