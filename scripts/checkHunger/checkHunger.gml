// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkHunger(inventory){
	for (var a=0; a<array_length(inventory); a++){
		if (inventory[a].type == food && inventory[a].quantity < 0){
			return true;
		}
	}
	return false;
}