/// @description wipe in
switch wipe {
	case 0://right
		image_yscale = yscale
		if image_xscale < xscale {
			image_xscale += xscale/20
			alarm[0] = 1
		}
		break
	case 1://up
		image_xscale = xscale
		if image_yscale < yscale {
			if image_yscale == 0 y += 20*yscale
			image_yscale += yscale/20
			y -= yscale
			alarm[0] = 1
		}
		break
	case 2://left
		image_yscale = yscale
		if image_xscale < xscale {
			if image_xscale == 0 x += 20*xscale
			image_xscale += xscale/20
			x -= xscale
			alarm[0] = 1
		}
		break
	case 3://down
		image_xscale = xscale
		if image_yscale < yscale {
			image_yscale += yscale/20
			alarm[0] = 1
		}
		break
}