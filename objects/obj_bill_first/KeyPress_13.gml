/// @description summon Bill
if place_meeting(x,y,obj_dipper) if obj_dipper.canMove {
	obj_dipper.canMove = false
	audio_play_sound(sfx_billLaugh,0,false)
	image_speed = 1
}