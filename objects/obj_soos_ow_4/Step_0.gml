if instance_exists(obj_dipper) switch stage {
	case 0: if obj_dipper.x >= 100 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text = [
				"You see those switches on #the ground, dude?",
				"Those are old traps left #from...",
				". . .",
				"These puzzles are all #over this island.",
				"You gotta solve them to #keep moving.",
				"Here, lemme show you."
			]
			head = [
				spr_soos_face_happy,
				spr_soos_face_happy_side,
				spr_soos_face_neutral_side,
				spr_soos_face_happy,
				spr_soos_face_happy_closed,
				spr_soos_face_happy_side
			]
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
		}
		stage++
	} break
	case 1: if !instance_exists(obj_textbox_old) {
		speed = 1
		image_speed = 1
		if x >= 210 {
			stage++
			direction = 90
			sprite_index = spr_soos_u
		}
	} break
	case 2: if y <= 84 {
		direction = 180
		sprite_index = spr_soos_l
		if x <= 188 {
			stage++
			direction = 0
			sprite_index = spr_soos_r
		}
	} break
	case 3: if x >= 228 {
		direction = 90
		sprite_index = spr_soos_u
		if y <= 60 {
			stage++
			direction = 180
			sprite_index = spr_soos_l
		}
	} break
	case 4: if x <= 210 {
		speed = 0
		image_speed = 0
		image_index = 0
		sprite_index = spr_soos_d
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text = [
				"See, not too bad, eh?",
				"Be sure to step on #them in the right order, #by the way.",
				"Try to get familiar with #these systems.&I'll be up ahead."
			]
			head = [
				spr_soos_face_happy,
				spr_soos_face_happy_side,
				spr_soos_face_happy
			]
			sound = [tlk_soos,tlk_soos,tlk_soos]
		}
		stage++
	} break
	case 5: if !instance_exists(obj_textbox_old) {
		speed = 1
		image_speed = 1
		sprite_index = spr_soos_u
		direction = 90
		if y <= 40 {
			speed = 0
			image_speed = 0
			image_alpha -= .1
			if image_alpha == 0 {
				instance_destroy()
				global.soos = 4
				obj_dipper.canMove = true
			}
		}
	} break
}