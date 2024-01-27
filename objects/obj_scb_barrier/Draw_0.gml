if size > 0 {
	if instance_exists(obj_buttSwitch) if obj_buttSwitch.done {
		if size == 20 if !audio_is_playing(sfx_barrierClosing) audio_play_sound(sfx_barrierClosing,0,false)
		switch image_index {
			case 0: case 2:
				draw_sprite_part(sprite_index,image_index,0,0,size/2,20,x,y)
				draw_sprite_part(sprite_index,image_index,20-(size/2),0,size/2,20,x+20-(size/2),y)
				break
			case 1: draw_sprite_part(sprite_index,1,0,0,size,20,x,y) break
			case 3: draw_sprite_part(sprite_index,3,20-size,0,size,20,x+20-size,y) break
			case 4: case 6:
				draw_sprite_part(sprite_index,image_index,0,0,20,size/2,x,y)
				draw_sprite_part(sprite_index,image_index,0,20-(size/2),20,size/2,x,y+20-(size/2))
				break
			case 5: draw_sprite_part(sprite_index,5,0,0,20,size,x,y) break
			case 7: draw_sprite_part(sprite_index,7,0,20-size,20,size,x,y+20-size) break
		}
		size--
		if size == 0 {
			sprite_index = spr_scb_barrier_closed
			with instance_create_layer(x,y,"Instances",obj_scb_barrier_closed) image_index = other.image_index
			instance_destroy()
		}
		draw_sprite(spr_scb_barrier_closed,image_index,x,y)
	}
}
if size%20 == 0 draw_self()