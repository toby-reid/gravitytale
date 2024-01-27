function scr_create_item(iIndex, name, desc, response, heal, price) {
	// scr_create_item(item.name, "name", "description", "response", #heal)
	// Set heal to -1 to restore to FULL hp

	global.item_index[# iIndex, item_info.name] = name
	global.item_index[# iIndex, item_info.desc] = desc
	global.item_index[# iIndex, item_info.response] = response
	global.item_index[# iIndex, item_info.heal] = heal
	global.item_index[# iIndex, item_info.price] = price
}