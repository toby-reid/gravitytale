/// @description have we hit a barrier or ice edge?
if tilemap_get(layer_tilemap_get_id("Tiles_1"),(x/20) + lengthdir_x(1,direction),(y/20) + lengthdir_y(1,direction)) == 54 and !place_meeting(x+lengthdir_x(20,direction),y+lengthdir_y(20,direction),obj_collide) {
	alarm[0] = 20/speed
	image_index = 0
}
else {
	speed = 0
	if !(obj_cav_box.speed != 0) audio_stop_sound(sfx_moveRock)
	if place_meeting(x,y,obj_cav_boxDest) {
		audio_play_sound(sfx_buttSwitch,0,false)
		if !obj_buttSwitch.done {
			obj_buttSwitch.done = true
			for(var i = 0; i < instance_number(obj_cav_boxDest); i++) {
				with instance_find(obj_cav_boxDest,i) if !place_meeting(x,y,obj_cav_box)
					obj_buttSwitch.done = false
			}
			if obj_buttSwitch.done {
				array_push(global.completedPuzzleRooms, room_get_name(room));
			}
		}
	}
	else audio_play_sound(sfx_sans_pound,0,false,.25)
}