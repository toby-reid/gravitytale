if image_xscale < 300 image_xscale += spd
else if speed == 0 {
	direction = image_angle
	speed = 2*spd
	if speed > 20 speed = 20
	alarm[0] = 360/spd
}