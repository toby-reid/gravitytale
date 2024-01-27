if image_xscale < 2 {
	image_xscale += .1
	image_yscale += .1
	image_alpha += .1
}
else {
	image_xscale += .05
	image_yscale += .05
	image_alpha -= .1
}
if image_alpha <= 0 instance_destroy()