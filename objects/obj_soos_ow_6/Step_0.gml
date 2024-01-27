switch stage {
	case 0: if instance_exists(obj_dipper) if obj_dipper.x <= 260 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				"Alright, dude, if you're #planning on staying alive, #you'll need to learn ",
				"to @FF7F27FIGHT@ffffff.",
				"If possible, always try #to @FF7F27ACT @ffffffon Enemies instead #of attacking.",
				"Sometimes, however, you #can't spare them, in #which case...",
				"How about that @ff7f27NYARF GUN #@ffffffin your pocket?&Use it as needed.",
				"Then, to defend yourself, #you'll need to know the #basics...",
				"Why don't you try ACTing #on that @993D3DDUMMY @ffffffover there?"
			]
			if global.player[player.mabel] text[4] = "Here's a @ff7f27GRAPPLING HOOK @fffffffrom #the gift shop at my work.&Use it only as needed."
			head = [
				spr_soos_face_happy,
				spr_soos_face_happy,
				spr_soos_face_happy_closed,
				spr_soos_face_happy_side,
				spr_soos_face_happy,
				spr_soos_face_happy_side,
				spr_soos_face_happy
			]
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
		}
		global.player[player.nyarf] = 1
		stage++
	} break
	case 1:
		if !instance_exists(obj_textbox) {
			speed = 1.5
			image_speed = 1
			direction = 180
			sprite_index = spr_soos_l
			if x <= 100 {
				direction = 90
				sprite_index = spr_soos_u
				stage++
			}
		}
		else if global.player[player.mabel] if obj_textbox.page == 4 if obj_textbox.charCount == 10 audio_play_sound(sfx_itemGet,0,false)
	break
	case 2: if y <= 40 {
		speed = 0
		image_speed = 0
		image_index = 0
		sprite_index = spr_soos_d
		obj_dipper.canMove = true
		stage++
	} break
	case 3://Increased by obj_scb_dummy
		if !instance_exists(obj_textbox) sprite_index = spr_soos_d
		global.soos = 5.5
	break
	case 4: if variable_global_exists("dummy") {
		switch global.dummy {
			case 0: with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"You didn't even try, #did you?",
					"You just walked in and #Spared the thing.",
					"I'll let it pass this #time, but be prepared for #real combat in the future.",
					"Anyway, we should get #going..."
				]
				head = [
					spr_soos_face_contempt,
					spr_soos_face_disappoint_side,
					spr_soos_face_neutral,
					spr_soos_face_neutral_side
				]
			} break
			case 1: with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"Wow...",
					"You actually fixed my #Wax Stans...",
					"That was really nice...&I guess I should give you #something, huh?",
					"How's 10 Stan Bucks #sound?",
					"I know it's not much, #but...",
					"Anyway, we should get #going."
				]
				head = [
					spr_soos_face_surprise,
					spr_soos_face_surprise_side,
					spr_soos_face_neutral_side,
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_happy
				]
				global.player[player.money] += 10
			} break
			case 2: case 3: case 5: case 6: with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"You...",
					"You ruined my Wax #Stans...",
					"Why would you do that?",
					"Did I do something?",
					". . .",
					"That was my only proud #possession, you know...",
					"Well, no use standing #around...",
					"Let's get going."
				]
				head = [
					spr_soos_face_surprise,
					spr_soos_face_surprise_side,
					spr_soos_face_sad_side,
					spr_soos_face_sad,
					spr_soos_face_sad_closed,
					spr_soos_face_sad,
					spr_soos_face_sad_closed,
					spr_soos_face_neutral
				]
				for(var i = 0; i < array_length(text); i++) charRate[i] = .25
			} break
			case 4: with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"Hey, uh...",
					"You all right there, #dude?",
					"You seem to be, uh...",
					". . .",
					"...attached to inanimate #objects.",
					"I mean, I'm not gonna #judge...",
					"Just, after your accident #and all, I wanna make #sure...",
					". . .",
					"You're ok?",
					"Alright then, let's get #going.."
				]
				head = [
					spr_soos_face_neutral_side,
					spr_soos_face_neutral,
					spr_soos_face_neutral_side,
					spr_soos_face_contempt,
					spr_soos_face_neutral,
					spr_soos_face_surprise,
					spr_soos_face_neutral_side,
					spr_soos_face_neutral,
					spr_soos_face_happy,
					spr_soos_face_happy_closed
				]
				charRate[3] = .2
				charRate[7] = .2
			} break
		}
		with obj_textbox for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
		stage++
	} break
	case 5: if !instance_exists(obj_textbox) {
		direction = 90
		speed = 1
		image_speed = 1
		sprite_index = spr_soos_u
		if y <= 20 {
			speed = 0
			image_speed = 0
			image_alpha -= .1
			if image_alpha == 0 {
				audio_play_sound(mus_ruins,0,true)
				global.soos = 6
				instance_destroy()
				obj_dipper.canMove = true
			}
		}
	} else obj_dipper.canMove = false break
}