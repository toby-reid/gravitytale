///@desc textBubble
with instance_create_layer(372,64,"Instances",obj_textBubble) {
	image_index = 1
	other.bubble = id
	if global.stage[1]==3 and global.stage[4]==0 switch other.stage {
		case  0: text[0] = ". . ." break
		case  1: text[0] = ". . .\n. . ." break
		case  2: text[0] = ". . .\n. . .\n. . ." break
		case  3: text[0] = "Dude..."; other.sprite_index = spr_soos_face_disappoint_closed break
		case  4: text[0] = "Why are you doing this..." break
		case  5: text[0] = "Is it really worth it...?"; other.sprite_index = spr_soos_face_disappoint break
		case  6: text[0] = "To get to the mainland..." break
		case  7: text[0] = "Do you really need it?"; other.sprite_index = spr_soos_face_disappoint break
		case  8: text[0] = ". . ."; other.sprite_index = spr_soos_face_disappoint_closed break
		case  9: text[0] = "Come on, dude..."; other.sprite_index = spr_soos_face_disappoint_closed break
		case 10: text[0] = "You'll die out there..."; other.sprite_index = spr_soos_face_disappoint break
		case 11: text[0] = "Please, just go back..."; other.sprite_index = spr_soos_face_disappoint_closed break
		case 12: text[0] = ". . ."; obj_battleCore.text[0] = "Soos seems more hesitant to #fight." break
		case 13: text[0] = "Heh, heh..."; other.sprite_index = spr_soos_face_disapsmile_closed break
		case 14: text[0] = "Kinda sad, huh?"; other.sprite_index = spr_soos_face_disapsmile_side break
		case 15: text[0] = "In my attempt to save you..."; other.sprite_index = spr_soos_face_disapsmile break
		case 16: text[0] = "I probably only filled you with curiosity..."; other.sprite_index = spr_soos_face_disappoint_side break
		case 17: text[0] = ". . ."; other.sprite_index = spr_soos_face_disapsmile_closed break
		case 18:
			text[0] = "What am I doing..."
			other.sprite_index = spr_soos_face_disapsmile_side
			audio_stop_sound(mus_heartache)
			audio_stop_sound(mus_heartache)
			obj_battleCore.text[0] = ". . ."
			break
		case 19: text[0] = "I can't stop you..."; other.sprite_index = spr_soos_face_disappoint_side break
		case 20: text[0] = "Not now, anyway..."; other.sprite_index = spr_soos_face_disappoint break
		case 21: text[0] = "Look, dude..."; text[1] = "I don't know what reasons you have..."; other.sprite_index = spr_soos_face_disappoint_closed break
		case 22: text[0] = "But I can tell you're on an important mission..."; other.sprite_index = spr_soos_face_disappoint_side break
		case 23: text[0] = ". . ."; other.sprite_index = spr_soos_face_disappoint_closed break
		case 24:
			text = ["Let's just stop this, dude.","I'll bring you to the mainland."]
			other.spare = true
			other.sprite_index = spr_soos_face_disapsmile
			obj_battleCore.text[0] = "Soos relaxes his fists.&He no longer wants to stop you."
			break
		default: text[0] = "Let's end this.\nI'll bring you to the mainland." break
	}
	else if other.hp <= 0 {
		if global.player[player.runActive] == 2 {//genocide death
			text = [
				". . .",
				"Oh..."
			]
			other.sprite_index = spr_soos_face_surprise
			other.result = 0
		}
		else if other.spare {//shot him for no reason
			text = [
				". . .",
				"You...",
				"At my most vulnerable moment...",
				". . .",
				"Well, best of luck, I guess...",
				"Goodbye."
			]
			for(var i = 0; i < array_length(text); i++) charRate[i] = .2
			other.sprite_index = spr_soos_face_surprise
			other.result = 1
		}
		else {//Regular death
			text = [
				". . .",
				"Ah, I see...",
				"So you really are strong enough...",
				". . .",
				"I hope you manage out there...",
				"Good luck, dude...",
				"Goodbye."
			]
			other.sprite_index = spr_soos_face_surprise
			other.result = 2
		}
		audio_stop_sound(mus_heartache)
	}
	if other.stage < 12 obj_battleCore.text[0] = choose("Soos looks through you.","Soos takes a deep breath and #clenches his fists.","Soos takes a moment to admire #the scenery.","Soos recalls the skills he #learned from First Person #Puncher and Tiger Fist.","Soos digs through his toolbox #for child-safe weapons.","Soos anxiously grabs another #handful of Burrito Bites.","Soos prepares his Soos Love #Stomach Beam Stare attack.")
	for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
}

attack = irandom(3)

timer = 0
angDir = 1.25*(irandom(1)-.5)
angle = 270-60*angDir