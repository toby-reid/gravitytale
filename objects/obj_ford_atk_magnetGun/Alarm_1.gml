/// @description Stop firing
audio_stop_sound(sfx_barrierClosing)
alarm[2] = 20
with obj_soul {
	hspeed = 0
	vspeed = 0
	image_angle = other.angle
}