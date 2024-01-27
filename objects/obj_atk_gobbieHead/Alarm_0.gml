/// @desc get moving
if image_xscale > 0 direction = image_angle
else direction = 180-image_angle
speed = spd
with instance_create_layer(x,y,layer,obj_atk_gobbieNeck) {
	image_angle = other.direction
	spd = other.speed
}