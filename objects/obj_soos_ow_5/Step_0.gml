switch stage {
	//0 not needed.
	case 1: if !instance_exists(obj_textbox_old) {
		speed = 1.5
		direction = 90
		sprite_index = spr_soos_u
		image_speed = 1
		if y <= 100 {
			direction = 180
			sprite_index = spr_soos_l
			stage++
		}
	} break
	case 2: if x <= 70 {
		direction = 90
		sprite_index = spr_soos_u
		if y <= 50 {
			speed = 0
			image_index = 0
			image_speed = 0
			sprite_index = spr_soos_d
			global.soos = 4.5
			stage++
			obj_dipper.canMove = true
		}
	} break
	case 3:
		if obj_buttSwitch.done {
			obj_dipper.canMove = false
			if tries >= 3 with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				var slang = global.player.mabel ? "Hambone" : "dude";
				text = [
					"There ya go, "+slang+"!",
					"Nicely done...",
					"Finally.",
					". . .",
					"Let's keep going."
				]
				head = [
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_contempt,
					spr_soos_face_neutral_side,
					spr_soos_face_happy
				]
			} else with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				var slang = global.player.mabel ? "Hambone" : "dude";
				text = [
					"Nice one, "+slang+"!",
					"You put out more #intellect than I first #thought!",
					"Er...",
					". . .",
					"Let's keep going."
				]
				head = [
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_surprise,
					spr_soos_face_neutral_side,
					spr_soos_face_happy
				]
			}
			with obj_textbox_old for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
			stage++
		}
		else if obj_buttSwitch.active == 0 {
			if alarm[1] == -1 {
				alarm[1] = 1
				tries++
				switch tries {
					case 1: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
						var slang = global.player.mabel ? "Hambone" : "dude";
						text = [
							"Uh...",
							"I thought I had explained #it plainly...",
							"Do you not know your left #from right?",
							"It's even labelled on the #ground...",
							"No worries, though, "+slang+".&Just hit that lever to #reset the puzzle."
						]
						head = [
							spr_soos_face_neutral,
							spr_soos_face_neutral_side,
							spr_soos_face_surprise_side,
							spr_soos_face_neutral_side,
							spr_soos_face_happy
						]
					} break
					case 2: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
						text = [
							"Did...",
							"Did you just make the #same mistake...&Again?",
							"It's clearly labelled...&See those @466B50green @ffffffarrows #on the ground...?",
							"It's not that difficult.&Now, hit that lever to #reset the puzzle."
						]
						head = [
							spr_soos_face_surprise,
							spr_soos_face_surprise,
							spr_soos_face_disappoint,
							spr_soos_face_neutral
						]
					} break
					case 3: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
						text = [
							"Oh, come on.",
							"Surely you're smarter #than that...",
							"I went through the #trouble of labelling it #and everything...",
							"Just press the button on #the @74B285left@ffffff, okay?",
							"I'm sure you know how to #reset the puzzle by now."
						]
						head = [
							spr_soos_face_contempt,
							spr_soos_face_contempt,
							spr_soos_face_disappoint_side,
							spr_soos_face_neutral,
							spr_soos_face_disappoint
						]
					} break
					default: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
						text = [
							". . .",
							". . .",
							"Try again."
						]
						head = [
							spr_soos_face_contempt,
							spr_soos_face_disappoint_side,
							spr_soos_face_disappoint
						]
					} break
				}
				if instance_exists(obj_textbox_old) with obj_textbox_old for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
			}
		}
		if !instance_exists(obj_textbox_old) sprite_index = spr_soos_d
	break
	case 4: if !instance_exists(obj_textbox_old) {
		speed = 1
		direction = 270
		image_speed = 1
		if y >= 100 {
			direction = 180
			sprite_index = spr_soos_l
			stage++
		}
	} break
	case 5: if x <= 30 {
		speed = 0
		image_speed = 0
		image_alpha -= .1
		if image_alpha == 0 {obj_dipper.canMove = true; global.soos = 5; instance_destroy()}
	} break
}