if alarm[1] == -1 if alarm[2] == -1 {
	if image_alpha < 1 image_alpha += .1
	else image_speed = 1
}
if image_speed > 0 if image_index > 7 {
	image_speed = 0
	audio_play_sound(sfx_barrierClosing,0,false)
	audio_stop_sound(sfx_chargeUp)
	alarm[1] = 45
}
x = obj_soul.x + lengthdir_x(100,angle-90)
y = obj_soul.y + lengthdir_y(100,angle-90)