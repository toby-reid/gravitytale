switch stage {
	case 0: if obj_dipper.y <= 420 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			var slang = global.player.mabel ? "Hambone" : "dude";
			text = [
				"Hey, @ffff00"+global.player.name+"@ffffff, you made it!",
				"After all this time, #I was beginning to think #you weren't coming...",
				"But you pushed through #the puzzles and got #back here.",
				"Well, welcome to my #humble abode...",
				"It's bigger on the inside, #I promise.",
				"Anyway, come in and make #yourself comfortable, #"+slang+".",
				"You'll be here for a--",
				". . .",
				"See you in a moment."
			]
			head = [
				spr_soos_face_happy,
				spr_soos_face_happy_side,
				spr_soos_face_happy_closed,
				spr_soos_face_content,
				spr_soos_face_happy_side,
				spr_soos_face_happy,
				spr_soos_face_happy_closed,
				spr_soos_face_surprise_side,
				spr_soos_face_happy
			]
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
		}
		audio_stop_all()
		audio_play_sound(mus_fallen,0,true)
		stage++
	} break
	case 1: if !instance_exists(obj_textbox_old) {
		direction = 90
		speed = 2
		image_speed = 1
		sprite_index = spr_soos_u
		if y <= 360 {
			/*direction = 180
			sprite_index = spr_soos_l
			if x <= 80 {
				direction = 90
				sprite_index = spr_soos_u*/
				stage++
			//}
		}
	} break
	case 2: if y <= 220 {
		obj_dipper.canMove = true
		audio_stop_sound(mus_fallen)
		audio_play_sound(mus_birds,0,true)
		global.soos = 16
		instance_destroy()
	} break
}