if instance_exists(obj_dipper) if !audio_is_playing(mus_gravityfalls) if obj_dipper.canMove {
	if (obj_dipper.dir == 0 and place_meeting(x-2,y,obj_dipper)) or (obj_dipper.dir == 1 and place_meeting(x,y+2,obj_dipper)) {
		audio_play_sound(mus_gravityfalls,0,false)
		audio_sound_gain(mus_home,0,0)
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			text = [
				"(. . .)",
				"(It's...)",
				"(It's the Gravity Falls #theme...)",
				"(But it's all crappy and #sped up...)",
				"(I guess the original was too #close to a lawsuit, so #this is what you get...)",
				"(Also, does this mean Soos is... #watching...`#his own show...?)"
			]
		}
	}
}