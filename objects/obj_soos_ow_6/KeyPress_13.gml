if instance_exists(obj_dipper) if obj_dipper.canMove
	if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) {
		with instance_create_layer(160,192,"Instances",obj_textbox_old) {
			var slang = "dude";
			if (global.player.mabel) slang = "Girl" + slang;
			text = [
				"No, no, "+slang+"!&Fight the Dummy, not me!",
				"Oh, you're confused?",
				"I want you to try #ACTing on that Dummy.",
				"You can SPARE most #Enemies by ACTing, #you know...",
				"Now, why don't you #give it a try?",
				"Go over there and hit #@ffff00Z @ffffffto interact with #the Dummy."
			]
			head = [
				spr_soos_face_surprise,
				spr_soos_face_content,
				spr_soos_face_happy,
				spr_soos_face_happy_side,
				spr_soos_face_happy,
				spr_soos_face_happy_closed
			]
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
		}
		switch obj_dipper.dir {
			case 0: sprite_index = spr_soos_l break
			case 2: sprite_index = spr_soos_r break
		}
	}