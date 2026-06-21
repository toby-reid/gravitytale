switch stage {
	case 0:
		if obj_dipper.x >= 220 {
			obj_dipper.canMove = false
			with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				var slang = "dude"
				if (global.player.mabel) slang = "girl" + slang;
				text = [
					"I'm still concerned for #your perception and #coordination, "+slang+"...",
					"So I'm going to see #how well you can cross #this clearing.",
					"I'll be up ahead, so #don't worry too much.",
					"If you need anything, #just holler.",
					"See how fast you can #reach the end!"
				]
				head = [
					spr_soos_face_neutral,
					spr_soos_face_happy,
					spr_soos_face_happy_closed,
					spr_soos_face_happy,
					spr_soos_face_happy_closed
				]
				sound = [tlk_soos,tlk_soos,tlk_soos,tlk_soos,tlk_soos]
			}
			stage++
		}
		else if obj_dipper.y > 220 obj_dipper.y = 210
		break;
	case 1:
		if !instance_exists(obj_textbox_old) {
			speed = 3
			image_speed = 2
			sprite_index = spr_soos_r
			if x >= 400 {
				audio_stop_all()
				audio_play_sound(mus_tension,0,true)
				obj_dipper.canMove = true
				speed = 0
				image_speed = 0
				image_index = 0
				sprite_index = spr_soos_l
				x = 1540
				y = 120
				stage++
			}
		}
		break;
	case 2:
		timer++
		if obj_dipper.x >= 1460 {//minimum possible time is 826.66666666666666666666666666
			obj_dipper.canMove = false
			var slang = global.player.mabel ? "Hambone" : "dude";
			with instance_create_layer(160,192,"Instances",obj_textbox_old) {
				text = [
					"Sup, "+slang+"?",
					"You're finally here!",
					"Well, I suppose your #physical condition is #acceptable...",
					"Because of this, I #will go on ahead.",
					"Please, though, "+slang+"...",
					"For your sake...",
					"Stay here.",
					"Take this @1970FFHAT@ffffff.&It should provide decent #defence if attacked.",
					"Don't go looking for #trouble, though!&It's never invincible!",
					"If you encounter any #Enemies, try to ACT on #them.",
					"If you're in real #trouble, call me over, #okay?",
					". . .",
					"You don't have a #phone?",
					"Here, take this @74B285COMLINK@ffffff.&Use it to contact me #if you need.",
					"Now, I gotta take care of #some... things.",
					"You just stay here, okay, #"+slang+"?"
				]
				head = [
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_happy_closed,
					spr_soos_face_happy_side,
					spr_soos_face_neutral_side,
					spr_soos_face_neutral,
					spr_soos_face_happy_closed,
					spr_soos_face_happy_side,
					spr_soos_face_surprise,
					spr_soos_face_happy_side,
					spr_soos_face_happy,
					spr_soos_face_neutral,
					spr_soos_face_neutral_side,
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_happy
				]
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
				if ((global.player.mabel and string_lower(global.player.name)=="waddle")
						or (!global.player.mabel and string_lower(global.player.name)=="lamby")) {
					text[8] = "Oh, you already have...&that...";
				}
				else if global.player.mabel {
					text[7] = "Here's a @CC277AShooting Star #sweater @ffffffmy Abuelita made.&It's too small for me.";
					text[8] = "It should give you some #defence, but it's not #invulnerable, so be careful.";
					head[8] = spr_soos_face_happy_side;
				}
			}
			if timer <= 830 with obj_textbox_old {
				text[0] = "Wow, "+slang+"!"
				text[1] = "You reached the other #end in less than 14 #seconds..."
				text[2] = "Clearly you're in great #physical condition."
				head[0] = spr_soos_face_surprise
				head[1] = spr_soos_face_surprise_side
				head[2] = spr_soos_face_happy_side
				head[3] = spr_soos_face_happy_closed
			}
			else if timer <= 1000 with obj_textbox_old {
				text[0] = "Nice job, "+slang+"!"
				text[1] = "You crossed fairly #quickly."
				text[2] = "Clearly you're in good #physical condition."
			}
			else if timer <= 2000 with obj_textbox_old {
				text[0] = "There ya go, "+slang+"!"
				text[1] = "You crossed at a #reasonable speed!"
				text[2] = "Clearly your physical #condition is okay."
			}
			else if timer <= 3600 with obj_textbox_old {
				text[1] = "You feeling all right?"
				text[2] = "Your physical condition #seems to be..."
				text[3] = "...&I'll just go on ahead."
			}
			else if timer > 18000 with obj_textbox_old {
				text[0] = "Wow..."
				text[1] = "I didn't think it was #possible to go that #slowly..."
				text[2] = "But you're here now, #so you must be okay."
				head[0] = spr_soos_face_surprise
				head[1] = spr_soos_face_surprise_side
				charRate = [.2,.25]
			}
			stage++
			audio_stop_sound(mus_tension)
			audio_play_sound(mus_fallen,0,true)
		}
	break
	case 3:
		if !instance_exists(obj_textbox_old) {
			speed = 1
			sprite_index = spr_soos_r
			image_speed = 1
			if x >= 1580 {
				speed = 0
				image_speed = 0
				image_alpha -= .1
				if image_alpha == 0 {
					sprite_index = noone
					obj_dipper.canMove = true
					stage++
					timer = 0
					audio_stop_all()
					audio_play_sound(mus_ruins,0,true)
					alarm[0] = 1
				}
			}
		}
		else with obj_textbox_old {
			if page == 7 {
				if !global.player.mabel {
					if charCount == 11 audio_play_sound(sfx_itemGet,0,false)
					if string_lower(global.player.name) == "mason" obj_dipper.sprite_index = spr_dipstar
					else if string_lower(global.player.name) != "lamby" obj_dipper.sprite_index = spr_diphat
				}
				global.player.df = AT_DF.BASE;
			}
			if page == 13 if charCount == 17 audio_play_sound(sfx_itemGet,0,false)
		}
	break
	case 4:
		with obj_dipper if place_meeting(x,y,obj_toRoom) {global.soos = 7; instance_destroy(other)}
		if !instance_exists(obj_textbox_old) {
			timer++
			switch timer {//to call at random intervals =P
				case 3600: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
					var slang = "dude"
					if global.player.mabel slang = "Girl" + slang
					text = [
						"Beep, beep... *",
						"Hey, "+slang+"!",
						"So, uh...",
						"I notice you're still #where I left you...",
						"I know I said not to #follow me, but...",
						"Don't you have curiosity?",
						"Don't you want to explore #the island?",
						"Click *"
					]
					head = [
						noone,
						spr_soos_face_happy,
						spr_soos_face_happy_side,
						spr_soos_face_happy_side,
						spr_soos_face_happy_side,
						spr_soos_face_happy,
						spr_soos_face_happy_side
					]
					for(var i = 1; i < array_length(head); i++) if head[i] != noone sound[i] = tlk_soos
					audio_play_sound(sfx_comlink,0,false)
				} break
				case 18000: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
					var slang = global.player.mabel ? "Hambone" : "dude";
					text = [
						"Beep, beep... *",
						"Hey, uh...",
						"I don't know if I need to #be more obvious?",
						"I thought I was clear in #my sly suggestions...",
						"How do I put this...",
						"You definitely shouldn't #not refrain from not #following me, "+slang+"...",
						"Click *"
					]
					head = [
						noone,
						spr_soos_face_happy_side,
						spr_soos_face_happy,
						spr_soos_face_happy_side,
						spr_soos_face_contempt,
						spr_soos_face_happy_side
					]
					for(var i = 1; i < array_length(head); i++) if head[i] != noone sound[i] = tlk_soos
					audio_play_sound(sfx_comlink,0,false)
				} break
				case 36000: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
					var slang = global.player.mabel ? "Hambone" : "dude";
					text = [
						"Beep, beep... *",
						"Hey, "+slang+"...",
						"You haven't moved at #all, huh?",
						"There's an entire island #to explore, you know...",
						"Why don't you get out #there and see it?",
						"Click *"
					]
					head = [
						noone,
						spr_soos_face_happy,
						spr_soos_face_happy_side,
						spr_soos_face_happy_side,
						spr_soos_face_happy
					]
					for(var i = 1; i < array_length(head); i++) if head[i] != noone sound[i] = tlk_soos
					audio_play_sound(sfx_comlink,0,false)
				} break
				case 54000: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
					var slang = global.player.mabel ? "Hambone" : "dude";
					text = [
						"Beep, beep... *",
						"Oh, I get it, "+slang+"...",
						"You're just going to #stand around to see what #I say, huh?",
						"Well, it won't work...",
						"This is the last time #I'll say something #unique.",
						"Click *"
					]
					head = [
						noone,
						spr_soos_face_contempt,
						spr_soos_face_disappoint,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint_closed
					]
					for(var i = 1; i < array_length(head); i++) if head[i] != noone sound[i] = tlk_soos
					audio_play_sound(sfx_comlink,0,false)
				} break
				case 72000: with instance_create_layer(160,192,"Instances",obj_textbox_old) {
					text = [
						"Beep, beep... *",
						". . .",
						". . .",
						"You're still there...?",
						"Click *"
					]
					head = [
						noone,
						spr_soos_face_disappoint_closed,
						spr_soos_face_disappoint_side,
						spr_soos_face_disappoint
					]
					for(var i = 1; i < array_length(head); i++) if head[i] != noone sound[i] = tlk_soos
					audio_play_sound(sfx_comlink,0,false)
					other.timer -= 18000
				} break
			}
		}
	break
}