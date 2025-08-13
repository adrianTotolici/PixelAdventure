function checkInventoryQuantity(inventory, name, quantity){
	for (var q = 0; q<array_length(inventory);q++){
		if (inventory[q].name == name && inventory[q].quantity >= quantity) {
			return true;
		}
	}
	return false;
}