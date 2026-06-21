switch stage {
	case 0: if obj_dipper.y <= 260 {
		obj_dipper.dir = 1
		obj_dipper.canMove = false
		sprite_index = spr_stans_d
		obj_ford_ow_1.sprite_index = spr_ford_d
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text = [
				"GREETINGS, CHILD...",
				"(DO CHILDREN STILL SAY #\"GREETINGS\" HERE...?)",
				"no, but go on...&i don't think they pay #attention anyway.",
				"SILENCE, STANS.&WE CANNOT AFFORD TO #LOSE ANY MORE TIME.",
				"af-ford...&i don't even have to try here, #do i?",
				"STANS!",
				"NOW, CHILD, OBSERVE...",
				"BEHIND ME IS THE FIRST #OF A LONG SERIES OF #CHALLENGING PUZZLES!",
				"EACH WILL BECOME #MORE DIFFICULT THAN #THE LAST!",
				"i mean...&they aren't really difficult to #begin with...",
				"CAN IT, STANS.",
				"BAH!&WE DON'T HAVE TIME #FOR THIS!",
				"JUST TRY THE PUZZLE, #KID. IT WILL NOT BE #DIFFICULT.",
				"WE WILL WAIT UP AHEAD #FOR YOU TO FINISH.",
				"we're rootin' for ya, kid."
			]
			head = [
				spr_ford_head_neutral,
				spr_ford_head_bashful,
				spr_stans_head_sly,
				spr_ford_head_mad,
				spr_stans_head_joke,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_stans_head_content,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_stans_head_neutral
			]
			for(var i = 0; i < array_length(text); i++) {
				if string_lower(text[i]) == text[i] {font[i] = fnt_sans_gui; sound[i] = tlk_stans}
				else {font[i] = fnt_papyrus_gui; sound[i] = tlk_ford}
			}
		}
		audio_stop_all()
		audio_play_sound(mus_nyeh,0,true)
		stage++
	} break
	case 1: if !instance_exists(obj_textbox_old) {
		obj_ford_ow_1.sprite_index = spr_ford_u
		obj_ford_ow_1.image_speed = 1
		obj_ford_ow_1.vspeed = -2
		if vspeed == 0 {
			sprite_index = spr_stans_u
			image_speed = 1
			vspeed = -2
		}
		if y <= 180 {
			vspeed = 0
			image_speed = 0
			image_index = 0
			if global.player.genocide == RUN.ACTIVE if alarm[0] == -1 {
				sprite_index = spr_stans_d
				image_speed = .5
				vspeed = 1
			}
		}
		else alarm[0] = 60
		if obj_ford_ow_1.y <= 100 {
			instance_destroy(obj_ford_ow_1)
			audio_stop_sound(mus_nyeh)
			vspeed = 0
			image_speed = 0
			image_index = 0
			if global.player.genocide == RUN.ACTIVE {
				with instance_create_layer(160,192,"Instances",obj_textbox_old) {
					text = [
						"but you know that's not true, #don't you?",
						"even though i warned you back #there, you're still coming?",
						"well, so be it.",
						"looks like i'll be watching you #more closely from here on #out."
					]
					head = [
						spr_stans_head_hollowEye,
						spr_stans_head_neutral,
						spr_stans_head_content,
						spr_stans_head_hollowEye
					]
					font = [fnt_sans_gui,fnt_sans_gui,fnt_sans_gui,fnt_sans_gui]
					sound = [tlk_stans,tlk_stans,tlk_stans,tlk_stans]
				}
			}
			stage++
		}
	} break
	case 2: if !instance_exists(obj_textbox_old) {
		vspeed = -1
		image_speed = .5
		if y <= 120 {
			if !audio_is_playing(mus_snowy)
				audio_play_sound(mus_snowy,0,true)
			global.stans = 2
			instance_destroy()
		}
	} break
}