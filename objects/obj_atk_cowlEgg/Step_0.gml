if y >= dest-10 {
	if speed > 0 speed -= .5
	if image_index < 9 image_speed = 1
	else {
		image_speed = 0
		image_alpha -= .02
		if image_alpha == 0 instance_destroy()
	}
}