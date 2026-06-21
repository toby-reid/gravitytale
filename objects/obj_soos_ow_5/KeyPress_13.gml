if instance_exists(obj_dipper) if obj_dipper.canMove if (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) {
	with instance_create_layer(160,192,"Instances",obj_textbox_old) {
		var slang = global.player.mabel ? "Hambone" : "dude";
		text = [
			"Hey, "+slang+", what are you #doing?",
			"I thought my instructions #were clear...",
			"All you have to do is #press the button on the #left.",
			"Just walk over it!"
		]
		head = [
			spr_soos_face_neutral,
			spr_soos_face_neutral_side,
			spr_soos_face_happy,
			spr_soos_face_happy_side
		]
		sound = [tlk_soos,tlk_soos,tlk_soos,tlk_soos]
	}
	if obj_dipper.dir == 2 sprite_index = spr_soos_r
}