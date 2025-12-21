/// @description turn around, fight!
switch sprite_index {
	case spr_soos_r:
		sprite_index = spr_soos_d
		alarm[0] = 60 - 45*(global.soos >= 27)
		break
	case spr_soos_d:
		sprite_index = spr_soos_l
		alarm[0] = 60 - 45*(global.soos >= 27)
		break
	case spr_soos_l:
		with instance_create_layer(160,192,layer,obj_textbox) {
			var slang = "dude"
			if global.player.mabel slang = "Girl" + slang;
			var col = global.player.mabel ? "CC277A" : "1970FF";
			if global.soos < 27 {
				if scr_getKillCount(ENEMY.SOOS) > 0 {
					text = [
						". . .",
						"You all right there, #"+slang+"?",
						"You look like you've #come across the Halloween #Trickster...",
						"Or at least, some kind #of @74B285ghost@ffffff...",
						". . .",
						"Oh, no, just that you're #acting Soospicious.",
						". . .&You're good?",
						"Oh good...&Well, now I can destroy #the boat in peace.",
						". . .&You're still here?",
						"Well, then, maybe you #should learn by hands-on #experience.",
						"I'll show you what #you're up against when #you reach the mainland.",
						"I'm sorry, @"+col+global.player.name+"@ffffff.",
						"It's for your own good."
					]
					head = [
						spr_soos_face_disappoint_closed,
						spr_soos_face_neutral,
						spr_soos_face_surprise_side,
						spr_soos_face_neutral_side,
						spr_soos_face_neutral,
						spr_soos_face_wink,
						spr_soos_face_neutral,
						spr_soos_face_neutral_side,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint
					]
				}
				else if scr_getSpareCount(ENEMY.SOOS) > 0 or scr_getDeathCount(ENEMY.SOOS) > 0 {
					text = [
						". . .",
						"Are you all right, #"+slang+"?",
						"You look... tired.",
						"Like you've got a major #case of deja vu...",
						"But I guess you can't #have met me here before, #``...right?",
						"Well, either way, I'll #need to give you hands-#on experience.",
						"I'll show you what #you're up against when #you reach the mainland.",
						"I'm sorry, @"+col+global.player.name+"@ffffff.",
						"It's for your own good."
					]
					head = [
						spr_soos_face_disappoint_closed,
						spr_soos_face_neutral,
						spr_soos_face_neutral_side,
						spr_soos_face_neutral_side,
						spr_soos_face_neutral,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint
					]
				}
				else {
					text = [
						". . .",
						"This is my boat, the S.S. #@74B285Cool Dude@ffffff.",
						"It's the only way in or #out of this island.",
						". . .",
						"I'm going to destroy it.",
						"It won't do much for #the world, but it will #keep you safe.",
						"After all, the wood here #is too wet to float...",
						"Go back now, "+slang+".&I won't let you leave.",
						". . .",
						"I see.",
						"You won't even consider #my advice.",
						"Well, then, maybe you #should learn by hands-on #experience.",
						"I'll show you what #you're up against when #you reach the mainland.",
						"I'm sorry, @"+col+global.player.name+"@ffffff.",
						"It's for your own good."
					]
					head = [
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint
					]
				}
			}
			else {
				text = [
					". . .",
					"...you're back?",
					"Well, I guess we gotta #fight again now or #something..."
				]
				head = [
					spr_soos_face_disappoint_closed,
					spr_soos_face_disappoint,
					spr_soos_face_disappoint_side
				]
				global.soos = 26
			}
			for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
		}
		active = true
		break
}