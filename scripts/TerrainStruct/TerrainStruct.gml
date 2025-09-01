function TerrainStruct(_sprite, _name, _msg, _explored, _res){
	return {
		sprite: _sprite,
		name: _name,
		msg: rand_mesg(_name),
		explored: _explored,
		resource: rand_resources(_name),
		mob: rand_mob(_name)
	};
}

function rand_mesg(name){
	grass_msg = ["You have steped on grass.", "Grass is green here.", "Poor grass."];
	water_msg = ["This is cold, BRRR!!", "Water, nothing to sea.", "Well, now i ruined my boots."];
	mud_msg = ["Is this dirt ?", "Now my boots are dirty.", "This is slipery."];
	
	if (name == grass){
		var index = irandom(array_length(grass_msg)-1);
		return grass_msg[index];
	}else if (name == water){
		var index = irandom(array_length(water_msg)-1);
		return water_msg[index];
	}else if (name == mud){
		var index = irandom(array_length(mud_msg)-1);
		return water_msg[index];
	}
	return "N/A !!"
}

function rand_resources(name){
	water_res_procent = 10;
	grass_res_procent = 20;
	mud_res_procent = 5;
	
	grass_res = [spr_r_wheat, spr_r_forest, spr_r_stone];
	grass_res_name = [wheat, wood, rock];
	grass_res_max = [4, 5, 2];
	
	water_res = [spr_r_fish];
	water_res_name = [fish];
	water_res_max = [5];
	
	mud_res = [spr_r_stone, spr_r_mushrooms];
	mud_res_name = [rock, mushrooms];
	mud_res_max = [3, 4];
	
	if (name == grass){
		res_index = irandom(array_length(grass_res)-1);
		res_number = random_range(1, grass_res_max[res_index]);
		res_available =irandom(100);
		if (res_available >= 0 && res_available <= grass_res_procent) {
			resource_data  = ResourcesStruct(grass_res_name[res_index], res_number, grass_res[res_index], false, true);
		}else{
		    resource_data  = ResourcesStruct(grass_res_name[res_index], res_number, grass_res[res_index], false, false);
		}
		
		return resource_data;
	}
	
	if (name == water){
		res_index = irandom(array_length(water_res)-1);
		res_number = random_range(1, water_res_max[res_index]);
		res_available =irandom(100);
		if (res_available >= 0 && res_available <= water_res_procent) {
			resource_data  = ResourcesStruct(water_res_name[res_index], res_number, water_res[res_index], false, true);
		}else{
			resource_data  = ResourcesStruct(water_res_name[res_index], res_number, water_res[res_index], false, false);
		}
		
		return resource_data;
	}
	
	if (name == mud){
		res_index = irandom(array_length(mud_res)-1);
		res_number = random_range(1, mud_res_max[res_index]);
		res_available =irandom(100);
		if (res_available >= 0 && res_available <= mud_res_procent) {
			resource_data  = ResourcesStruct(mud_res_name[res_index], res_number, mud_res[res_index], false, true);
		}else{
			resource_data  = ResourcesStruct(mud_res_name[res_index], res_number, mud_res[res_index], false, false);
		}
		
		return resource_data;
	}
	
	return ResourcesStruct(grass_res_name[res_index], res_number, grass_res[res_index], false, false);
}

function rand_mob(name){
	grass_mob_proc = 20;
	water_mob_proc = 10;
	
	grass_mob = [spr_e_snake, spr_e_wolf];
	grass_mob_name = [snake, wolf];
	grass_mob_hp = [10, 20];
	grass_mob_atk = [2, 5];
	grass_mob_speed = [0.5, 1.2];
	
	water_mob = [spr_e_shark];
	water_mob_name = [shark];
	water_mob_hp = [8];
	water_mob_atk = [5];
	water_mob_speed = [1.5];
	
	if (name == grass){
		mob_index = irandom(array_length(grass_mob)-1);
		mob_availble = irandom(100);
		if (mob_availble >= 0 && mob_availble <= grass_mob_proc) {
			mob_data = MobStruct(grass_mob[mob_index], grass_mob_name[mob_index], grass_mob_hp[mob_index], grass_mob_atk[mob_index], grass_mob_speed[mob_index],false);
		}else{
			mob_data = MobStruct(grass_mob[mob_index], grass_mob_name[mob_index], 0, grass_mob_atk[mob_index], grass_mob_speed[mob_index], false);
		}
		
		return mob_data;
	}
	
	if (name == water){
		mob_index = irandom(array_length(water_mob)-1);
		mob_availble = irandom(100);
		if (mob_availble >= 0 && mob_availble <= water_mob_proc) {
			mob_data = MobStruct(water_mob[mob_index], water_mob_name[mob_index], water_mob_hp[mob_index], water_mob_atk[mob_index], water_mob_speed[mob_index],false);
		}else{
			mob_data = MobStruct(water_mob[mob_index], water_mob_name[mob_index], 0, water_mob_atk[mob_index], water_mob_speed[mob_index], false);
		}
		
		return mob_data;
	}
	
	return MobStruct(water_mob[0], water_mob_name[0], 0, water_mob_atk[0], water_mob_speed[0], false);
}