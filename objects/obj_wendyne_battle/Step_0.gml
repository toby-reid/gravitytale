/// @description Attack
if image_alpha == 1 if(instance_exists(obj_battleBox)) if global.stage[0] == 4 {
	if(timer < 20) with obj_battleBox {//set up battlebox
		image_xscale -= .04;
		image_yscale -= .0375;
	}
	else if(timer == 20) with obj_battleBox {
		image_index = 1;
		image_xscale = 1;
		image_yscale = 1;
	}
	else if(timer < 60) { 
		if(timer == 59) obj_battleBox.y = 240;
		else if(timer >= 40) obj_battleBox.y -= 4;
	}
	else if(global.wendyne < 21) {//first time
		switch trap {
			case 5:
				if(audio_is_playing(sfx_damageTaken)) if(hp == maxhp) {
					trap++;//so we'll repeat it.
					obj_battleCore.text[0] = "You managed to get hit?&I'm impressed.&Next time, shield from it, ok?";
				}
			case 6:
				if(timer%60 == 30) {
					if(timer < 240) with instance_create_layer(obj_soul.x,obj_soul.y-320,layer,obj_battleAttack) {
						sprite_index = spr_wendyne_axe_btl;
						image_angle = 270;
						direction = 270;
						speed = 1;
						at = other.at;
						image_xscale = 1;
						image_yscale = 1;
						image_blend = c_orange;
					}
					else if(timer >= 600) global.stage[0]++;
				}
				break;
			case 4:
				
		}
	}
	else {//randomize!
		
	}
	timer++;
}