if image_index >= 3 or (alarm[1] > -1 and image_index > 0) {
	with obj_wayman_btl {
		if timer < maxTime[stage] timer = maxTime[stage]
	}
	audio_play_sound(sfx_damageDealt,0,false)
}