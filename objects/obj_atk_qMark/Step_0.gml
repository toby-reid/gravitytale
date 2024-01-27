if image_alpha < 1 image_alpha += .025
else {
	if irandom(100) == 0 dir *= -1
	image_angle += dir
	if instance_number(obj_battleEnemy) == 1 {
		if x <= 260 or x >= 380 hspeed *= -1
		else if irandom(200) == 0 hspeed = random(.5)-.25
		if y <= 280 or y >= 360 vspeed *= -1
		else if irandom(200) == 0 vspeed = random(.5)-.25
	}
}