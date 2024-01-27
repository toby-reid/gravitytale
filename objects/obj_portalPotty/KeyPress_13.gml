if !instance_exists(obj_textbox) {
	active = false
	if instance_exists(obj_dipper) if obj_dipper.canMove {
		if place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1 {
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				ini_open("Reset.save")
				if ini_read_real("C","W",false) switch global.player[player.portalPotty] {
					case 1: text[0] = "(Go where?)##       Forest      (Cancel)"; choice[0] = 1 break
					case 2: text[0] = "(Go where?)##       Forest      Caves"; choice[0] = 1 break
					case 3: text[0] = "(Go where?)     Tent##        Forest        Caves"; choice[0] = 2 break
					case 4: text[0] = "(Go where?)     Tent#        Forest        Caves#                UFO"; choice[0] = 3 break
				}
				else text[0] = "(Seems the Potty isn't #functioning right...&(Here we go...)"
				ini_close()
			}
			active = true
		}
		else if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) or (place_meeting(x,y-2,obj_dipper) and obj_dipper.dir==3)
			with instance_create_layer(160,192,"Instances",obj_textbox) text = ["SomeBODY once told me-&Wait...&No...","Portal Potty.&A mysterious system of #space-warping outhouses."]
	}
}
else if active if obj_textbox.charCount >= string_length(obj_textbox.text[0]) {
	if global.player[player.portalPotty]>1 or obj_textbox.action[0] != 1 {
		teleport = true
		drawx[320] = 0
		loc = obj_textbox.action[0]
		//not defeating Wayman already covered elsewhere
		//active = false
	}
	active = false
}