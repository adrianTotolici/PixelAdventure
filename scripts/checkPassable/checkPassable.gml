// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkPassable(tile_check){
	if (tile_check.name == "Water") {
		return false;
	}else{
		return true;
	}
}