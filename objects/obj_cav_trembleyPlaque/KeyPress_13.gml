if !instance_exists(obj_textbox) if instance_exists(obj_dipper) if obj_dipper.canMove if stage == 0 {
	if (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) {
		obj_dipper.canMove = false//so obj_textbox doesn't re-set it
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				"(It's a display of some #sort...)",
				"(Looks like there's an ancient #priceless document, here #underground...)",
				"(. . .)",
				"(It's... the de-pants-ipation #proclamation of 1837, signed #into law by the 8th-and-a-half",
				"president of the United States, #Sir Lord Quentin Trembley III, #esq.)",
				"(. . .)",
				"(Sounds like someone worth #killing.)"
			]
		}
		stage++
	}
}