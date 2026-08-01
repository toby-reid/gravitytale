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
			if(!instance_exists(obj_textBubble_old) or alpha != 0) {
				if(alpha == 0) {
					bubble = instance_create_layer(x+60,y-120,layer,obj_textBubble_old);
					with bubble {
						text = [
							". . .",
							"So that's it...",
							"I wasn't strong enough...",
							"Robbie... Soos... Dad... \nI'm sorry.",
							"I couldn't even slow them down...",
							". . .",
							"No.",
							"NO.",
							"I can't let it end like this.",
							"I WON'T let it end like this.",
							"It's time to unleash my secret weapon.",
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
					alpha += .004;
					if(alpha >= 1) event_user(0);
				}
			}
			else with obj_textBubble_old if(page >= 0) {
				if(variable_instance_exists(id,"head")) other.head = head[page];
				if(page == array_length(text)-1) {
					if(charCount >= string_length(text[page])-5) charCount = string_length(text[page]) - 4;
					other.alpha += .004;
				}
			}
		}
		else if(!instance_exists(obj_textBubble_old)) {//actually dead
			if(!instance_exists(obj_textBubble_old)) {
				if(global.wendy < 22) {
					bubble = instance_create_layer(x+60,y-120,layer,obj_textBubble_old);
					with bubble {
						text = [
							"...ah.",
							"So I guess that's it.",
							"It just wasn't enough.",
							"Well... it wasn't a complete waste, at least...",
							"I bought enough time... for the kook to finish...",
							"Your terror is about to... come to an end...",
							"You may be strong... but you can't attack...",
							"...if you... can't...",
							". . .",
							"Soon... soon... you'll see...",
							"You'll see... what happens... when we rise together...",
							"The whole town...",
							"Everyone's hopes...",
							"Everyone's dreams...",
							"We will persist.",
							"Soos... Robbie... Dad...",
							"I'm coming home."
						]
						for(var i = 0; i < array_length(text); i++) {
							sound[i] = tlk_wendy;
							charRate[i] = .2;
						}
					}
					global.wendy = 22;
				}
				else {
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
	}
	else if(sprite_index != spr_wendyne_btl_dying) audio_stop_all()
}
else if (global.player.hp <= 0)
{
    scr_diedToEnemy(enemy_index);
}
else if(global.stage[0] == 3 and global.stage[1] == 0 and global.stage[4] > 0 and global.stage[4] <= 10) {
	if(sprite_index == spr_wendyne_btl_legs) global.stage[4] = 999999;
	else {
		var _dmg = "0";
		for(var i = 0; i < global.stage[4] and i < 5; i++) _dmg += "9";
		global.stage[4] = real(string_digits(_dmg));
	}
}

if global.stage[0] == 5 {
	audio_stop_sound(mus_refusedToDie);
	if(timer != 0) {
		timer = 0;
		trap--;// must be negative to re-trap
		if(trap == 0) {
			obj_soul.image_index = 0;
		}
		else if(trap < 0 and irandom(abs(trap)+1) > 1) {
			trap = 2+irandom(2);
			obj_soul.image_index = 3;
		}
	}
}