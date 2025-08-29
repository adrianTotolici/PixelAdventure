// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function eatFood(inventory, quantity, hunger){
	if (! hunger){
		for (var a=0; a<array_length(inventory); a++){
			if (food == inventory[a].type){
				av_quantity = inventory[a].quantity;
				newItem = ItemStruct(inventory[a].name, av_quantity-quantity, inventory[a].type);
				inventory[a] = newItem;
			}
			break;
		}
	}
	return inventory;
}