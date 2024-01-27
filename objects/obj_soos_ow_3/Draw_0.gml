draw_self()
obj_dipper.canMove = false

switch stage {
	case 1: if audio_is_playing(sfx_alert) draw_sprite(spr_alert,0,x,y-30); else stage++ break
	case 2:
		if y < 130 {speed = 3; direction = 270; sprite_index = spr_soos_d; image_speed = 1.5}
		else if x > 80 {direction = 180; sprite_index = spr_soos_l}
		else {
			image_speed = 0
			speed = 0
			obj_dipper.dir = 0
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				if global.player[player.mabel] {var slang = "Hambone"; var col = "@CC277A"}
				else {var slang = "dude"; var col = "@1970FF"}
				text = [
					"Hey, "+slang+"!&Good to see you're alive!",
					"You seemed close to #death...",
					"I didn't think you'd #ever wake up...",
					"But I'm getting ahead of #myself, huh?",
					"I'm a @74B285SOOS@ffffff.&This here is #@74B285SCUTTLEBUTT ISLAND@ffffff.",
					"I made this place my home #after my house became...",
					". . .",
					"Nevermind.",
					"I found you unconscious #in the forest yesterday, #so I brought you here.",
					"Apparently the waters #here have supernatural #something-or-others...",
					"They're supposed to be #good for healing or #something.",
					"Oh, yeah, and your name #is...?",
					col+global.player[player.name]+"@ffffff, huh?&Kinda surprising for #someone like you.",
					"Anyway, since you're #alive, we should get #going.",
					"Life forms are more #likely to die when #they're alive.",
					"Follow me, "+slang+".&And hurry -` these parts #can be dangerous.",
				]
				if (global.player[player.mabel] and string_lower(global.player[player.name])=="mabel") or (!global.player[player.mabel] and string_lower(global.player[player.name])=="dipper")
					text[12] = col+global.player[player.name]+"@ffffff, huh?&I thought as much."
				head = [
					spr_soos_face_happy,
					spr_soos_face_neutral_side,
					spr_soos_face_surprise_side,
					spr_soos_face_content,
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_neutral_side,
					spr_soos_face_happy,
					spr_soos_face_happy_closed,
					spr_soos_face_happy_side,
					spr_soos_face_contempt,
					spr_soos_face_happy,
					spr_soos_face_content,
					spr_soos_face_happy_side,
					spr_soos_face_wink,
					spr_soos_face_happy
				]
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
			}
			audio_play_sound(mus_fallen,0,true)
			stage++
		}
		break
	case 3:
		if !instance_exists(obj_textbox) {
			sprite_index = spr_soos_r
			direction = 0
			speed = 1.5
			image_speed = 1
			stage++
		}
		else image_index = 0
		break
	case 4:
		if x >= 240 {
			if y < 150 {direction = 270; sprite_index = spr_soos_d}
			else {direction = 0; sprite_index = spr_soos_r}
		}
		break
}