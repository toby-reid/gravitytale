if stage == 0 {
	if (x>=480 and image_xscale==-1) or (x<=860 and image_xscale==1) {
		x += 320*image_xscale
		/*if !global.killed[enemy.soos] {
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				//randomize()
				text = [". . .","Da dada da da...",other.text[irandom(array_length(other.text)-1)]]
				sound = [tlk_soos,tlk_soos,tlk_soos]
				head = [spr_soos_face_happy,spr_soos_face_happy_side,spr_soos_face_happy]
			}
		}*/
		if !instance_exists(obj_billAgain) stage++
	}
	if alpha > 0 alpha -= .02
}
else if stage == 1 {
	if !instance_exists(obj_textbox) {
		if (x>=1280 and image_xscale==-1) or (x<=60 and image_xscale==1) {
			alpha += .025
			if alpha == 1 instance_destroy()
		}
		if (x<480 and image_xscale==-1) or (x>860 and image_xscale==1) x = 670+image_xscale*190
	}
	else if (x>=480 and image_xscale==-1) or (x<=860 and image_xscale==1) x += 320*image_xscale
}

draw_set_alpha(alpha)
draw_rectangle_color(0,0,640,480,0,0,0,0,0)
draw_set_alpha(1)