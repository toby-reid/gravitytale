if place_meeting(x,y,axe) if image_alpha == 1 {
	with instance_create_layer(other.x,other.y,layer,obj_toBattle) {
		flashes = 3
		music = mus_run
		goto = btl_cav_axeBarrage
		dest = 2
	}
	with obj_wendyne_groundChop if image_speed == 0 if kill instance_destroy()
}