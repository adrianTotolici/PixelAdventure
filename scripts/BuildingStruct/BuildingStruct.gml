// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BuildingStruct(_name){
	return {
		name: _name,
		resource: setResource(_name)
	};
}

function setResource(building_name){
	if (building_name == farm_plot){
		res_quantity = random(2);
		return ResourcesStruct(wheat, res_quantity, noone, true, true);
	}
	
	return noone;
}