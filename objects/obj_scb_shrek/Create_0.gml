if string_lower(global.player[player.name])=="shrek" or string_lower(global.player[player.name])=="fiona" or string_lower(global.player[player.name])=="donkey"
	text = ["OH, HELLO THERE!","HERE, HAVE A TREAT.&IT'S ON THE HOUSE.","(He gave you a bunch of fully-#grown onions.&(How kind of him.)"]
else text = ["WHAT...&ARE YE DOIN'...&IN ME SWAMP??","(The yeller threw some onions #at you to scare you off.)"]
dir = 2
for(var i = 0; i < array_length(global.inventory); i++)
	if global.inventory[i] >= item.onion16 and global.inventory[i] <= item.onion01
		instance_destroy()