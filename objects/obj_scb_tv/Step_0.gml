if audio_is_playing(mus_gravityfalls) {
	image_index = 1
}
else {
	image_index = 0
	if audio_sound_get_gain(mus_home) == .95 obj_dipper.canMove = true
	if audio_sound_get_gain(mus_home) < 1 audio_sound_gain(mus_home,audio_sound_get_gain(mus_home)+.05,0)
}