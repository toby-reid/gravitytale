/// @description Create first Textbox
if prev with instance_create_layer(160,192,layer,obj_textbox_old) {//defeated before
	text = [
		"(Everything has gone black.)",
		"(You can't even see your hand #in front of your face.)",
		"(The only thing in sight is a #blindingly white smile...)",
		". . .",
		"(...Somehow, this all seems #familiar...)",
		"Oi, lad, what're ye doin' 'ere?",
		"Ye don't need me powers.&Ye can already use the portals #yerself...",
		". . .",
		"Ach, I see 'ow it is.&Ye just wanna try me challenges #again, eh?",
		"Right, then.&Shall we?"
	]
	charRate = [4,4,4]
}
else with instance_create_layer(160,192,layer,obj_textbox_old) {//first time encountering the Wayman
	text = [
		"(Everything has gone black.)",
		"(You can't even see your hand #in front of your face.)",
		"(The only thing in sight is a #blindingly white smile...)",
		"(You slowly reach out to touch #it...)",
		"Oi, whaddya think ye're doin' #there, lad?",
		"That's me gob ye're reachin' #for!",
		". . .",
		"What, ye're lost in this #darkness?",
		"Well, I 'ave just the cure, #lad!",
		"If ye can make it through me #a-maze-ing challenges, that is!",
		"Right, then.&Shall we?"
	]
	charRate = [4,4,4,4]
}
with obj_textbox_old {for(var i = 4; i < array_length(text); i++) if string_copy(text[i],1,1) != "(" {style[i] = 6; font[i] = fnt_bill_gui}}
//audio_play_sound(mus_danger,0,false)
stage++