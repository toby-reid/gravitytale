if stage == 0 if alarm[0] == -1 {
	if image_alpha < 1 image_alpha += .005
	else {
		audio_stop_sound(sfx_billLaugh)
		if alarm[1] == -1 alarm[1] = 60
	}
}