if sprite_index == spr_ford_atk_stabiliser_charge {
	draw_sprite_ext(spr_ford_atk_stabiliser,6,x,y,image_xscale,image_yscale,image_angle,c_white,1)
	if image_index > 9 {
		image_speed = 0
		image_index = 0
		for(var i = x; i < 700 and i > -60; i += 60*image_xscale) with instance_create_layer(i,y,"Instances",obj_ford_atk_stabiliser_beam) {
			image_xscale = (15/2)*other.image_xscale
			image_yscale = other.image_yscale
			at = obj_ford_battle.at
			image_blend = other.image_blend
			other.beam[array_length(other.beam)] = id
		}
		audio_play_sound(sfx_gaster_fire,0,false)
		alarm[0] = 60
	}
}

draw_self()