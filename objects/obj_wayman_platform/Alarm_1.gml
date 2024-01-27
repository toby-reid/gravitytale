/// @description wipe out
switch wipe {
	case 0://right
		image_blend = c_lime
		image_yscale = yscale
		if image_xscale > 0 {
			image_xscale -= xscale/20
			alarm[1] = 1
		}
		else instance_destroy()
		break
	case 1://up
		if image_yscale > 0 {
			image_yscale -= yscale/20
			y += yscale
			alarm[1] = 1
		}
		else instance_destroy()
		break
	case 2://left
		if image_xscale > 0 {
			image_xscale -= xscale/20
			x += xscale
			alarm[1] = 1
		}
		else instance_destroy()
		break
	case 3://down
		if image_yscale > 0 {
			image_yscale -= yscale/20
			alarm[1] = 1
		}
		else instance_destroy()
		break
}