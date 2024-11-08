draw_self()
switch stage {
	case 1:
		if !instance_exists(obj_bill_laser) and !instance_exists(obj_atk_laser) {
			with instance_create_layer(x+40,y,"Instances",obj_textBubble) {
				if global.player.hp < global.player.maxHp {
					text = [
						"Ah hahahahaha!",
						"It's funny how #dumb you are!",
						"Kid, that was #one of my #slowest #attacks, and #you still got #hit?",
						"Geez, you #won't make it #at all in this #world!",
						"But hey, why #don't we give #it another #shot?",
						"I'll go even #slower this #time."
					]
					head = [
						spr_bill_face_laugh,
						spr_bill_face_smile,
						spr_bill_face_smile_side,
						spr_bill_face_smile,
						spr_bill_face_neutral_side,
						spr_bill_face_neutral
					]
					other.stage++
				}
				else {
					text = [
						"Not bad, kid! #Not bad at #all!",
						"But heck, that #was one of my #slowest #attacks.",
						"You gotta be a #lot faster if #you wanna #survive in #this world!",
						"Here, why #don't you have #a taste of #what's to #come?"
					]
					head = [
						spr_bill_face_neutral_side,
						spr_bill_face_neutral,
						spr_bill_face_smile,
						spr_bill_face_neutral_side
					]
					other.stage = 8
				}
			}
			path_start(pth_float,.1,path_action_continue,false)
		}
		else with obj_soul if alarm[0] > -1 alarm[0]++
		break
	case 3:
		if !instance_exists(obj_bill_laser) and !instance_exists(obj_atk_laser) {
			if global.player.hp + 2 == global.player.maxHp {
				with instance_create_layer(x+40,y,"Instances",obj_textBubble) {
					text = [
						"Ah hahahahaha!",
						"Come on, kid, #you gotta move #your SOUL!",
						"...wait...",
						"Do you not #know what #you're doing?",
						"Why did you #come to #Gravity Falls #without a #plan, kid?",
						"You're gonna #get killed out #there!",
						"Nevertheless, #worry thou #not;",
						"I, thine #exceedingly #merciful sage #of time, shall #hereafter",
						"impart upon #thee a most #wondrous #precept of #wisdom.",
						"...You can #move with the #arrow keys, #kid.",
						"Just like out #there, and #just like in #the physical #realm!",
						"Or WASD, if #you prefer!",
						"Now, then, #let's try this #again, with an #even slower #attack!"
					]
					head = [
						spr_bill_face_laugh,
						spr_bill_face_smile,
						spr_bill_face_mad_side,
						spr_bill_face_neutral,
						spr_bill_face_disinterest,
						spr_bill_face_mad,
						spr_bill_face_bougie,
						spr_bill_face_bougie,
						spr_bill_face_bougie,
						spr_bill_face_neutral,
						spr_bill_face_neutral_side,
						spr_bill_face_smile_side,
						spr_bill_face_neutral
					]
					if global.player.mabel text[4] = "Why did you #come to #Gravity Falls #without doing #any research #first, kid?"
					charRate[9] = .2
				}
				audio_sound_pitch(mus_bestFriend,audio_sound_get_pitch(mus_bestFriend)-.1)
				stage++
			}
			else event_user(0)
			path_start(pth_float,.1,path_action_continue,false)
		}
		else with obj_soul if alarm[0] > -1 alarm[0]++
		break
	case 5:
		if !instance_exists(obj_bill_laser) and !instance_exists(obj_atk_laser) {
			if global.player.hp + 3 == global.player.maxHp {
				with instance_create_layer(x+40,y,"Instances",obj_textBubble) {
					text = [
						"Alright, kid, #this is #getting real #old real fast.",
						"Just move up #or down to #dodge the #attack. #It's not that #hard.",
						"Ready?"
					]
					head = [
						spr_bill_face_disinterest,
						spr_bill_face_disinterest_side,
						spr_bill_face_neutral
					]
				}
				audio_sound_pitch(mus_bestFriend,audio_sound_get_pitch(mus_bestFriend)-.1)
				stage++
			}
			else event_user(0)
			path_start(pth_float,.1,path_action_continue,false)
		}
		else with obj_soul if alarm[0] > -1 alarm[0]++
		break
	case 7:
		if !instance_exists(obj_bill_laser) and !instance_exists(obj_atk_laser) {
			if global.player.hp + 4 == global.player.maxHp {
				with instance_create_layer(x+40,y,"Instances",obj_textBubble) {
					text = [
						"Oh, I see.",
						"You just wanna #mess with me, #huh, kid?",
						"You think I #won't kill you #here, so #you're trying #for some kind #of mental #advantage.",
						"You're still #trying to play #hero.",
						"Well, this is #what happens #to heroes in #my world!"
					]
					head = [
						spr_bill_face_disinterest_side,
						spr_bill_face_smile,
						spr_bill_face_mad_side,
						spr_bill_face_mad,
						spr_bill_face_smile
					]
					for(var i = 0; i < array_length(text); i++) {
						sound[i] = tlk_bill_creepy
						charRate[i] = .25
						style[i] = 3
					}
				}
				audio_stop_sound(mus_bestFriend)
				stage++
			}
			else event_user(0)
			path_start(pth_float,.1,path_action_continue,false)
		}
		else with obj_soul if alarm[0] > -1 alarm[0]++
		break
	case 8://this is gonna start the onslaught
		if !instance_exists(obj_textBubble) {
			if alarm[1] == -1 {
				timer = 0
				alarm[1] = 30
			}
			path_end()
			y += ceil((ystart-y)/4)
		}
		break
	case 9:
		if instance_exists(obj_textBubble) {
			if !instance_exists(obj_battleButtons_yn) {
				with obj_textBubble {
					if page == 26 if charCount >= 40 {
						charCount = string_length(text[page])
						instance_create_layer(265,261,"Instances",obj_battleButtons_yn)
						with instance_create_layer(265,338,"Instances",obj_battleButtons_yn) image_index = 2
					}
				}
				timer = 0
			}
			else if keyboard_check_pressed(vk_enter) {
				if instance_find(obj_battleButtons_yn,0).image_index == 1 timer = 1
				else if instance_find(obj_battleButtons_yn,1).image_index == 3 timer = 2
				if timer != 0 {
					instance_destroy(obj_battleButtons_yn)
					audio_play_sound(sfx_select,0,false)
					stage++
					if timer == 2 obj_textBubble.page += 8
					obj_textBubble.alarm[0] = 1
				}
			}
		}
		break
	case 10://create/draw the spinny wheel, create obj_fadeWhite
		if !instance_exists(obj_fadeWhite) {
			if instance_exists(obj_textBubble) with obj_textBubble {
				if text[page] == "And remember -" {
					with instance_create_layer(0,0,"Instances",obj_fadeWhite) goto = ow_scb_2_start
					other.alarm[2] = other.wheel[1]
				}
			}
		}
		else {
			draw_sprite_ext(spr_cipherWheel_spin,wheel[2],x,y,wheel[0],wheel[0],0,c_white,1)
			if wheel[0] < 2 {
				wheel[0] += .1
				if instance_exists(obj_textBubble) obj_textBubble.x += 2
				path_end()
				y += ceil((ystart-y)/4)
			}
		}
		break
	default://0,2,4,6
		if !instance_exists(obj_textBubble) {
			if alarm[0] == -1 alarm[0] = 30
			path_end()
			y += ceil((ystart-y)/4)
		}
		break
}
if instance_exists(obj_textBubble) {
	with obj_textBubble if page >= 0 {
		font[page] = fnt_bill_bubble
		if sound[page] == silence sound[page] = tlk_bill
		if style[page] == 0 style[page] = 2
		image_index = 1
		if variable_instance_exists(id,"head") if page < array_length(head) if head[page] != 0 other.sprite_index = head[page]
	}
}
else sprite_index = spr_bill_face_neutral