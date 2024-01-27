if instance_exists(obj_dipper) if obj_dipper.canMove if instance_exists(obj_buttSwitch) /*if !obj_buttSwitch.done*/ {
	if place_meeting(x-lengthdir_x(2,90*obj_dipper.dir),y-lengthdir_y(2,90*obj_dipper.dir),obj_dipper) {
		if tilemap_get(layer_tilemap_get_id("Tiles_1"),(x+lengthdir_x(20,90*obj_dipper.dir))/20,(y+lengthdir_y(20,90*obj_dipper.dir))/20) == 54
			if !place_meeting(x+lengthdir_x(20,90*obj_dipper.dir),y+lengthdir_y(20,90*obj_dipper.dir),obj_collide) {
				direction = 90*obj_dipper.dir
				speed = 2
				alarm[0] = 20/speed
				if place_meeting(x,y,obj_cav_boxDest) audio_play_sound(sfx_buttSwitch,0,false)
				if !audio_is_playing(sfx_moveRock) audio_play_sound(sfx_moveRock,0,true)
				/*if place_meeting(x,y,obj_cav_boxDest) {
					if playSound audio_play_sound(sfx_buttSwitch,0,false)
					image_index = 1
					done = true//formerly a "var" type, don't worry about the error
					for(var i = 0; i < instance_number(obj_cav_boxDest); i++) {
						with instance_find(obj_cav_boxDest,i) if !place_meeting(x,y,obj_cav_box) {other.done = false; break}
					}
					if done if !obj_buttSwitch.done {
						obj_buttSwitch.done = true
						global.buttSwitch[array_length(global.buttSwitch)] = room
					}
				}
				else if playSound audio_play_sound(sfx_click,0,false)*/
		}
	}
}