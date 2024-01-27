/// @description here he comes!!
if stage == 1 {
	obj_ford_ow_1.vspeed = 10
	audio_play_sound(sfx_wendyne_axe_fly,0,false)
}
else if stage == 2 {
	audio_sound_pitch(mus_hippie,.75)
	with instance_create_layer(0,0,layer,obj_toBattle) {
		music = mus_hippie
		goto = btl_cav_17_trembley
	}
	stage++
}