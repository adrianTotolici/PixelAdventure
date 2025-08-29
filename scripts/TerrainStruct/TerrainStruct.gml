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
	
	if (name == grass){
		var index = irandom(array_length(grass_msg)-1);
		return grass_msg[index];
	}else if (name == water){
		var index = irandom(array_length(water_msg)-1);
		return water_msg[index];
	}
	return "N/A !!"
}

function rand_resources(name){
	water_res_procent = 10;
	grass_res_procent = 20;
	
	grass_res = [spr_r_wheat, spr_r_forest];
	grass_res_name = [wheat, wood];
	
	water_res = [spr_r_fish];
	water_res_name = [fish];
	
	if (name == grass){
		res_index = irandom(array_length(grass_res)-1);
		res_number = random_range(1, 5);
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
		res_number = random_range(1, 5);
		res_available =irandom(100);
		if (res_available >= 0 && res_available <= water_res_procent) {
			resource_data  = ResourcesStruct(water_res_name[res_index], res_number, water_res[res_index], false, true);
		}else{
			resource_data  = ResourcesStruct(water_res_name[res_index], res_number, water_res[res_index], false, false);
		}
		
		return resource_data;
	}
	
	return ResourcesStruct(grass_res_name[res_index], res_number, grass_res[res_index], false, false);
}

function rand_mob(name){
	forest_mob_proc = 10;
	grass_mob_proc = 20;
	
	grass_mob = [spr_e_snake];
	grass_mob_name = [snake];
	grass_mob_hp = [10];
	grass_mob_atk = [2];
	grass_mob_speed = [0.5];
	
	if (name == grass){
		mob_index = irandom(array_length(grass_mob)-1);
		mob_availble = irandom(100);
		if (mob_availble >= 0 && mob_availble <= grass_mob_proc) {
			mob_data = MobStruct(grass_mob[mob_index], grass_mob_name[mob_index], grass_mob_hp[mob_index], grass_mob_atk[mob_index], grass_mob_speed[mob_index],false);
		}else{
			mob_data = MobStruct(grass_mob[mob_index], grass_mob_name[mob_index], 0, grass_mob_atk[mob_index], grass_mob_speed[mob_index], false)
		}
		
		return mob_data;
	}
	
	return MobStruct(grass_mob[0], grass_mob_name[0], 0, grass_mob_atk[0], grass_mob_speed[0], false);
}