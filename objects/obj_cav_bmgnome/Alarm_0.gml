with instance_create_layer(160,192,layer,obj_textbox_old) {
	text = [
		"(. . .)",
		"(...How odd.)",
		"(You could have sworn there was #something there in the grass...)",
		"(Something very pointy and #small.)",
		"(Wait...&(Something is rustling in the #grass ahead...)",
		"(Oh great, it's another one of #these things)"
	]
	for(var i = 0; i < array_length(text); i++) charRate[i] = 3
	if global.player.mabel {
		text[5] = "QUEEEEEEEEEEEEEEEEEEEEEEEEEEEEE#EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE#EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
		charRate[5] = 1
	}
}
stage++