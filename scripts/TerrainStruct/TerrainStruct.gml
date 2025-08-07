function TerrainStruct(_sprite, _name, _msg, _explored){
	return {
		sprite: _sprite,
		name: _name,
		msg: rand_mesg(_name),
		explored: _explored
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