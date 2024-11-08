switch stage {
	case 0: if obj_dipper.y <= 520 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			var slang = global.player.mabel ? "CHILD" : "BOY";
			text = [
				"HELLO AGAIN, CHILD.",
				"DID YOU SEE THE #REFRESHMENTS I #LEFT BACK THERE?",
				"THAT'S GOURMET #WATER, YOU KNOW.",
				"AT LEAST, THAT'S WHAT #MY DEALER SAID.",
				"BUT REGARDLESS, WE #HAVE ARRIVED AT THE #SECOND CHALLENGING",
				"PUZZLE!",
				"DO NOT BE AFRAID #THOUGH, "+slang+"!",
				"IT IS THE SECOND #CHALLENGING PUZZLE,",
				"NOT THE SECOND #MOST CHALLENGING #PUZZLE!",
				"THIS TIME, INSTEAD OF 3 #SHAPES...```#THERE `ARE ``4.",
				"THEY ARE ALSO SPACED #OUT, SO YOU MUST SEARCH #FOR THEM!",
				"TURN THEM ALL INTO #CIRCLES TO PASS.",
				"IF YOU EVER GET STUCK, #YOU MAY CONTACT A #FRIEND.",
				"OTHERWISE, I WILL SEE #YOU AT THE NEXT #PUZZLE!"
			]
			head = [
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_bashful,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_bashful,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_bashful,
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
		vspeed = -2
		sprite_index = spr_ford_u
		image_speed = 1
		if y <= 360 {
			obj_dipper.canMove = true
			audio_stop_all()
			audio_play_sound(mus_snowy,0,true)
			global.stans = 5
			instance_destroy()
		}
	} break
}