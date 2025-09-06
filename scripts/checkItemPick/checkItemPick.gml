// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkItemPick(tile){
	var res = tile.resource;
	var building = tile.building;
	if (res.discoverd && res.available && res.quantity > 0) || (building != noone && building.resource != noone){
		return true;
	}else{
		return false;
	}
}