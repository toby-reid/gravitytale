/// @description timer for the ol' 1
if stage == 3 {
	stage++
	audio_play_sound(sfx_click,0,false)
	alarm[1] = 120
}
else with obj_ford_battle {
	bubble = instance_create_layer(x+60,y,"Instances",obj_textBubble)
	with bubble {
		text = [
			". . .",
			"...WHAT.",
			"DO YOU \nMEAN TO \nTELL ME...",
			"THAT OF \nALL THE \nINFINITE \nOUTCOMES...",
			"I ROLLED \nA 1?",
			"GAUGH!",
			"WELL, CHILD, I SUPPOSE \nTHIS MEANS YOU'VE \nBESTED ME.",
			"I HEREBY \nSURRENDER \nINTO YOUR \nHANDS.",
			"(I BET \n@993D3DSTANS \n@000000WOULD \nHAVE \nGOTTEN A \nPERFECT \nROLL...)"
		]
		for(var i = 0; i < array_length(text); i++) {font[i] = fnt_papyrus_bubble; sound[i] = tlk_ford}
		image_index = 1
		charRate = [.2,.25]
		headid = -5
	}
	spare = true
	run = false
	obj_battleCore.text[0] = "Grunkle Ford lays down his #weapons of science."
}