if image_alpha < 1 image_alpha += .02

if place_meeting(x+2*hspeed,y,obj_battleBox) {
	hspeed *= -1
	image_angle *= -1
	image_angle += 180
	if image_angle < 0 image_angle += 360
}
if place_meeting(x,y+2*vspeed,obj_battleBox) {
	vspeed *= -1
	image_angle += 180
	image_angle += 2*(90 + 180*(image_angle>180) - image_angle)
	if image_angle > 360 image_angle -= 360
}