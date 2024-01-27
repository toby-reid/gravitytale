///@desc Flashes
flashes++
if flashes < 5 {
	image_index++
	alarm[0] = 10
}
else {
	alarm[1] = 24
	audio_play_sound(sfx_alertAtk,0,false)
}