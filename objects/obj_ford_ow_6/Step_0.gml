switch stage {
	case 0: if obj_dipper.x >= 100 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				"WELL, I MUST SAY...",
				"YOU ARE MUCH MORE #INTELLIGENT #THAN YOU SEEM.",
				"YOU FINISHED THAT #PUZZLE FAR FASTER #THAN ANYONE ELSE!",
				"YOU ARE ALSO THE #FIRST TO HAVE TRIED #THE PUZZLE!",
				"BUT DO NOT GET #COCKY, CHILD!",
				"THIS NEXT PUZZLE IS #SURE TO STUMP YOU!",
				"BEHOLD...&SKIPPING PAST 5 OR #EVEN 6 SHAPES...",
				"THIS PUZZLE HAS 8 #SHAPES TO FIGURE #OUT!",
				"I WILL ENJOY YOUR LOOK #OF BEWILDERMENT!",
				"BUT I'M NOT HEARTLESS!",
				"IN FACT, LET ME #GIVE YOU A HINT!",
				"YOU CAN STAND ON #MULTIPLE SHAPES AT #ONCE!",
				"IT DOESN'T TRIGGER #THE FIRST SHAPE #AGAIN!",
				"NOW, WITH THAT #WISDOM, GO, AND #WIN!",
				"GOOD LUCK, CHILD!"
			]
			head = [
				spr_ford_head_bashful,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_bashful,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_neutral
			]
			for(var i = 0; i < array_length(text); i++) {font[i] = fnt_papyrus_gui; sound[i] = tlk_ford}
		}
		audio_stop_all()
		audio_play_sound(mus_nyeh,0,true)
		stage++
	} break
	case 1: if !instance_exists(obj_textbox) {
		if y < 120 {vspeed = 2; image_speed = 1; sprite_index = spr_ford_d}
		else {vspeed = 0; hspeed = 2; sprite_index = spr_ford_r; if x >= 320 stage++}
	} break
	case 2:
		if y < 140 {vspeed = 2; hspeed = 0; sprite_index = spr_ford_d}
		else {
			vspeed = 0
			hspeed = 2
			sprite_index = spr_ford_r
			if x >= 360 {
				obj_dipper.canMove = true
				audio_stop_all()
				audio_play_sound(mus_snowy,0,true)
				global.stans = 6
				instance_destroy()
			}
		}
	break
}