if string_lower(global.player.name)=="shrek" or string_lower(global.player.name)=="fiona" or string_lower(global.player.name)=="donkey" {
	text = [
		"OH, HELLO THERE!",
		"HERE, HAVE A TREAT.&IT'S ON THE HOUSE.",
		"(He gave you a bunch of fully-#grown onions.&(How kind of him.)"
	];
	shrek = true;
} else {
	text = [
		"WHAT...&ARE YE DOIN'...&IN MY SWAMP??",
		"(The yeller threw some onions #at you to scare you off.)"
	];
	shrek = false;
}
dir = 2
for(var i = 0; i < array_length(global.inventory); i++) {
	if global.inventory[i] >= ITEM_NAME.ONION_1 and global.inventory[i] <= ITEM_NAME.ONION_MAX {
		instance_destroy()
	}
}