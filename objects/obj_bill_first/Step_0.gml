if image_index == 0 with obj_dipper {
	if x < 160 x += room_width-320
	else if x > room_width-160 x -= room_width-320
	if y < 120 y += room_height-240
	else if y > room_height-120 y -= room_height-240
	for(var tilex = floor(x/20)-8; tilex <= ceil(x/20)+8; tilex++) {
		for(var tiley = floor(y/20)-6; tiley <= ceil(y/20)+6; tiley++) {
			var dir = scr_billeyes(tilex*20,tiley*20,x,y)
			var tile = tilemap_get(layer_tilemap_get_id("Tiles"),tilex,tiley)
			var tilerot = tile_get_rotate(tile)
			var tilemir = tile_get_mirror(tile)
			var tileflip = tile_get_flip(tile)
			if dir != 5 switch (tilerot + 2*tilemir + 4*tileflip) {
				case 0://normal
					break
				case 1://just rotated
					switch dir {
						case 1: case 6: dir += 3 break
						case 2: case 7: dir += 1 break
						default: dir -= 2 break
					}
					break
				case 2://just mirrored
					switch dir {
						case 1: case 6: dir++ break
						case 2: case 7: dir-- break
					}
					break
				case 3://rotated & mirrored
					switch dir {
						case 1: case 6: dir += 3 break
						case 2: case 7: dir += 1 break
						case 3: case 8: dir -= 1 break
						case 4: case 9: dir -= 3 break
					}
					break
				case 4://just flipped
					switch dir {
						case 3: case 8: dir++ break
						case 4: case 9: dir-- break
					}
					break
				case 5://rotated & flipped
					switch dir {
						case 1: case 6: case 2: case 7: dir += 2 break
						default: dir -= 2 break
					}
					break
				case 6://mirrored & flipped
					switch dir {
						case 1: case 6: case 3: case 8: dir++ break
						default: dir-- break
					}
					break
				case 7://rotated, mirrored, & flipped
					switch dir {
						case 3: case 8: dir -= 1 break
						case 4: case 9: dir -= 3 break
						default: dir += 2 break
					}
					break
			}
			dir = tile_set_rotate(dir,tilerot)
			dir = tile_set_mirror(dir,tilemir)
			dir = tile_set_flip(dir,tileflip)
			tilemap_set(layer_tilemap_get_id("Tiles"),dir/*tile*/,tilex,tiley)
		}
	}
}
else if image_index >= 19 {
	if image_speed > 0 {
		image_speed = 0
		with instance_create_layer(x,y,"Instances",obj_bill_overworld) {
			image_alpha = 0
			image_speed = 0
			sprite_index = spr_bill_ow
			alarm[0] = 240
		}
	}
	else {
		with instance_find(obj_bill_overworld,1) {
			if alarm[0] > 0 {if alarm[0] mod 5 == 0 image_alpha += .02}
			else if alarm[0] == 0 {
				with instance_create_layer(160,196,"Instances",obj_textbox_old) {
					var col = (global.player.mabel) ? "@CC277A" : "@1970ff";
					var soul = (global.player.mabel) ? "Shooting Star" : "Pine Tree";
                    var prev_run = scr_getPreviousRoute();
					switch prev_run {
						case ROUTES.NONE://no previous resets
							text = [
								"Hey there, kid!",
								"The name's @ffff00Bill Cipher@ffffff!",
								"...and I take it you're #some kind of living #ventriloquist dummy?",
								"I'm just kidding, #I know who you are, #" + col + global.player.name + "@ffffff!",
								"Oh, don't look so #shocked, kid.",
								"Don't you know where #you are?",
								"Welcome to the @ff0000Mindscape@ffffff, #my infinite domain of #unlimited power!",
								"Say, why don't we take #a crash course?&I promise it'll be fun!",
								"And hey, maybe there'll #be a prize at the end!",
								"You like prizes, #don't you?"
							]
							head = [
								spr_bill_face_smile,
								spr_bill_face_neutral,
								spr_bill_face_smile_side,
								spr_bill_face_smile,
								spr_bill_face_neutral_side,
								spr_bill_face_neutral,
								spr_bill_face_hollowEye,
								spr_bill_face_smile,
								spr_bill_face_smile_side,
								spr_bill_face_smile
							]
							break
						case ROUTES.NEUTRAL:
							text = [
								"Hey there, kid!",
								"The name's @ffff00Bill Cipher@ffffff -`#but I'll skip the #pleasantries!",
								"That's right, I know #who you are, " + col + global.player.name + "@ffffff!",
								"This ain't your first #rodeo, eh, kid?",
								"Well, welcome back to the #@ff0000Mindscape@ffffff, my domain of #unlimited power!",
								"...what?",
								"Oh, right, you \"defeated\" #me.",
								"Kid, you can't claim #that victory!",
								"All you did was wear out #my patience.",
								"Looks like someone could #use a nice cup of #humili-tea.",
								"Why don't we try this #again?&I promise it'll be fun!",
								"And hey, it's an easy #excuse not to make a #skippable tutorial!"
							]
							head = [
								spr_bill_face_smile,
								spr_bill_face_neutral,
								spr_bill_face_smile_side,
								spr_bill_face_smile,
								spr_bill_face_neutral_side,
								spr_bill_face_neutral,
								spr_bill_face_disinterest,
								spr_bill_face_neutral,
								spr_bill_face_disinterest_side,
								spr_bill_face_smile,
								spr_bill_face_smile_side,
								spr_bill_face_smile
							]
							break
						case ROUTES.PACIFIST:
							text = [
								"Hey there, kid!",
								"The name's @ffff00Bill Cipher@ffffff -`#but I'll skip the #pleasantries!",
								"That's right, I know #who you are, " + col + global.player.name + "@ffffff!",
								"I know @ff0000lots of things@ffffff.",
								"Like how you seem to #think you've \"defeated\" me #before!",
								"Oh, that's just rich, #" + col + soul + "@ffffff!",
								"Why d'you suppose you #made it back here then, #hm?",
								"You just couldn't be #happy in a happy world,",
								"and now you've returned #to throw yourself right #back into my loving arms!",
								"Well, then, let's run #through this one more #time!"
							]
							head = [
								spr_bill_face_smile,
								spr_bill_face_neutral,
								spr_bill_face_smile_side,
								spr_bill_face_hollowEye,
								spr_bill_face_disinterest_side,
								spr_bill_face_smile,
								spr_bill_face_neutral,
								spr_bill_face_neutral_side,
								spr_bill_face_smile,
								spr_bill_face_smile_side
							]
							charRate[3] = 5
							sound[3] = tlk_bill_creepy
							style[3] = 3
							break
						case ROUTES.GENOCIDE:
							text = [
								"Well, well, well, well, #well well well well #wellwellwell!",
								"Aren't you a sight for #sore eye!",
								"It's good to see ya #again, kid!",
								"So what'll it be #this time?&Wipe them out again?",
								"Or do you think you can #somehow fix what you broke?",
								"Just because you leave a #timeline behind, doesn't #mean it's gone, kid.",
								"It just means you've #abandoned a world you #desolated!",
								"You can't undo your sins!&They'll be there forever #to haunt you!",
								"Isn't that fun?",
								"Oh, and speaking of fun, #why don't we go through #the tutorial again?",
								"Come on, you know you'll #love it!"
							]
							head = [
								spr_bill_face_neutral,
								spr_bill_face_smile,
								spr_bill_face_smile,
								spr_bill_face_smile_side,
								spr_bill_face_smile,
								spr_bill_face_disinterest,
								spr_bill_face_smile,
								spr_bill_face_neutral,
								spr_bill_face_hollowEye,
								spr_bill_face_neutral_side,
								spr_bill_face_smile
							]
							charRate[8] = 5
							sound[8] = tlk_bill_creepy
							style[8] = 3
							break
					}
					sound[array_length(text)] = 0
					font[array_length(text)]  = 0
					style[array_length(text)] = 0
					for(var i = 0; i < array_length(text); i++) {
						if sound[i] == 0 sound[i] = tlk_bill
						if font[i]  == 0 font[i]  = fnt_bill_gui
						if style[i] == 0 style[i] = 2
					}
					audio_play_sound(mus_bestFriend,0,true)
				}
				path_start(pth_float,.1,path_action_continue,false)
			}
			else if !instance_exists(obj_textbox_old) if !instance_exists(obj_toBattle) with instance_create_layer(0,0,"Instances",obj_toBattle) {
				goto = btl_scb_1_billBattle
				music = mus_bestFriend
				dest = 1
			}
		}
	}
}