timer++
if timer <= 120 { if timer%15 == 0 {
	var dir = irandom(359)
	with instance_create_layer(320+lengthdir_x(300,dir),240+lengthdir_y(300,dir),layer,obj_battleAttack) {
		at = 3
		if global.player[player.nyarf] == 3 or global.player[player.nyarf] == 5 at = 2
		direction = point_direction(x,y,obj_soul.x,obj_soul.y)
		image_angle = direction
		speed = 8
		sprite_index = spr_wendyne_axe_btl
	}
	audio_play_sound(sfx_wendyne_axe_fire,0,false)
}}
else if timer >= 180 {
	alpha++
	if alpha == 1 {
		var rm = room
		if global.wendyne < 3 rm = ow_cav_3_chase1
		else if global.wendyne < 9 rm = ow_cav_9_chase2
		room_goto(rm)
	}
}