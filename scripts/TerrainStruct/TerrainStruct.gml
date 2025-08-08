function TerrainStruct(_sprite, _name, _msg, _explored, _res){
	return {
		sprite: _sprite,
		name: _name,
		msg: rand_mesg(_name),
		explored: _explored,
		resource: rand_resources(_name)
	};
}

function rand_mesg(name){
	grass_msg = ["You have steped on grass.", "Grass is green here.", "Poor grass."];
	water_msg = ["This is cold, BRRR!!", "Water, nothing to sea.", "Well, now i ruined my boots."];  
	
	if (name == "Grass"){
		var index = irandom(array_length(grass_msg)-1);
		return grass_msg[index];
	}else if (name == "Water"){
		var index = irandom(array_length(water_msg)-1);
		return water_msg[index];
	}
	return "N/A !!"
}

function rand_resources(name){
	water_res_procent = 10;
	grass_res_procent = 20;
	
	grass_res = [spr_r_wheat];
	grass_res_name = ["Wheat"];
	
	water_res = [spr_r_fish];
	water_res_name = ["Fish"];
	
	if (name == "Grass"){
		res_index = irandom(array_length(grass_res)-1);
		res_number = irandom(5);
		res_available =irandom(100)
		if (res_available >= 0 && res_available <= grass_res_procent) {
			resource_data  = ResourcesStruct(grass_res_name[res_index], res_number, grass_res[res_index], false, true);
		}else{
		    resource_data  = ResourcesStruct(grass_res_name[res_index], res_number, grass_res[res_index], false, false);
		}
		
		return resource_data;
	}
	
	if (name == "Water"){
		res_index = irandom(array_length(water_res)-1);
		res_number = irandom(5);
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