/// @description Summon Attack
with instance_create_layer(x,y,"Instances",obj_battleAttack) {
	vspeed = 3+global.enemy_killed[ENEMY.SHERIFF]
	sprite_index = spr_atk_merNote
	at = other.at
	image_index = irandom(2)
}
audio_play_sound(sfx_bell,0,false)
alarm[0] = 30-10*global.enemy_killed[ENEMY.SHERIFF]