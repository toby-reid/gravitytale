/// @description Seven.
with instance_create_layer(160,192,layer,obj_textbox_old) {
	text = [
		"Seven.",
		"That's how many people I was #able to train with the supplies #I was given.",
		"Six.",
		"That's how many people have #failed so far.",
		"Understand?",
		"You're the last one, so it's #the perfect opportunity to go #all-out.",
		"If it doesn't work this time, #it's all over.",
		". . ."
	]
	if (!global.enemy_killed[ENEMY.MANLY_DAN]) {
		text = array_concat(text,[
			"Oh, right...` the other six.",
			"Well, you see, it all started #long ago..."
		]);
	}
	for(var i = 0; i < array_length(text); i++) {
		sound[i] = tlk_wendy;
		charRate[i] = 4;
	}
}
stage++;