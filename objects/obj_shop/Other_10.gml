/// @description Update inventory
inventory = []
for(var i = 0; i < 8; i++) 
	if global.inventory[i] != item.none 
		if global.inventory[i] != item.infinite_pizza
			if global.inventory[i] != item.refreshing_pizza
				inventory[array_length(inventory)] = global.inventory[i]
