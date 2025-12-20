if instance_exists(obj_dipper) switch stage {
	case 0: if obj_dipper.canMove if obj_dipper.y >= 250 {
		audio_stop_all()
		obj_dipper.canMove = false
		for(var i = 40; i <= 80; i += 20)
			with instance_create_layer(i,220,layer,obj_wendyne_groundChop) kill = false
		alarm[0] = 120
		stage++
	} break
	case 1: if alarm[0] == -1 {
		image_alpha += .005
		if image_alpha >= 1 {
			alarm[1] = 45
			obj_dipper.canMove = true
			barrier = instance_create_layer(40,220,layer,obj_collide)
			barrier.image_xscale = 3
			audio_play_sound(mus_run,0,true)
			stage++
			image_speed = 1
		}
	} break
	case 2:
		if index < 7 index += .25
		with obj_dipper if x > 320 if place_meeting(x,y,obj_toRoom)
			if global.wendy < 9 global.wendy = 9
		if obj_dipper.x >= xstart x = obj_dipper.x
		if x <= 260 { if y < ystart y += 2 }
		else if x > 285 and x <= 345 { if y > 80 y -= 2; else if y < 80 y += 2 }
		else if x > 345 { if y > -40 y -= 2 }
	break
}