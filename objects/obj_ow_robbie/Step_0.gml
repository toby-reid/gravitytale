switch stage {
	case 0: if obj_dipper.canMove if obj_dipper.x >= 220 {
		obj_dipper.canMove = false
		alarm[0] = 30
		stage++
	} break
	case 1: if alarm[0] == -1 {
		audio_stop_all()
		vspeed = -.1
		if y <= ystart-20 {
			vspeed = 0
			with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				text = global.player.mabel
					? [
						"hey kid",
						"wut u doin here",
						"im boutta start practic",
						"thes r edvancd songs kid&not 4 lil kids liek u",
						". . .",
						"cmon kid, go awy",
						". . .",
						"wel, as long as u @00ffffstay #perfectly still @fffffffor my @00ffffcyan #@ffffffatacks u wil b ok",
						"make sur u stay still"
					] : [
						"hey kid",
						"u just gunna walk right past my #stand without say hi",
						"u think ur better then me",
						"im lead gitarrist my band kid",
						". . .",
						"wut y u not sayin anythin",
						"ill tech u a lesson kid",
						"make sur u dont @00ffffstay perfectly #still @fffffffor my @00ffffcyan @ffffffatacks ok",
						"its no fun hurtin kids standin #still"
					];
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_robbie
			}
			stage++
		}
	} break
	case 2: if !instance_exists(obj_textbox_old) {
		with instance_create_layer(0,0,"Instances",obj_toBattle) {
			music = mus_strongerMonsters
			goto = btl_fst_12_robbie
		}
		stage++
	} break
	case 3: if !instance_exists(obj_toBattle) {
		if global.enemy_killed[ENEMY.ROBBIE] instance_destroy()
		else with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text = global.player.mabel
				? [
					"hey kid",
					"that wasnt so bad",
					"thx for lissenin me play",
					"ill cya l8r kid"
				] : [
					"u no wut squirt?",
					"ur not so bad",
					"thx for lissenin me play",
					"ill cya l8r kid"
				];
			sound = [tlk_robbie,tlk_robbie,tlk_robbie,tlk_robbie]
			other.stage++
		}
	} break
	case 4: if !instance_exists(obj_textbox_old) {
		vspeed = .1
		if y >= ystart+1 instance_destroy()
	} break
}