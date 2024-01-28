if(instance_exists(obj_dipper)) switch stage {
	case 0:
		if(obj_dipper.y <= 720) if(alarm[1] == -1) {
			if(obj_dipper.canMove) {
				obj_dipper.canMove = false;
				obj_dipper.dir = 1;
				alarm[0] = 30;
				camera_set_view_target(view_camera[0],noone);
			}
			else if(alarm[0] == -1) {
				var _viewy = camera_get_view_y(view_camera[0]);
				if(_viewy > 80) camera_set_view_pos(view_camera[0],0,_viewy-1);
				else alarm[1] = 30;
			}
		}
		break;
	case 1:
		if(!instance_exists(obj_textbox)) {
			alarm[0] = 90;
			stage++;
			audio_sound_gain(mus_wind,0,500);
		}
		else switch obj_textbox.page {
			case 1:
			case 3:
				sprite_index = spr_wendyne_l;
				break;
			case 2:
			case 4:
			case 7:
				sprite_index = spr_wendyne_d;
				break;
			case 5:
				sprite_index = spr_wendyne_r;
				break;
		}
		break;
	case 2://NGAHHH
		if(alarm[0] == -1) {
			if(!instance_exists(obj_textbox)) {
				audio_stop_sound(mus_wind);
				audio_sound_gain(mus_wind,1,0);
				if(global.killed[enemy.manlydan]) {
					stage++;
				}
				else with instance_create_layer(160,192,layer,obj_textbox) {
					text = [
						". . .",
						"No, you know what?",
						"Screw it!!",
						"Speeches are for politicians!&Now is the time for action!",
						"We'll never be strong enough #to fight the @ffff00monster @ffffffif we're #stuck in storytime!"
					];
				}
			}
			else {
				if(!audio_is_playing(mus_ngahhh)) if(obj_textbox.page == 1) audio_play_sound(mus_ngahhh,0,true);
				if(obj_textbox.alarm[2] > -1 and obj_textbox.page > 0) {
					alpha = 1;
					var _cam = view_camera[0];
					camera_set_view_size(_cam,camera_get_view_width(_cam)-40,camera_get_view_height(_cam)-30);
					camera_set_view_target(_cam,id);
					camera_set_view_angle(_cam,-30 + irandom(60));
				}
				else if(alpha > 0) alpha -= .05;
				if(obj_textbox.grow < 0) stage++;
			}
		}
		break;
	case 3://fadeflash
		if(!instance_exists(obj_textbox)) {
			if(alpha < 1) alpha += .01;
			else {
				var _cam = view_camera[0];
				camera_set_view_size(_cam,320,240);
				camera_set_view_target(_cam,noone);
				camera_set_view_angle(_cam,0);
				camera_set_view_pos(_cam,0,80);
				sprite_index = spr_wendyne_helmet;
				stage++;
			}
		}
		break;
	case 4://speech!
		if(alpha > 0) alpha -= .05;
		else {
			image_speed = 1;
			if(image_index > 4 and image_index <= 5 and !audio_is_playing(sfx_ding)) audio_play_sound(sfx_ding,0,false);
			else if(image_index > 8) {
				image_speed = 0;
				if(alarm[0] == -1) alarm[0] = 60;
				else if(alarm[0] == 0) {
					with instance_create_layer(160,192,layer,obj_textbox) {
						if(global.player[player.runActive] == 2) {//geno
							text = [
								"You.",
								"You're her brother, #aren't you?",
								"It's amazing how siblings #can be so different.",
								"Well, I've tried playing #it safe, finishing you #off from afar.",
								"But no more.",
								"It's time to end this.",
								"Make peace with your #nightmares now.",
								"Because when you step #forward, when you walk #into that trap...",
								"I will KILL you."
							];
							if(global.player[player.mabel]) text[1] = "You're his sister, #aren't you?";
							head = [
								spr_wendy_head_anger,
								spr_wendy_head_ohcrap,
								spr_wendy_head_side,
								spr_wendy_head_closed,
								spr_wendy_head_ohcrap,
								spr_wendy_head_ohcrap,
								spr_wendy_head_side,
								spr_wendy_head_closed,
								spr_wendy_head_anger
							];
						}
						else if(global.killed[enemy.manlydan]) {//neut but ManDan dead
							text = [
								". . .",
								"Forget it.",
								"My father hasn't returned #from the woods since @ffff00you #@ffffffcame.",
								"I mean, say what you #want about him.",
								"He's weird,` #he's rambunctious,` #he's destructive.",
								"But he has NEVER failed #to protect my town... my #family.",
								". . .",
								"But now he's gone.",
								". . .",
								"What did you do to him?",
								"What did you DO TO HIM?",
								"\"Manly Dan\", the #unstoppable force...",
								". . .",
								"Go ahead.&Prepare however you want.",
								"But when you step #forward...`` when you walk #into that trap...",
								"I will KILL you."
							];
							head = [
								spr_wendy_head_closed,
								spr_wendy_head_happy,
								spr_wendy_head_closed,
								spr_wendy_head_side,
								spr_wendy_head_side,
								spr_wendy_head_ohcrap,
								spr_wendy_head_closed,
								spr_wendy_head_happy,
								spr_wendy_head_closed,
								spr_wendy_head_ohcrap,
								spr_wendy_head_anger,
								spr_wendy_head_happy,
								spr_wendy_head_closed,
								spr_wendy_head_ohcrap,
								spr_wendy_head_closed,
								spr_wendy_head_anger
							];
							charRate[array_length(text)-1] = 4;
						}
						else if(global.player[player.kills] > 0) {//neut but ManDan alive
							text = [
								"YOU!",
								"What have you been doing #here?",
								"The forest feels empty, a #quiet hush.",
								"After your sister came #through, I almost thought you might be cool.",
								"But you?",
								"You're just a remorseless #hunter!",
								"You wander through the #valley, attacking #whomever...",
								"...or whatever...#you want."
							];
							if(global.player[player.mabel]) text[3] = "After your brother came #through, I almost thought #you'd be reasonable.";
							head = [
								spr_wendy_head_ohcrap,
								spr_wendy_head_ohcrap,
								spr_wendy_head_closed,
								spr_wendy_head_side,
								spr_wendy_head_closed,
								spr_wendy_head_ohcrap,
								spr_wendy_head_anger,
								spr_wendy_head_anger
							]
							if(global.killed[enemy.sheriff] or global.killed[enemy.deputy]) {
								text = array_concat(text,[
									"I know those cops weren't #all that useful, but they #at least kept some order.",
									"Do you realise how hard #it is to keep everyone #together now?"
								]);
								head = array_concat(head,[
									spr_wendy_head_side,
									spr_wendy_head_ohcrap
								]);
							}
							if(global.killed[enemy.ford]) {
								text = array_concat(text,[
									"Heck, you're the reason #I lost my job, did you #know that?",
									"Mr. Pines shut down the #Shack since you murdered #his brother."
								]);
								head = array_concat(head,[
									spr_wendy_head_closed,
									spr_wendy_head_side
								]);
							}
							if(global.killed[enemy.robbie]) {
								text = array_concat(text,[
									"And now even my closest #friends are scared, since #Robbie's missing.",
									"They all think it was #some forest monster...",
									"But that was your doing #too, wasn't it?"
								]);
								head = array_concat(head,[
									spr_wendy_head_side,
									spr_wendy_head_closed,
									spr_wendy_head_happy
								]);
							}
							text = array_concat(text,[
								". . .",
								"Self-defense?&Don't make me laugh.",
								"We all fight to protect our homes.&Why do you fight?",
								"Because it's easy?&Because it's fun?",
								"Well, your time is up!&I won't let you hurt anyone else.",
								"It's time for the final battle of the training camp.",
								"In fact, let me show you just how weak you really are!",
								"Come on!",
								"Step forward and let's end this!"
							]);
							head = array_concat(head,[
								spr_wendy_head_ohcrap,
								spr_wendy_head_happy,
								spr_wendy_head_ohcrap,
								spr_wendy_head_ohcrap,
								spr_wendy_head_anger,
								spr_wendy_head_happy,
								spr_wendy_head_confident,
								spr_wendy_head_anger,
								spr_wendy_head_ohcrap
							]);
						}
						else {//paci
							text = [
								"YOU!",
								"You're the only one who's #ever made it this far!",
								"You, who hasn't got a #single inkling of #strength...",
								"How the heck have you #managed to survive?",
								"It's a heartless world #out there, man.&You gotta FIGHT to live!",
								"Oh, you don't believe me?",
								"Maybe try battling an #entire army of nightmares #for weeks.",
								"Come back and tell me #how you feel then.",
								"That's right, kid.&You don't get to #lecture me.",
								"In fact, I'll show you #just how naive you are!",
								"Come on!",
								"Step forward and let's #see!"
							];
							head = [
								spr_wendy_head_ohcrap,
								spr_wendy_head_ohcrap,
								spr_wendy_head_side,
								spr_wendy_head_ohcrap,
								spr_wendy_head_happy,
								spr_wendy_head_ohcrap,
								spr_wendy_head_anger,
								spr_wendy_head_ohcrap,
								spr_wendy_head_anger,
								spr_wendy_head_happy,
								spr_wendy_head_confident,
								spr_wendy_head_happy
							];
						}
					}
					sprite_index = spr_wendyne_h_d;
					stage++;
				}
			}
		}
		break;
	case 5://return to sender
		if(!instance_exists(obj_textbox)) {
			var _viewy = camera_get_view_y(view_camera[0]);
			if(_viewy < obj_dipper.y-120) camera_set_view_pos(view_camera[0],0,_viewy+4);
			else {
				camera_set_view_target(view_camera[0],obj_dipper);
				with instance_create_layer(20,760,layer,obj_dontGo) {
					image_yscale = 2;
					text = [
						"Where do you think you're #going??",
						"Don't tell me you're #running.",
						"I will hunt you for life #if you try to escape."
					];
					head = [
						spr_wendy_head_anger,
						spr_wendy_head_happy,
						spr_wendy_head_ohcrap
					];
				}
				with instance_create_layer(240,760,layer,obj_save) {
					rmName = "Cave - Wendy";
					text = "(The looming shadows mark an #impending battle, ";
					if(global.player[player.mabel]) text += "exciting #your imagination.)"
					else text += "filling you #with dedication.)";
					if(audio_is_playing(mus_ngahhh)) music = mus_ngahhh;
					loc = area.caves;
				}
				obj_dipper.dir = 3;
				obj_dipper.canMove = true;
				stage++;
			}
		}
		break;
	case 6://En garde!
		if(obj_dipper.y <= 620) {
			obj_dipper.canMove = false;
			x = obj_dipper.x;
			stage++;
		}
		break;
	case 7://Help! The nachos tricked me!
		if(obj_dipper.y <= 540) {
			if(place_meeting(x,y,obj_dipper)) {
				if(hspeed > 0) {
					hspeed = 0;
					with instance_create_layer(0,0,layer,obj_toBattle) {
						if(global.player[player.runActive] == 2) {
							music = mus_ngahhh;
							goto = btl_cav_wendyne_geno;
						}
						else {
							music = mus_spearjustice;
							goto = btl_cav_wendyne;
						}
					}
				}
				else if(!instance_exists(obj_toBattle)) {
					y += 80;
					obj_dipper.y += 80;
					if(global.killed[enemy.wendy]) instance_destroy();
					else {//we ran from battle
						stage++;
						audio_stop_all();
						audio_play_sound(mus_run,0,true);
					}
					obj_dipper.canMove = true;
				}
			}
			else hspeed = 2;
		}
		break;
	case 8://The chase is on!
		
}