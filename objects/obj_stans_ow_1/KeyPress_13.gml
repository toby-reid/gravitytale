if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if (dir==0 and place_meeting(x-2,y,obj_dipper)) or (dir==1 and place_meeting(x,y+2,obj_dipper)) or (dir==2 and place_meeting(x+2,y,obj_dipper)) or (dir==3 and place_meeting(x,y-2,obj_dipper)) {
		if global.player.genocide != RUN.ACTIVE {
			with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				text = [
					"hey, let's get a move on.",
					"no, no \"buts\" except yours #leaving here."
				]
				if (!global.player.mabel and string_lower(global.player.name) == "lamby") or (global.player.mabel and string_lower(global.player.name) == "waddle") {
					text[2] = "and you can take off the #costume now..."
				}
				head = [
					spr_stans_head_neutral,
					spr_stans_head_sly,
					spr_stans_head_joke
				]
				sound = [tlk_stans,tlk_stans,tlk_stans]
				font = [fnt_sans_gui,fnt_sans_gui,fnt_sans_gui]
			}
		} else {
			with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				text = ["get out of my sight before i #destroy you here and now."]
				if (!global.player.mabel and string_lower(global.player.name) == "lamby") or (global.player.mabel and string_lower(global.player.name) == "waddle") {
					text[1] = "and cut it with that stupid #costume play.&i see through your disguise."
				}
				head = [spr_stans_head_hollowEye,spr_stans_head_neutral]
				sound = [tlk_stans,tlk_stans]
				font = [fnt_sans_gui,fnt_sans_gui]
			}
		}
		switch dir {
			case 0: sprite_index = spr_stans_l break
			case 2: sprite_index = spr_stans_r break
			case 3: sprite_index = spr_stans_u break
		}
	}
}