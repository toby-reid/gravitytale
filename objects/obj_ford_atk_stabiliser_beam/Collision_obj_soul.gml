/// @description Override if not destroy
if obj_soul.alarm[0] == -1 or at < 0 if image_blend==c_white or image_blend==c_lime or (image_blend==c_aqua and obj_soul.moving) or (image_blend==c_orange and !obj_soul.moving) {
	global.player.hp -= at
	if at >= 0 {
		obj_soul.alarm[0] = 45
		obj_soul.image_blend = c_silver
		audio_play_sound(sfx_damageTaken,0,false)
	} else {
		audio_play_sound(sfx_heal,0,false);
		if global.player.hp > global.player.maxHp {
			global.player.hp = global.player.maxHp
		}
	}
}