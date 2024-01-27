switch stage {
	case 0: if obj_dipper.x >= 140 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				"HELLO AGAIN, TEST #SUBJ-&ER, CHILD.",
				"IT HAS OCCURRED TO #ME THAT YOU MAY, IN #FACT, BE CHEATING.",
				"SO, THIS NEXT SET OF #PUZZLES WILL BE #IMPOSSIBLE!",
				"IF YOU MAKE IT PAST #THEM, I WILL KNOW FOR #SURE!",
				"BUT IF NOT, I WILL LAUGH #AT YOUR FAILURE!",
				"EITHER WAY, I WIN, CHILD!",
				"GOOD LUCK!"
			]
			head = [
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_mad
			]
			for(var i = 0; i < array_length(text); i++) {font[i] = fnt_papyrus_gui; sound[i] = tlk_ford}
		}
		audio_stop_all()
		audio_play_sound(mus_nyeh,0,true)
		stage++
	} break
	case 1: if !instance_exists(obj_textbox) {
		image_speed = 1
		hspeed = 2
		sprite_index = spr_ford_r
		if x >= 360 {
			obj_dipper.canMove = true
			with instance_create_layer(0,0,"Instances",obj_randBattle) loc = area.forest
			audio_stop_all()
			audio_play_sound(mus_snowy,0,true)
			global.stans = 8
			instance_destroy()
		}
	} break
}