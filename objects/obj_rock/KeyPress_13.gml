if x == xstart if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
		direction = 90*dir
		if !place_meeting(x+lengthdir_x(20,direction),y+lengthdir_y(20,direction),obj_collide) {
			speed = 1
			obj_dipper.canMove = false
			audio_play_sound(sfx_moveRock,0,true)
		}
	}
}