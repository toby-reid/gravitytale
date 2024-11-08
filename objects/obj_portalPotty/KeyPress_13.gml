if !instance_exists(obj_textbox) {
	active = false
	if instance_exists(obj_dipper) if obj_dipper.canMove {
		if place_meeting(x,y+2,obj_dipper) and obj_dipper.dir==1 {
			if (!cantp) {
				if (global.enemy_spared[ENEMY.WAYMAN]) cantp = true;
				else {
					ini_open("Reset.save")
					if (ini_read_real("C","W",false)) cantp = true;
					ini_close();
				}
			}
			
			var _text = "(Seems the Potty isn't #functioning right...&(Here we go...)";
			var _choice = 0;
			if (cantp) switch global.player.portalPotty {
				case PORTAL_POTTY.FOREST_START: _text = "(Go where?)##       Forest      (Cancel)"; _choice = 1; break;
				case PORTAL_POTTY.CAVES_START:  _text = "(Go where?)##       Forest      Caves"; _choice = 1; break;
				case PORTAL_POTTY.MINES_START:  _text = "(Go where?)   Dump##       Forest      Caves"; _choice = 2; break;
				case PORTAL_POTTY.UFO_START:    _text = "(Go where?)   Dump#       Forest      Caves#              UFO"; _choice = 3; break;
			}
			with instance_create_layer(160,192,"Instances",obj_textbox) {
				text[0] = _text;
				choice[0] = _choice;
			}
			active = true
		}
		else if (place_meeting(x-2,y,obj_dipper) and obj_dipper.dir==0) or (place_meeting(x+2,y,obj_dipper) and obj_dipper.dir==2) or (place_meeting(x,y-2,obj_dipper) and obj_dipper.dir==3)
			with instance_create_layer(160,192,"Instances",obj_textbox) text = ["SomeBODY once told me-&Wait...&No...","It's a Portal Potty.&A mysterious system of #space-warping outhouses."];
	}
}
else if active if obj_textbox.charCount >= string_length(obj_textbox.text[0]) {
	if global.player.portalPotty != PORTAL_POTTY.NONE or obj_textbox.action[0] != 1 {
		teleport = true
		drawx[320] = 0
		loc = obj_textbox.action[0]
		//not defeating Wayman already covered elsewhere
		//active = false
	}
	active = false
}