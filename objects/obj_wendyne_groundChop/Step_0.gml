if image_speed > 0 {
	if image_index >= image_number-1 {
		image_speed = 0
		var angle = irandom(60) + 60
		axe = instance_create_layer(x+10+lengthdir_x(120,angle),y+8+lengthdir_y(120,angle),layer,obj_ford_ow_1)
		with axe {
			sprite_index = spr_wendy_axe_ow
			image_index = image_number - 1
			image_xscale -= 2*(x > other.x)
			direction = point_direction(x,y,other.x+10,other.y+10)
			speed = 5
		}
		if !audio_is_playing(sfx_wendyne_axe_fly) audio_play_sound(sfx_wendyne_axe_fly,0,false)
	}
}
else {
	if place_meeting(x,y,axe) {
		if axe.speed != 0 {
			if !audio_is_playing(sfx_click) audio_play_sound(sfx_click,0,false)
			if kill alarm[0] = 30
		}
		axe.speed = 0
	}
	else axe.image_angle += -18 * axe.image_xscale
}