if global.player[player.runActive] != 2 switch stage {
	case 1: if !audio_is_playing(sfx_alert) {
		with instance_create_layer(160,192,layer,obj_textbox) {
			text = [
				"(. . .)",
				"(Of course the spotlight #couldn't be for nothing...)",
				"(So tonight, you will be #visited by 3 ghosts:",
				"(My foot,&(My other foot,&(And all 10 ghost types.)"
			]
		}
		stage++
	} break
	case 2: if !instance_exists(obj_textbox) {
		with instance_create_layer(0,0,layer,obj_toBattle) {
			goto = btl_cav_17_ghosts
			music = mus_dummy
		}
		stage++
	} break
	case 3: if !instance_exists(obj_toBattle) {
		if global.spared[enemy.ghosts] {
			with instance_create_layer(160,192,layer,obj_textbox) {
				setMove = true
				text = [
					"(. . .)",
					"(The ghosts stopped #attacking...)",
					"(Seems they want nothing #more to do with you...)",
					"(I guess you've been ghosted.)",
					"(What's this on the ground they left...?)",
					"(You got the @ffff00N. Spectre gadget@ffffff!&(This should help against some #machines...)"
				]
			}
		}
		else {//ran away
			obj_dipper.dir = 3
			obj_dipper.canMove = true
		}
	} break
}

if global.killed[enemy.qt] or global.spared[enemy.qt] or global.spared[enemy.ghosts] {
	image_xscale -= .1
	if image_xscale <= 0 instance_destroy()
}