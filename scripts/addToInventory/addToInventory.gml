// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addToInventory(inventory, item_type, item_name, quantityToAdd) {
    var found = false;

    for (var a = 0; a < array_length(inventory); a++) {
        if (inventory[a].type == item_type) {
            if (item_type == food || item_type == materials) {
                // Add for food & materials
                inventory[a].quantity += quantityToAdd;
            } else {
                // Replace for all other types (keep array slot)
                inventory[a] = ItemStruct(item_name, quantityToAdd, item_type);
            }
            found = true;
            break;
        }
    }

    // If not found, create a new item in the next free slot (append)
    if (!found) {
        var newItem = ItemStruct(item_name, quantityToAdd, item_type);
        array_push(inventory, newItem);
    }

    return inventory;
}
