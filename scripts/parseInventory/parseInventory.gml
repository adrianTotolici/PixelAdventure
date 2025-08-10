// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function parseInventory(inventory){
	var inv_string = [];
	if (array_length(inventory) > 0){
		for (var i=0; i<array_length(inventory); i++){
			array_push(inv_string, inventory[i].name + ": " + string(inventory[i].quantity));
		}
	}
	return inv_string;
}