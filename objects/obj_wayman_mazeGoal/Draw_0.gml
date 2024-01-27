/*if variable_instance_exists(id,"child") {
	if abs(speed) == .16 change *= -1
	speed += change/100
	child.image_xscale = x-xstart
}*/

if done {
	obj_wayman_btl.timer--
	draw_self()
	image_xscale += .1
	image_yscale += .1
	image_alpha -= .05
	if image_xscale >= 3 {
		with obj_wayman_btl {
			timer = maxTime[stage]
			stageRepeating = false
		}
		instance_destroy()
	}
}
else {
	xscale += dir
	if abs(xscale) == 1 dir *= -1
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,image_yscale,image_angle,image_blend,image_alpha)
}