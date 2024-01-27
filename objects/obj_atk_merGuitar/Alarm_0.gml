/// @description Create notes
var j = 20+10*irandom(1)
if j == 30 audio_play_sound(sfx_guitar,0,false)
else audio_play_sound(sfx_guitar,0,false,audio_sound_get_gain(sfx_guitar),.62)
for(var i = -1*j; i <= j; i += 20) with instance_create_layer(x,y,"Instances",obj_battleAttack) {
	direction = point_direction(x,y,obj_soul.x,obj_soul.y)+i
	speed = 3
	sprite_index = spr_atk_merNote
	image_index = irandom(2)
	at = other.at
}
alarm[0] = 120
if instance_number(obj_battleEnemy) == 1 alarm[0] = 60