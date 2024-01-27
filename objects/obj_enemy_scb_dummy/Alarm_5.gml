/// @description Spare
if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
image_alpha -= .05
alarm[5] = 1
if image_alpha == 0 instance_destroy()
instance_destroy(bubble)