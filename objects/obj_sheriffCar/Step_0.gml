switch stage {
	case 0: if obj_dipper.x >= 860 {
		obj_dipper.canMove = false
		image_speed = 1
		audio_stop_all()
		audio_sound_pitch(sfx_horn,.85)
		audio_play_sound(sfx_horn,0,false)
		alarm[0] = 300
		stage++
	} break
	case 1: if alarm[0] == -1 {
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			var slang = "city boy"
			if global.player[player.mabel] slang = "little missy"
			text = [
				"Whoa there, "+slang+".&That's the town up ahead.",
				"The name's Blubs.&Sheriff Daryl Blubs.&That there is Deputy Durland.",
				"WOOO!&I HIT THE HORN!&HONK HONK!",
				"Now, I can't have you just #runnin' around, causin' trouble #for the fine folk o' the Falls.",
				"So why don't you prove yourself #to us, right here, right now?",
				"Let's see if you really can #solve every problem you come #against, "+slang+".",
				"WOOO!&LET'S GO GET 'EM!!"
			]
		}
		audio_sound_pitch(sfx_horn,1)
		stage++
	} break
	case 2: if !instance_exists(obj_textbox) {
		instance_create_layer(x+80,y+20,layer,obj_ow_sheriff_deputy)
		with instance_create_layer(x+20,y+20,layer,obj_ow_sheriff_deputy) image_index = 1
		audio_play_sound(mus_dogbass,0,false)
		stage++
	} break
	case 3: if !instance_exists(obj_ow_sheriff_deputy) {
		audio_play_sound(mus_snowy,0,true)
		image_speed = 0
		image_index = 0
		obj_dipper.canMove = true
		stage++
	} break
}
if image_speed > 0 if image_index < 1 image_index++