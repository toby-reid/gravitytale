/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if y < 300 {
		y += 2
		if x > 340 x--
		else if x < 300 x++
	}
	else if image_index < 4 image_speed = 1
	else if image_speed > 0 {
		image_speed = 0
		instance_create_layer(x - 5 + 5*image_xscale/2,y-68,layer,obj_atk_barf)
	}
}

if harvested {
	if y < 300 y++
	index += .1
}
else {
	if global.stage[0] != 4 if y > ystart {
		y -= 2
		if x > 340 x++
		else if x < 300 x--
	}
	index += .25
}
if index >= 2 index -= 2