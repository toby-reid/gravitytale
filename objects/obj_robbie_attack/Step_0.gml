if alarm[0] == -1 {image_xscale += .3; image_yscale += .3}
if image_xscale >= 7 {
	image_alpha -= .05
	if image_alpha == 0 {
		image_alpha = 1
		image_xscale = 0
		image_yscale = 0
		alarm[0] = 20
	}
}