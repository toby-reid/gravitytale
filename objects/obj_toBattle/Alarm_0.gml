/// @description set to soul
image_alpha = 1
if instance_exists(obj_dipper) obj_dipper.image_alpha = 0
if flashes < 3 {
	if flashes == 0 if !audio_is_playing(music) {
		audio_group_stop_all(Music)
	}
	audio_play_sound(sfx_click,0,false)
	alarm[1] = 5
}
else {
	audio_play_sound(sfx_toBattle,0,false)
	var d = [];
	switch dest {
		case 0: d = [49,450];  break
		case 1: d = [320,320]; break
		case 2: d = [320,240]; break
	}
	direction = point_direction(x,y,d[0],d[1])
	speed = distance_to_point(d[0],d[1])/20
	alarm[2] = 20
	if instance_exists(obj_toRoom) {obj_toRoom.alpha = 1; obj_toRoom.alarm[0] = 1}
	if instance_exists(obj_dipper) {obj_dipper.image_alpha = 1; obj_dipper.canMove = setMove}
	room_goto(goto)
}