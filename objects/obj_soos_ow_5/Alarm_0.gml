///@desc start
if global.soos <= 4 {
	obj_dipper.canMove = false
	with instance_create_layer(160,192,"Instances",obj_textbox) {
		text = [
			"Here, this puzzle #shouldn't be too #challenging for you...",
			"As you can tell, there are #two buttons up ahead.",
			"Go ahead and step on the #button on the @74B285left@ffffff.",
			"I've labelled it for you, #so try not to get #confused."
		]
		head = [
			spr_soos_face_happy_side,
			spr_soos_face_happy_closed,
			spr_soos_face_happy,
			spr_soos_face_happy_side
		]
		sound = [tlk_soos,tlk_soos,tlk_soos,tlk_soos]
	}
	stage++
}