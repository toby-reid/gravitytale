if alarm[0] == -1 {
	image_xscale += .02
	image_yscale += .02
	image_alpha -= .1
	if image_alpha == 0 instance_destroy()
}

draw_self()