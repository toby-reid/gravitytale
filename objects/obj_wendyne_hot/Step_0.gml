switch stage {
	case 0:
		if(obj_dipper.x >= 140) {
			if(obj_dipper.canMove) {
				obj_dipper.canMove = false;
				image_speed = .25;
				hspeed = .25;
                global.wendy = 23;
			}
			else {
				if(image_index%2 == 1) audio_play_sound(sfx_wendyne_step,0,false);
				if(x >= 60) {
					stage++;
					hspeed = 0;
					image_speed = 0;
					image_index = 0;
					alarm[0] = 120;
				}
			}
		}
		break;
	case 1:
		if(alarm[0] == -1) {
			sprite_index = spr_wendyne_hot;
			audio_play_sound(sfx_wendyne_step,0,false);
			alarm[0] = 30;
			stage++;
		}
		break;
	case 2:
		if(alarm[0] == -1) {
			with instance_create_layer(160,192,layer,obj_textbox) {
				text = [
					". . .",
					"This... sucks.",
					"The armor makes it hard #to breathe, and it's #hecka hot...",
					"I miss the days when we #could just hang out, pull #pranks, get in trouble...",
					"Like that time we fit 8 #whole bags of ice in #Thompson's shorts...",
					"(Man, it would be nice to #get some @99D9EAice @ffffffright #about now...)"
				];
				head = [
					spr_wendy_head_closed,
					spr_wendy_head_side,
					spr_wendy_head_closed,
					spr_wendy_head_side,
					spr_wendy_head_confident,
					spr_wendy_head_side
				];
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_wendy;
				setMove = true;
			}
			stage++;
		}
		break;
	case 3:
		if(!instance_exists(obj_textbox)) if(keyboard_check_pressed(vk_enter) and place_meeting(x+2,y,obj_dipper) and obj_dipper.dir == 2) {
			if(obj_icebox.ice) {
				obj_icebox.ice = false;
				global.player.spares++;
                scr_sparedEnemy(ENEMY.WENDY);
				alarm[0] = 30;
				obj_dipper.canMove = false;
				stage++;
			}
			else with instance_create_layer(160,192,layer,obj_textbox) {
				text = ["I'm tired of running.","I just want to prank my #friends with some @99d9eaice@ffffff..."];
				head = [spr_wendy_head_side,spr_wendy_head_side];
				sound = [tlk_wendy,tlk_wendy];
			}
		}
		break;
	case 4:
		if(alarm[0] = -1) {
			sprite_index = spr_wendyne_h_r;
			audio_play_sound(sfx_wendyne_step,0,false);
			stage++;
			alarm[0] = 30;
		}
		break;
	case 5:
		if(alarm[0] == -1) {
			with instance_create_layer(160,192,layer,obj_textbox) {
				text = [
					". . .",
					"You're... giving that to #me?",
					"After I nearly killed you #with my training camp?",
					"Ha... haha!",
					"I get it now, man!",
					"That's how you've managed #to survive this long!",
					"You trick people into #thinking you're a friend!",
					"Well, it won't work!&You're still stuck in my #training camp!",
					"Or... well...",
					"I mean, it is getting #kinda late...",
					"Maybe we should just call #it a day, huh?",
					"Yeah...&Well, I guess I'll see ya #around then."
				];
				head = [
					spr_wendy_head_ohcrap,
					spr_wendy_head_ohcrap,
					spr_wendy_head_ohcrap,
					spr_wendy_head_happy,
					spr_wendy_head_confident,
					spr_wendy_head_confident,
					spr_wendy_head_happy,
					spr_wendy_head_ohcrap,
					spr_wendy_head_side,
					spr_wendy_head_side,
					spr_wendy_head_happy,
					spr_wendy_head_side
				];
				if(global.player.kills == 0) {
					text = array_concat(text, [
						"Oh, wait, there was #something else.",
						"My friends and I were #gonna hang out later.",
						"You're welcome to join us #if you want...",
						"Just be aware, my friends #are pretty intense.",
						"We'll be waiting for you #at the old run-down #convenience store.",
						"(This is the dev's message that #they will not, in fact, be #waiting for you at this time.)"
					]);
					head = array_concat(head, [
						spr_wendy_head_closed,
						spr_wendy_head_happy,
						spr_wendy_head_side,
						spr_wendy_head_confident,
						spr_wendy_head_happy
					]);
				}
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_wendy;
			}
			stage++;
		}
		break;
	case 6:
		if(!instance_exists(obj_textbox)) {
			image_speed = -0.5;
			hspeed = -0.25;
			if(image_index%2 == 1) audio_play_sound(sfx_wendyne_step,0,false);
			if(x <= -20) {
				obj_dipper.canMove = true;
				instance_destroy();
			}
		}
		break;
}