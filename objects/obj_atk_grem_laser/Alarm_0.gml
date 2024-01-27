/// @description flash flash hundred yard dash
flash++
if flash == 16 {
	audio_play_sound(sfx_alertAtk,0,false)
	with instance_create_layer(x,y,layer,obj_atk_laser) {
		image_angle = other.dir
		spd = 20
		at = other.at
	}
}
else {
	if flash%2 == 0 audio_play_sound(sfx_atkAlert,0,false)
	alarm[0] = 2
}