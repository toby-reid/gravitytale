switch stage {
	case 0: if obj_dipper.y <= 350 {
		obj_dipper.canMove = false
		with instance_create_layer(160,192,"Instances",obj_textbox) {
			text = [
				"hey, kid, you made it.&nice job.",
				"you've beaten manly men, #impossible puzzles, #and teenage angst...",
				"SILENCE, STANS.&THIS IS MY TEST #SUBJECT, NOT YOURS.",
				"NOW, CHILD, YOU ARE #NEARLY AT THE END #OF YOUR TRIAL.",
				"ONLY A FEW MORE #PUZZLES UNTIL YOU #REACH THE TOWN.",
				"BUT, CHILD, I HAVE #SOMETHING TO #CONFESS...",
				"aha!&so you were the one who sold #my pug stash..",
				"WHAT?&NO, WHY...",
				"BAH! CHILD, WHEN I #SAID THE PUZZLES #WERE IMPOSSIBLE,",
				"I LIED.",
				"I KNOW YOU MUST HAVE #BEEN VERY CONFUSED!",
				"SO, TO MAKE UP FOR IT, #I WILL TELL YOU HOW TO #BEAT THE NEXT PUZZLE.",
				"IF YOU TOUCH ALL THE #SHAPES AND TURN #THEM INTO CIRCLES,",
				"YOU WILL BE ABLE TO #PROGRESS TO THE #NEXT PUZZLE.",
				"NO, NO, THERE IS NO #NEED TO THANK ME.",
				"NOW, GOOD LUCK, #SUBJECT.",
				"I WILL SEE YOU IN #GRAVITY FALLS!"
			]
			head = [
				spr_stans_head_sly,
				spr_stans_head_joke,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_bashful,
				spr_stans_head_sly,
				spr_ford_head_bashful,
				spr_ford_head_mad,
				spr_ford_head_bashful,
				spr_ford_head_neutral,
				spr_ford_head_mad,
				spr_ford_head_neutral,
				spr_ford_head_neutral,
				spr_ford_head_bashful,
				spr_ford_head_mad,
				spr_ford_head_neutral
			]
			for(var i = 0; i < array_length(text); i++) {
				if string_upper(text[i]) == text[i] {
					sound[i]=tlk_ford;
					font[i]=fnt_papyrus_gui;
				} else {
					sound[i]=tlk_stans;
					font[i]=fnt_sans_gui;
				}
			}
		}
		audio_stop_all()
		audio_play_sound(mus_nyeh,0,true)
		stage++
	} break
	case 1: if !instance_exists(obj_textbox) {
		obj_ford_ow_1.vspeed = -2
		obj_ford_ow_1.sprite_index = spr_ford_u
		obj_ford_ow_1.image_speed = 1
		audio_sound_gain(mus_nyeh,audio_sound_get_gain(mus_nyeh)-.02,0)
		if obj_ford_ow_1.y <= 150 {
			audio_stop_all()
			audio_sound_gain(mus_nyeh,1,0)
			instance_destroy(obj_ford_ow_1)
			if global.player.genocide != RUN.ACTIVE {
				with instance_create_layer(160,192,"Instances",obj_textbox) {
					text = [
						"look, kid...&i don't know if you were #aware...",
						"but my brother's a little...&eccentric.",
						"i didn't want to correct him #to his face, but you may want #a real hint here...",
						"as you've found, small rocks #can be moved once.",
						"you're likely also aware that #they can be moved again if #they are reset.",
						"rocks will always move back to #their original positions when #you hit a lever...",
						"but if there are multiple levers #in different locations...",
						"i know it's kinda convoluted, #but try your best, ok?"
					]
					head = [
						spr_stans_head_content,
						spr_stans_head_joke,
						spr_stans_head_sly,
						spr_stans_head_neutral,
						spr_stans_head_sly,
						spr_stans_head_neutral,
						spr_stans_head_content,
						spr_stans_head_sly
					]
					for(var i = 0; i < array_length(text); i++) {sound[i] = tlk_stans; font[i] = fnt_sans_gui}
				}
			} else {
				with instance_create_layer(160,192,"Instances",obj_textbox) {
					text = [
						"well, kid...&you still haven't given up, eh?",
						"your murder spree is still #strong, and the fire in your #eyes is only brighter.",
						"you've already done enough #damage to get locked up for #twelve lifetimes.",
						"but you don't care, do you?",
						"you're just flying along, #killing as you please.",
						"no...",
						"you're just blasting through, #killing everything you can.",
						"but i've said this before, and #i'll say it again...",
						"the time will come when my #brother will actually #try to stop you.",
						"when that time comes, kid...",
						"you'd better end this path #you're taking then and there #or i will do it for you.",
						"now, get lost, kid.&there's no place for you #around here."
					]
					head = [
						spr_stans_head_content,
						spr_stans_head_sly,
						spr_stans_head_content,
						spr_stans_head_hollowEye,
						spr_stans_head_sly,
						spr_stans_head_content,
						spr_stans_head_hollowEye,
						spr_stans_head_content,
						spr_stans_head_neutral,
						spr_stans_head_sly,
						spr_stans_head_hollowEye,
						spr_stans_head_content
					]
					for(var i = 0; i < array_length(text); i++) {font[i] = fnt_sans_gui; sound[i] = tlk_stans}
					charRate[10] = .2
				}
			}
			stage++
		}
	} break
	case 2: if !instance_exists(obj_textbox) {
		vspeed = -.5
		image_speed = .5
		if y <= 200 {global.stans = 13; instance_destroy()}
	} break
}