if image_alpha <= 1 {
	image_alpha += .02
	if image_alpha == 1 switch image_angle {
		case 0: instance_create_layer(x-320,y,"Instances",obj_atk_soos_sDriver) break
		case 90: with instance_create_layer(x,y+320,"Instances",obj_atk_soos_sDriver) image_angle=90 break
		case 180: with instance_create_layer(x+320,y,"Instances",obj_atk_soos_sDriver) image_angle=180 break
		case 270: with instance_create_layer(x,y-320,"Instances",obj_atk_soos_sDriver) image_angle=270 break
	}
}