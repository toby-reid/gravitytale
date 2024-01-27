if instance_exists(obj_dipper) switch stage {
	case 0: if obj_dipper.x >= 320 {
		obj_dipper.canMove = false
		with instance_create_layer(340,-6,layer,obj_ford_ow_1) direction = point_direction(x,y,obj_dipper.x-40,obj_dipper.y)
		with instance_create_layer(380,-8,layer,obj_ford_ow_1) direction = point_direction(x,y,obj_dipper.x-40,obj_dipper.y-3)
		with instance_create_layer(360,-10,layer,obj_ford_ow_1)direction = point_direction(x,y,obj_dipper.x-30,obj_dipper.y+2)
		obj_ford_ow_1.sprite_index = spr_wendy_axe_ow
		obj_ford_ow_1.speed = 4
		audio_stop_sound(mus_waterfall)
		audio_play_sound(sfx_wendyne_axe_fly,0,false)
		stage++
	} break
	case 1:
		for(var i = 0; i < 3; i++) with instance_find(obj_ford_ow_1,i) image_angle -= 12
		if instance_find(obj_ford_ow_1,0).y >= 300 {
			instance_destroy(obj_ford_ow_1)
			audio_group_load(Battle)
			stage++
		}
	break
	case 2:
		image_alpha += .01
		if image_alpha >= 1 {
			for(var i = 0; i < 3; i++) instance_create_layer(x+irandom(60)-15,y+irandom(40),layer,obj_ow_axe)
			alarm[0] = 60
			stage++
		}
	break
	case 3:
		obj_ow_axe.alarm[0] = 30
	break
	case 4:
		if obj_dipper.x >= 350 if obj_dipper.x <= 1240 x = obj_dipper.x-15
		image_speed = 1
		if obj_dipper.x >= 1270 {
			with obj_dipper while !place_meeting(x,y,obj_toRoom) x++
			global.wendyne = 3
			audio_group_unload(Battle)
			stage++
		}
	break
}