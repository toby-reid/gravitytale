if speed > 0 if point_distance(x,y,xstart,ystart) == 20 {
	speed = 0
	obj_dipper.canMove = true
	audio_stop_sound(sfx_moveRock)
	image_blend = c_silver
}