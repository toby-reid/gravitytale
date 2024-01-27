var music = noone
switch room {
	case ow_fst_1_meetStans: music = mus_wind break
	case ow_fst_22_caves: music = mus_snowy break
	
}
audio_play_sound(music,0,true)