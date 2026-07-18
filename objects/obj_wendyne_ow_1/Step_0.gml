if instance_exists(obj_dipper) switch stage {
	case 0: if obj_dipper.x >= 130 {
		with instance_create_layer(160,48,"Instances",obj_textbox_old) {
			if global.enemy_spared[ENEMY.SOOS] {
				var slang = global.player.mabel ? "Hambone" : "dude";
				text = [
					"Beep, beep... *",
					"Sup, "+slang+"?&How's it going?",
					"So I heard you got past #the Stanford who is the #real Stanford, not",
					"Mr. Pines, the Stanford #we know, because he's #not the real Stanford...",
					"So the real Stanford, not #the fake Stanford, whom #we know, ok?",
					"Just trying to help #clear up confusion.",
					"Anyway, "+slang+", if you #keep going, you'll run #into the caves...",
					"If you're deep enough #inside, I can't reach #you, ok?",
					"So...&I can't give hints or #anything...",
					"Oh, also, you're probably #about to run into #@888888[garbled]@ffffff...",
					"So no matter what, "+slang+", #absolutely make sure you #@888888[garbled]@ffffff, ok?",
					"If you don't, you'll have #to endure her \"trial\"...",
					"Alright, "+slang+".&I'll let you go now.",
					"And don't forget what you #have to do, all right?",
					"Click *"
				]
				head = [
					noone,
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_contempt,
					spr_soos_face_happy,
					spr_soos_face_happy_closed,
					spr_soos_face_happy_side,
					spr_soos_face_happy,
					spr_soos_face_happy_side,
					spr_soos_face_neutral_side,
					spr_soos_face_neutral,
					spr_soos_face_neutral_side,
					spr_soos_face_happy_closed,
					spr_soos_face_happy
				]
				for(var i = 1; i < array_length(text)-1; i++) sound[i] = tlk_soos
			} else if global.enemy_spared[ENEMY.FORD] {
				text = [
					"Beep, beep... *",
					"huh, so you are on this #frequency after all...",
					"hey, kid, long time no see.",
					"i gotta thank you for what you #did for my brother.",
					"he hasn't had this much fun in #years.",
					"i think so, anyway...&he was missing for like #40 years...",
					"anyway, kid, you remember #soos, right?&great employee.",
					"never once asked for a raise...&or any payment, for that #matter.",
					"...and of course you go in and #murder him for no good #reason.",
					"after he saved your life, no #less.",
					"now, kid, i believe in #redemption, so i won't attack #you just yet...",
					"but i strongly advise you to #stop now before you end up #tearing the universe apart.",
					"Click *"
				]
				head = [
					noone,
					spr_stans_head_sly,
					spr_stans_head_content,
					spr_stans_head_neutral,
					spr_stans_head_sly,
					spr_stans_head_joke,
					spr_stans_head_neutral,
					spr_stans_head_sly,
					spr_stans_head_hollowEye,
					spr_stans_head_neutral,
					spr_stans_head_content,
					spr_stans_head_hollowEye
				]
				for(var i = 1; i < array_length(text)-1; i++) {sound[i] = tlk_stans; font[i] = fnt_sans_gui}
			} else if global.enemy_killed[ENEMY.BLENDIN] {
				text = [
					"Beep, beep... *",
					"h-hey there, remember me?",
					"that's right, it's blendin!&blendin blenjamin blandin!",
					"d-don't think i've forgotten #what you did back there.",
					"we time cops know everything, #y-you know?",
					"well, i-i-i told the @ff0000boss @ffffffall #about you, and he's keeping you #under tight surveillance...",
					"s-so you'd better stop now, #or the @ff0000boss @ffffffis gonna get #involved...",
					"Click *"
				]
				for(var i = 1; i < array_length(text)-1; i++) sound[i] = tlk_blendin
			} else {
				text = [
					"Beep, beep... *",
					"h-hey there, remember me?",
					"of course you do!&y-you're my first friend, #after all!",
					"it's blendin!&blendin blenjamin blandin!",
					"d-don't think i've forgotten #what you did for me back there!",
					"because i-i-i told the @ff0000boss @ffffffall #about you, and he said he was #pleased with your performance...",
					"s-so hang in there for a moment, #ok?&the @ff0000boss @ffffffwants to talk to you...",
					"you just gotta get through this #\"trial\", ok?",
					"g-good luck...&friend...",
					"Click *"
				]
				for(var i = 1; i < array_length(text)-1; i++) sound[i] = tlk_blendin
			}
		}
		audio_play_sound(sfx_comlink,0,false)
		stage++
        // TODO: Make a more elegant solution than a collision object
        regression_prevention = instance_create_layer(obj_dipper.x - 40, 0, layer, obj_collide);
        regression_prevention.image_yscale = 12;
	} break
	case 1: if alarm[1] == -1 if obj_dipper.x >= 640 {
		obj_dipper.canMove = false
		image_alpha = 1
		alarm[0] = 60
		alarm[1] = 400
		hspeed = .1
		alarm[2] = 20
	} break
	case 2: if x <= 455 {
		alarm[0] = -1
		image_alpha = 0
		hspeed = 0
		stage++
		obj_dipper.canMove = true
		if !global.enemy_spared[ENEMY.SOOS] instance_destroy()
        else regression_prevention.x = obj_dipper.x - 40;
	} break
	case 3: if obj_dipper.x >= 830 {
		with instance_create_layer(160,48,"Instances",obj_textbox_old) {
			var slang = "dude"
			if (global.player.mabel) slang = "Girl" + slang;
			text = [
				"Beep, beep... *",
				"Hey, "+slang+", you must be #deeper in the caves than #I first @888888[garbled]@ffffff...",
				"So you must have run into #@F36C4Fher @ffffffalready, right?",
				"Well, remember, you need #to @888888[garbled] @ffffffor you'll #have to do her \"trial\"...",
				"Alright, we've got no #connection, "+slang+".&See you, and good luck.",
				"Click *"
			]
			head = [
				noone,
				spr_soos_face_surprise,
				spr_soos_face_neutral_side,
				spr_soos_face_neutral,
				spr_soos_face_happy_closed
			]
			for(var i = 1; i < array_length(text)-1; i++) sound[i] = tlk_soos
			audio_play_sound(sfx_comlink,0,false)
		}
		instance_destroy()
	} break
}