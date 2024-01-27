switch stage {
	case 0: if instance_exists(obj_dipper) if obj_dipper.x >= 480 {
		camera_set_view_target(view_camera[0],noone)
		if obj_dipper.canMove alarm[0] = 60
		obj_dipper.canMove = false
		if alarm[0] == -1 camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+.5,0)
		if camera_get_view_x(view_camera[0]) >= 420 {stage++; alarm[0] = 60}
	} break
	case 1: if alarm[0] == -1 {
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = ["b e h o l d . . ."]
			charRate[0] = .1
			sound = [silence]
		}
		stage += .5
	} break
	case 1.5:
		if !instance_exists(obj_textbox) {
			if alarm[0] == 119 {audio_play_sound(sfx_click,0,false); audio_stop_sound(mus_wind)}
			obj_sign.image_blend = c_white
			if alarm[0] == -1 {
				with instance_create_layer(160,192,"Instances",obj_textbox) {
					text = ["the sascrotch!"]
					font = [fnt_sans_gui]
					sound = [tlk_stans]
					head = [spr_stans_head_neutral]
				}
				stage += .5
			}
		}
		else alarm[0] = 120
	break
	case 2: if !instance_exists(obj_textbox) {
		y = 150
		camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-1,0)
		if camera_get_view_x(view_camera[0]) <= 320 {
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"heh, heh...",
					"what's the matter, kid?",
					"don't worry, it's dormant...",
					"for now.",
					". . .",
					"who am i?",
					"just call me your grunkle #@993D3Dstans@ffffff!",
					"and up ahead, you'll meet my #@AC9E65brother@ffffff.",
					"he's always trying to \"test\" #newcomers with his dumb #puzzles.",
					"he's not harmless, but you #don't need to worry.&just play along.",
					"now let's get going, kid.&you'll want to meet him.",
					"and keep your hands off the #merchandise."
				]
				head = [
					spr_stans_head_sly,
					spr_stans_head_neutral,
					spr_stans_head_sly,
					spr_stans_head_joke,
					spr_stans_head_neutral,
					spr_stans_head_sly,
					spr_stans_head_neutral,
					spr_stans_head_sly,
					spr_stans_head_joke,
					spr_stans_head_neutral,
					spr_stans_head_neutral,
					spr_stans_head_sly
				]
				for(var i = 0; i < array_length(text); i++) {sound[i] = tlk_stans; font[i] = fnt_sans_gui}
			}
			obj_dipper.dir = 2
			inst_2CC0F754.y -= 20
			audio_play_sound(mus_sans,0,true)
			stage++
		}
	} break
	case 3: if !instance_exists(obj_textbox) {
		camera_set_view_target(view_camera[0],obj_dipper)
		image_speed = 1
		hspeed = 2.2
		obj_dipper.hspeed = 2
		obj_dipper.image_index = image_index
		if obj_dipper.x >= 1120 {
			image_speed = 0
			hspeed = 0
			obj_dipper.hspeed = 0
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"think we should test the #waters, kid?",
					"see how his latest project's #been going?",
					"here, put this on.&he won't try his tests on #something so nice.",
					"now, stan-d aside for a #moment.&here he comes."
				]
				head = [
					spr_stans_head_sly,
					spr_stans_head_joke,
					spr_stans_head_neutral,
					spr_stans_head_sly
				]
				sound = [tlk_stans,tlk_stans,tlk_stans,tlk_stans]
				font = [fnt_sans_gui,fnt_sans_gui,fnt_sans_gui,fnt_sans_gui]
			}
			stage++
		}
	} break
	case 4: if !instance_exists(obj_textbox) {
		obj_dipper.vspeed = -1
		obj_dipper.image_speed = .5
		obj_dipper.dir = 1
		if obj_dipper.y <= 100 {
			obj_dipper.vspeed = 0
			obj_dipper.dir = 3
			alarm[0] = 90
			stage++
		}
	} break
	case 5: if alarm[0] == -1 {
		audio_stop_all()
		if !(string_lower(global.player[player.name])=="lamby" and !global.player[player.mabel]) and !(string_lower(global.player[player.name])=="waddle" and global.player[player.mabel])
			audio_play_sound(sfx_click,0,false)
		if global.player[player.mabel] obj_dipper.sprite_index = spr_mabdles
		else obj_dipper.sprite_index = spr_diplamb
		alarm[0] = 30
		stage++
	} break
	case 6: if alarm[0] == -1 {
		if !audio_is_playing(mus_nyeh) audio_play_sound(mus_nyeh,0,true)
		obj_ford_ow_1.hspeed = -2
		if obj_ford_ow_1.x <= 1180 {
			obj_ford_ow_1.image_speed = 0
			obj_ford_ow_1.image_index = 0
			obj_ford_ow_1.hspeed = 0
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"hey, what's the word, sixer?",
					"CAN YOU EXPLAIN WHAT #YOU'RE DOING HERE, #STANS?",
					"YOU'RE SUPPOSED TO #BE HELPING WITH MY #RESEARCH.",
					"what, your special nerd games?&no thanks.",
					"THEY ARE NOT GAMES!&THEY'RE SOPHISTICATED #PUZZLES",
					"CREATED TO #HINDER AND #NEUTRALIZE THREATS!",
					"yeah, they've stopped so many #enemies.",
					"DO NOT TEST MY #PATIENCE, STANS!",
					"heh, \"test.\"&nice one, poindexter.",
					"SILENCE, BROTHER.&I SENSE A THREAT #HIDDEN IN PLAIN SIGHT.",
					"what, like a wolf in sheep's #clothing?",
					"DON'T BE AN IDIOT, #STANS.",
					"CLEARLY, THAT IS #MERELY A LAMB.",
					"NOW, COME.&WE MUST READY THE #TESTS."
				]
				if global.player[player.mabel] {
					text[9] = "SILENCE, BROTHER.&NOW IS NOT THE TIME."
					text[10] = "when will it be time?&when pigs fly?"
					text[12] = "CLEARLY, THIS ONE #IS WELL GROUNDED."
				}
				head = [
					spr_stans_head_neutral,
					spr_ford_head_neutral,
					spr_ford_head_mad,
					spr_stans_head_sly,
					spr_ford_head_mad,
					spr_ford_head_mad,
					spr_stans_head_sly,
					spr_ford_head_mad,
					spr_stans_head_joke,
					spr_ford_head_neutral,
					spr_stans_head_sly,
					spr_ford_head_mad,
					spr_ford_head_bashful,
					spr_ford_head_neutral
				]
				for(var i = 0; i < array_length(text); i++) {
					var char = string_copy(text[i],1,1)
					if string_lower(char) != char {font[i] = fnt_papyrus_gui; sound[i] = tlk_ford}
					else {font[i] = fnt_sans_gui; sound[i] = tlk_stans}
				}
			}
			stage++
		}
	} break
	case 7: if !instance_exists(obj_textbox) {
		if instance_exists(obj_ford_ow_1) {
			obj_ford_ow_1.sprite_index = spr_ford_r
			obj_ford_ow_1.image_speed = 1
			obj_ford_ow_1.hspeed = 2
			if obj_ford_ow_1.x >= 1300 {
				instance_destroy(obj_ford_ow_1)
				audio_stop_all()
				alarm[0] = 60
			}
		}
		else if alarm[0] == -1 {
			obj_dipper.canMove = true//Set by obj_textbox now
			if global.player[player.runActive] != 2 with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"he's gone.&you can take off that #beautiful costume now.",
					"what, deception?&no...&don't be ridiculous.",
					"i would never put you in a #dumb-looking outfit just to #ridicule you.",
					"though it was super easy to #lead you into it...&like a lamb to the slaughter.",
					"anyway, you heard my brother.&he's expecting you to follow #him.",
					"wouldn't wanna disappoint #him, eh?"
				]
				if global.player[player.mabel]
					text[3] = "though it was super easy to #lead you into it...&you're like a hog on ice."
				head = [
					spr_stans_head_neutral,
					spr_stans_head_content,
					spr_stans_head_sly,
					spr_stans_head_joke,
					spr_stans_head_sly,
					spr_stans_head_neutral
				]
				for(var i = 0; i < array_length(text); i++) {sound[i] = tlk_stans; font[i] = fnt_sans_gui}
			}
			else with instance_create_layer(160,192,"Instances",obj_textbox) {
				if (string_lower(global.player[player.name])=="lamby" and !global.player[player.mabel]) or (string_lower(global.player[player.name])=="waddle" and global.player[player.mabel]) {
					text = [
						"he's gone.&take that stupid costume off.",
						"...oh, i see.",
						"this is all a game to you, isn't it?",
						"killing is all fun and games to you, is it?",
						"well, listen to me, you #little demon.",
						"my brother isn't perfect, but #we've always worked through #our issues.",
						"If you lay one finger on him, #I will make you regret the day #you stepped foot in here.",
						"now, get going.&and don't you dare try #anything."
					]
					head = [
						spr_stans_head_neutral,
						spr_stans_head_content,
						spr_stans_head_hollowEye,
						spr_stans_head_neutral,
						spr_stans_head_content,
						spr_stans_head_neutral,
						spr_stans_head_hollowEye,
						spr_stans_head_neutral
					]
					charRate[6] = .25
					font[6] = fnt_basic_gui
				}
				else {
					text = [
						"he's gone.&we're alone for the time #being.",
						"look, kid, i know what you've #done.",
						"i know how many lives you've #ended.",
						"and i know you're not going #to stop now.",
						"but listen to me, you little #demon.",
						"my brother isn't perfect, but #we've always worked through #our issues.",
						"If you lay one finger on him, I #will make you regret the day #you stepped foot in here.",
						"now, get going.&and don't you dare try #anything."
					]
					head = [
						spr_stans_head_neutral,
						spr_stans_head_content,
						spr_stans_head_sly,
						spr_stans_head_neutral,
						spr_stans_head_hollowEye,
						spr_stans_head_neutral,
						spr_stans_head_hollowEye,
						spr_stans_head_neutral
					]
					charRate[6] = .25
					font[6] = fnt_basic_gui
				}
				font[array_length(text)] = 0
				for(var i = 0; i < array_length(text); i++) {
					sound[i] = tlk_stans
					if font[i] == 0 font[i] = fnt_sans_gui
				}
			}
			stage++
		}
	} break
	case 8:
		if instance_exists(obj_textbox) { if obj_textbox.page == 1 if obj_textbox.charCount == 0 {
			if string_lower(global.player[player.name]) == "mason" {obj_dipper.sprite_index = spr_dipstar; if !audio_is_playing(sfx_click) audio_play_sound(sfx_click,0,false)}
			else if string_lower(global.player[player.name]) != "lamby" {obj_dipper.sprite_index = spr_diphat; if !audio_is_playing(sfx_click) audio_play_sound(sfx_click,0,false)}
		}}
		else {
			global.stans = 1
			stage++
			audio_play_sound(mus_wind,0,true)
			with instance_create_layer(1220,60,"Instances",obj_save) {
				rmName = "Forest - Grunkle Stans"
				if global.player[player.mabel] text = "(Meeting such eccentric old men #excites your imagination.)"
				else text = "(Meeting such eccentric old men #fills you with dedication.)"
				music = mus_snowy
				music_nbs = mus_snowy
				loc = area.forest
			}
		}
	break
	case 9: 
		if !instance_exists(obj_textbox) sprite_index = spr_stans_d 
		if obj_dipper.x <= x-200 instance_destroy()
		break
}