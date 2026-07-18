if obj_dipper.canMove if obj_dipper.dir == 1 if place_meeting(x,y+2,obj_dipper) {
	audio_play_sound(sfx_sans_pound,0,false)
	array_push(global.oneTimeInstances, id);
	event_user(0)
	alarm[0] = 30
	obj_dipper.canMove = false
}