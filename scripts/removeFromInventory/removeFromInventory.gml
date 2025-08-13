function removeFromInventory(inventory, res_name, quantity){
	var found = false;
	
	for (var a = 0; a < array_length(inventory); a++) {
        if (inventory[a].name == res_name) {
            inventory[a].quantity -= quantity;
            found = true;
			if (inventory[a].quantity <= 0){
				inventory = array_remove_at(inventory,a);
			}
            break; // Stop searching once found
        }
    }

    // If not found, add as a new item
    if (!found) {
        var newItem = ItemStruct(item_type, quantityToAdd);
        array_push(inventory, newItem);
    }

    return inventory;
}

function array_remove_at(_array, _index) {
    var len = array_length(_array);
    if (_index < 0 || _index >= len) return _array; // invalid index

    var new_array = [];
    for (var i = 0; i < len; i++) {
        if (i != _index) {
            array_push(new_array, _array[i]);
        }
    }
    return new_array;
}