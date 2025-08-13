// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addToInventory(inventory, item_type, quantityToAdd) {
    var found = false;

    for (var a = 0; a < array_length(inventory); a++) {
        if (inventory[a].name == item_type) {
            inventory[a].quantity += quantityToAdd;
            found = true;
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