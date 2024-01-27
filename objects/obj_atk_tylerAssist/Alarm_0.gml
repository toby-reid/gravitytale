/// @description Finish
if image_index == 1 {
	obj_enemy_manDan.hp = obj_enemy_manDan.maxhp
	audio_play_sound(sfx_heal,0,false)
}
else audio_play_sound(sfx_ding,0,false)
speed = 0
alarm[1] = 1