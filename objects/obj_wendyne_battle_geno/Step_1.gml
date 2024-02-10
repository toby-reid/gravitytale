///@desc Dying / Round Reset
if hp <= 0 {
	hp = 0;
	if(sprite_index = spr_wendyne_btl_legs) {
		sprite_index = spr_wendyne_btl_dying;
		vspeed = 0;
		y = ystart;
		audio_stop_sound(mus_ngahhh);
	}
	if(global.stage[0] != 3) {
		if(sprite_index == spr_wendyne_btl_dying) {//but the earth refused to die
			if(!instance_exists(obj_textBubble)) {
				if(alpha == 0) {
					bubble = instance_create_layer(x+60,y-120,layer,obj_textBubble);
					with bubble {
						text = [
							". . .",
							"So that's it...",
							"Robbie... Soos... Dad... I'm sorry.",
							". . .",
							"No.",
							"I can't let it end like this.",
							"I WON'T let it end like this.",
							"I will destroy you, no matter what.",
							"'Cause I'm a flippin' CORDUROY!!!        "
						];
						for(var i = 0; i < array_length(text); i++) {
							sound[i] = tlk_wendy;
							charRate[i] = .25;
						}
						image_index = 1;
					}
					audio_play_sound(mus_refusedToDie,0,true);
					audio_sound_gain(mus_refusedToDie,0,0);
					audio_sound_gain(mus_refusedToDie,1,2000);
				}
				else {
					alpha += .0025;
					if(alpha >= 1) event_user(0);
				}
			}
			else with obj_textBubble if(page >= 0) {
				if(variable_instance_exists(id,"head")) other.head = head[page];
				if(page == array_length(text)-1) {
					if(charCount >= string_length(text[page])-5) charCount = string_length(text[page]) - 4;
					other.alpha += .0025;
				}
			}
		}
		else if(!instance_exists(obj_textBubble)) {//actually dead
			if(image_alpha == 1) {
				audio_play_sound(sfx_enemyDead,0,false);
				global.enemy = [instance_create_layer(x,y-40,layer,obj_enemySoulBreak)];
				global.enemy[0].image_index = 3;
			}
			image_alpha -= .05
			if(image_alpha == 0) instance_destroy();
		}
	}
}
else if(global.stage[0] == 3 and global.stage[1] == 0 and global.stage[4] > 0 and global.stage[4] <= 10) {
	if(sprite_index == spr_wendyne_btl_legs) global.stage[4] = 999999;
	else global.stage[4] = 9*power(10,global.stage[4]);
}

if global.stage[0] == 5 {timer = 0;}