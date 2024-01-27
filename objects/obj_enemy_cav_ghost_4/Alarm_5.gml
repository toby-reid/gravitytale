/// @description Spare
if spare {
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	else alarm[5] = 1
	instance_destroy(bubble)
	for(var i = 0; i < 4; i++) with paintings[i] {
		direction = dir
		speed = 16
	}
}