/// @description create axes
with obj_dipper {
	if point_distance(x,y,870,370) >= 30 for(var i = 0; i < 9; i++) {
		with instance_create_layer(20*(floor(x/20)-2+irandom(4)),20*(floor(y/20)-2+irandom(4)),other.layer,obj_wendyne_groundChop) {
			if place_meeting(x,y,obj_collide) or place_meeting(x,y,obj_wendyne_groundChop)
				instance_destroy()
		}
	}
}
alarm[1] = 90 - 45*(x > 600)