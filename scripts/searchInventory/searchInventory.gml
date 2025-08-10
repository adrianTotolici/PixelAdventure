// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function searchInventory(inventory, item_type, quantityToAdd){
	for (var a=0; a<array_length(inventory); a++){
		if (item_type == inventory[a].name){
			quyantity = inventory[a].quantity;
			newItem = ItemStruct(inventory[a].name, quyantity+quantityToAdd);
			inventory[a] = newItem;
		}
		break;
	}
	
	if (array_length(inventory) == 0 ){
		newItem = ItemStruct(item_type, quantityToAdd);
		array_push(inventory, newItem);
	}
	
	return inventory;
}