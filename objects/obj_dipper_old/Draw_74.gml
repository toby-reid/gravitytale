///@desc in-game menu
if menu[0] > 0 {
	var soul_sprite = global.player.mabel ? spr_soulM : spr_soul;
    
	var multipage = array_length(global.inventory) > 8;
	if multipage {
		multipage = false;
		// determine if there's a "page 1"
		for (var i = 0; i < 8; i++) {
			if global.inventory[i] != ITEM_INDEX.NONE {
				multipage = true;
				break;
			}
		}
		if multipage {
			multipage = false;
			// determine if there's a "page 2"
			for (var i = 8; i < array_length(global.inventory); i++) {
				if global.inventory[i] != ITEM_INDEX.NONE {
					multipage = true;
					break;
				}
			}
		}
	}

	draw_sprite(spr_menu,0,30,60);
	if menu[0] > 1 {
		draw_sprite(spr_menu,multipage ? 2 : 1,30,60); // add some vertical space for multiple pages
		if menu[0] == 4 draw_sprite(spr_menu,3,30,60)
	}
	draw_set_color(c_white)
	draw_set_font(fnt_basic_bubble)
	draw_text_ext(46,106,string_concat("LV  ", global.player.lv, "\nHP  ", global.player.hp, "/", global.player.maxHp, "\n$   ", global.player.money),18,200)
	draw_set_font(fnt_basic_gui)
	draw_text(43,69,global.player.name)
	draw_sprite_stretched(spr_menuIcons,global.player.mabel ? 1 : 0,142,72,18,18)
	draw_text(55,197,"ITEM")
	draw_text(55,233,global.player.mabel ? "SCRAPBK" : "JOURNAL");
	if global.player.df >= AT_DF.BASE draw_text(55,269,"COMLINK")
	switch menu[0] {
		case 1://select
			if !instance_exists(obj_textbox_old) {
				draw_sprite(soul_sprite,0,46,209+global.menu[0]*36)
				if keyboard_check_pressed(vk_down) {global.menu[0]++; if global.menu[0]>2 or (global.menu[0]>1 and global.player.df == AT_DF.NONE) global.menu[0]=0; audio_play_sound(sfx_beep,0,false)}
				if keyboard_check_pressed(vk_up) {global.menu[0]--; if global.menu[0]<0 {if global.player.df != AT_DF.NONE global.menu[0]=2; else global.menu[0]=1}; audio_play_sound(sfx_beep,0,false)}
				if keyboard_check_pressed(vk_enter) {
					switch global.menu[0] {
						case 0:
							if (global.inventory[global.menu[1]] != ITEM_INDEX.NONE or scr_menu_itemSelect(1)) {
								menu[0] = 2;
							}
							else {
								with instance_create_layer(320,192,"Instances",obj_textbox_old) text = ["(You don't have any Items.&(What's the point of looking?)"]
							}
							break
						case 1: menu[0] = 4 break
						case 2:
							if global.enemy_killed[ENEMY.SOOS] or instance_exists(obj_bill_overworld) {
								with instance_create_layer(320,192,"Instances",obj_textbox_old) {
									text = ["(You tried to contact Soos...`````#...but there was no answer.)"];
								}
							}
							else {
								with instance_create_layer(160,192,"Instances",obj_textbox_old) {
									text = ["Beep, beep... *","Hey, dude!&How's it going?",". . .","Oh, you just #wanted a hint...?"]
									head = [noone,spr_soos_face_happy,spr_soos_face_neutral,spr_soos_face_disappoint,spr_soos_face_happy]
									switch room {
										case ow_scb_2_start:
										case ow_scb_3_meetSoos:
										case ow_scb_4_puzzle1:
										case ow_scb_5_puzzle2:
										case ow_scb_6_nyarf:
											text[4] = "Well, why are you #backtracking, dude?"
											text[5] = "You should be moving #forward...&Exploring..."
											head[4] = spr_soos_face_content
											head[5] = spr_soos_face_happy_side
											break
										case ow_scb_7_walkTest:
											text[4] = "Erm...&How do I put this..."
											text[5] = "When I said I wanted you #to stay..."
											text[6] = "You were supposed to #follow me to my cabin..."
											head[4] = spr_soos_face_contempt
											head[5] = spr_soos_face_neutral_side
											head[6] = spr_soos_face_neutral
											break
										case ow_scb_8_puzzle3:
										case ow_scb_9_pz3cal:
											text[5] = "There's a calendar to the #north.&Check that out sometime."
											head[5] = spr_soos_face_happy_closed
										case ow_scb_10_puzzle4:
											text[4] = "Have you tried reading #signs?&They can give hints..."
											head[4] = spr_soos_face_happy
											break
										case ow_scb_11_blendin:
											if instance_exists(obj_scb_blendin) {
												text[4] = "Hm...&I have no idea who that #guy is, dude..."
												text[5] = ". . ."
												text[6] = "How do I know there's #someone there?"
												text[7] = "What, you can't hear him #rambling to himself?"
												text[8] = "Might as well go talk to #him..."
												text[9] = "See if he has my #screwdriver while you're #at it."
												head[4] = spr_soos_face_neutral_side
												head[5] = spr_soos_face_neutral
												head[6] = spr_soos_face_happy_side
												head[7] = spr_soos_face_content
												head[8] = spr_soos_face_happy
												head[9] = spr_soos_face_happy_side
											}
											else {
												text[1] = "Whoa, dude...&That was a time #traveller?"
												text[2] = "Well, you didn't happen #to ask him if he took my #screwdriver, did you?"
												text[3] = ". . ."
												text[4] = "Oh well.&You should move on #anyway, dude."
												head[1] = spr_soos_face_surprise
												head[2] = spr_soos_face_happy_side
												head[3] = spr_soos_face_neutral
												head[4] = spr_soos_face_happy
											}
											break
										case ow_scb_12_puzzle5:
											text[4] = "Did you read that sign, #dude?"
											text[5] = "...Have you considered #vertices?"
											head[4] = spr_soos_face_happy
											head[5] = spr_soos_face_happy_side
											break
										case ow_scb_13_puzzle6:
										case ow_scb_14_pz6_l:
										case ow_scb_14_pz6_r:
											text[4] = "Did you read that sign, #dude?"
											text[5] = "There are 4 rooms to the #east and west..."
											head[4] = spr_soos_face_happy
											head[5] = spr_soos_face_happy_side
											break
										case ow_scb_15_puzzle7:
											text[4] = "Did you read that sign, #dude?"
											text[5] = "There's a common cipher #that fits here..."
											text[6] = "Try fitting letters to #numbers."
											head[4] = spr_soos_face_happy
											head[5] = spr_soos_face_happy_side
											head[6] = spr_soos_face_content
											break
										case ow_scb_16_soosHome:
										case ow_scb_17_homeMid:
										case ow_scb_18_homeLeft:
										case ow_scb_19_homeRight:
										case ow_scb_20_homeRoom:
										case ow_scb_21_homeBath:
											text = ["Beep, beep..."]
											text[1] = "Hey, dude!&Welcome to the island #cabin!"
											text[2] = "Why don't you try the #game upstairs?``&If it's there, that is..."
											head[1] = spr_soos_face_happy
											head[2] = spr_soos_face_happy_side
											break
										case ow_scb_22_dock_0:
										case ow_scb_23_dock_1:
										case ow_scb_24_dock_2:
										case ow_scb_25_dock_3:
										case ow_scb_26_dock_4:
										case ow_scb_27_dock:
										case ow_fst_0_boatDock:
											if(!instance_exists(obj_soos_ow_dock) and !instance_exists(obj_soos_ow_27)) {
												text[4] = ". . ."
												text[5] = "Water you docking aboat?&I'm right here, dude!"
												head[4] = spr_soos_face_neutral
												head[5] = spr_soos_face_wink
											}
											else {
												text[1] = ". . ."
												text[3] = ". . ."
												head[1] = spr_soos_face_disappoint_side
												head[2] = spr_soos_face_disappoint
												head[3] = spr_soos_face_disappoint_closed
											}
											break
										case ow_fst_1_meetStans:
											if instance_exists(obj_stans_ow_1) and other.x < 900 {
												text[4] = "Well, those are some #creepy trees, dude..."
												text[5] = "Just... be careful..."
												head[4] = spr_soos_face_neutral_side
												head[5] = spr_soos_face_neutral
											}
											else if instance_exists(obj_stans_ow_1) {
												text[4] = "What kind of hint do you #need, dude!?"
												text[5] = "You got the amazing #Mr. Pines right in front #of you!"
												text[6] = "Take a few moments to #bask in his glory, dude!"
												head[4] = spr_soos_face_surprise
												head[5] = spr_soos_face_happy
												head[6] = spr_soos_face_happy
											}
											else {
												text[4] = "Those are some creepy #trees, dude..."
												text[5] = "Don't stay still or #something is bound to #attack..."
												head[4] = spr_soos_face_neutral_side
												head[5] = spr_soos_face_disappoint
											}
											break
										case ow_fst_2_pz1:
											text[4] = "This puzzle is even #easier than my first...&You really need help?"
											text[5] = "Turn all those triangles #into circles, dude."
											text[6] = "If there's a square, #reset the puzzle using #that lever."
											head[4] = spr_soos_face_happy_side
											head[5] = spr_soos_face_happy_closed
											head[6] = spr_soos_face_happy
											break
										case ow_fst_5_pz2:
										case ow_fst_6_pz3:
										case ow_fst_8_pz4:
										case ow_fst_9_pz5:
										case ow_fst_10_pz6:
										case ow_fst_11_pz7:
										case ow_fst_13_pz8:
										case ow_fst_14_pz9:
										case ow_fst_15_pz10:
										case ow_fst_16_pz11:
											text[4] = "These puzzles are all the #same, dude..."
											text[5] = "Turn all the triangles #into circles."
											text[6] = "You don't really need #my help here."
											head[4] = spr_soos_face_disappoint_side
											head[5] = spr_soos_face_neutral
											head[6] = spr_soos_face_neutral_side
											break
										case ow_fst_7_stanco:
										case ow_cav_2_standco:
											text[4] = "What kind of hint do you #need??"
											text[5] = "You got the amazing #Mr. Pines right in front #of you!"
											text[6] = "Take a few moments to #bask in his glory, dude!"
											head[4] = spr_soos_face_surprise
											head[5] = spr_soos_face_happy
											head[6] = spr_soos_face_happy
											break
										case ow_fst_12_robbie:
											text[4] = "Yeah, that's my #coworker's old #boyfriend..."
											text[5] = "He acts tough, but he #won't hit someone who #doesn't move..."
											text[6] = "He's super obsessed with #my coworker, so maybe get #him talking?"
											head[4] = spr_soos_face_disappoint_side
											head[5] = spr_soos_face_happy_closed
											head[6] = spr_soos_face_contempt
											break
										case ow_fst_17_sheriff:
											text[3] = "Hey, dude, you're almost #to the town!"
											text[4] = "I knew you could make it!"
											text[5] = ". . ."
											text[6] = "Well, I'm glad you made #it, at least..."
											head[3] = spr_soos_face_surprise
											head[4] = spr_soos_face_happy
											head[5] = spr_soos_face_neutral
											head[6] = spr_soos_face_happy_side
											break
										case ow_fst_18_town_0:
										case ow_fst_18_waterTower:
										case ow_fst_19_town_1:
										case ow_fst_19_determinedNews:
										case ow_fst_19_greasys:
											text[3] = "Welcome to Gravity Falls, #dude!"
											text[4] = "Take a look around!&There's a lot to do!"
											text[5] = "You can visit the Mystery #Shack to the east, too!"
											text[6] = "Enemies will only get #harder, so please...&Stay in town..."
											head[3] = spr_soos_face_happy
											head[4] = spr_soos_face_happy_side
											head[5] = spr_soos_face_happy
											head[6] = spr_soos_face_disappoint
											break
										case ow_fst_20_town_2:
											text[3] = "Welcome to the Mystery #Shack, dude!"
											text[4] = "This is where I work, for #the kind, honest Mr. #Stan Pines!"
											text[5] = "Take a look inside, dude!&You'll like what you see!"
											head[3] = spr_soos_face_happy
											head[4] = spr_soos_face_happy_closed
											head[5] = spr_soos_face_happy
											break
										default:
											text = [text[0], "(...no answer.&(You must have a bad #connection.)"];
											head = [];
											break
									}
									for(var i = 1; i < array_length(text); i++) sound[i] = tlk_soos
									array_push(text, "Click *");
								}
								audio_play_sound(sfx_comlink,0,false)
								break
						}
					}
					audio_play_sound(sfx_select,0,false)
				}
				else if keyboard_check_pressed(vk_shift) {menu[0] = 0; canMove = true; audio_play_sound(sfx_beep,0,false)}
			}
			else if global.menu[0] == 0 draw_text_color(55,197,"ITEM",c_yellow,c_yellow,c_yellow,c_yellow,1)
			else if global.menu[0] == 2 draw_text_color(55,269,"COMLINK",c_yellow,c_yellow,c_yellow,c_yellow,1)
		break
		case 2://Item
			draw_text_color(55,197,"ITEM",c_yellow,c_yellow,c_yellow,c_yellow,1)
			{
				var page_number = floor(global.menu[1] / 8); // 0 or 1
				var inv = "";
				for(var i = 0, base = 8 * page_number; i < 8; i++) {
					var item_name = global.inventory[base + i];
					if (item_name != ITEM_INDEX.NONE) {
						inv += global.ITEM_INFO[item_name].name;
					}
					inv += "\n";
				}
				draw_text_ext(212,78,inv,32,1500);
				if (multipage) {
					// align the page number right above the DRO of DROP
					draw_text(212 + string_width("USE   INFO  "), 340, string_concat(page_number + 1, "/2"));
				}
				draw_text(212, multipage ? 372 : 340, "USE   INFO  DROP");
			}
			if !instance_exists(obj_textbox_old) {
				if global.inventory[global.menu[1]] == ITEM_INDEX.NONE if !scr_menu_itemSelect(1) menu[0] = 1
				draw_sprite(soul_sprite,0,202,92+32*global.menu[1])
				if keyboard_check_pressed(vk_down) scr_menu_itemSelect(1) // TODO: Swap this out for the standard item select
				if keyboard_check_pressed(vk_up) scr_menu_itemSelect(-1) // TODO: ...just redo this entire thing. It's not worth it
				if keyboard_check_pressed(vk_enter) {
					if global.inventory[global.menu[1]] != ITEM_INDEX.NONE {
						menu = [3,0];
						audio_play_sound(sfx_select,0,false);
					}
				}
				else if keyboard_check_pressed(vk_shift) {
					menu[0] = 1;
					audio_play_sound(sfx_beep,0,false)
				}
			}
			else {
				draw_text_color(212,78+32*global.menu[1],global.ITEM_INFO[global.inventory[global.menu[1]]].name,c_yellow,c_yellow,c_yellow,c_yellow,1)
				switch menu[1] {
					case 0: draw_text_color(212,340,"USE",c_yellow,c_yellow,c_yellow,c_yellow,1) break
					case 1: draw_text_color(212+string_width("USE   "),340,"INFO",c_yellow,c_yellow,c_yellow,c_yellow,1) break
					case 2: draw_text_color(212+string_width("USE   INFO  "),340,"DROP",c_yellow,c_yellow,c_yellow,c_yellow,1) break
				}
			}
		break
		case 3://Item action
			draw_text_color(55,197,"ITEM",c_yellow,c_yellow,c_yellow,c_yellow,1)
			{
				var page_number = floor(global.menu[1] / 8); // 0 or 1
				var inv = ""
				for(var i = 0, base = 8 * page_number; i < 8; i++) {
					var item_name = global.inventory[base + i];
					if (item_name != ITEM_INDEX.NONE) {
						inv += global.ITEM_INFO[item_name].name;
					}
					inv += "\n";
				}
				draw_text_ext(212,78,inv,32,1500);
				draw_text_color(212,78+32*global.menu[1],global.ITEM_INFO[global.inventory[global.menu[1]]].name,c_yellow,c_yellow,c_yellow,c_yellow,1);
				if (multipage) {
					// align the page number right above the DRO of DROP
					draw_text(212 + string_width("USE   INFO  "), 340, string_concat(page_number + 1, "/2"));
				}
				draw_text(212, multipage ? 372 : 340, "USE   INFO  DROP");
			}
			draw_sprite(soul_sprite,0,202 + string_width("USE   ")*menu[1],352);
			if keyboard_check_pressed(vk_right) {
				menu[1]++;
				if menu[1] > 2 menu[1] = 0;
				audio_play_sound(sfx_beep,0,false);
			}
			if keyboard_check_pressed(vk_left)  {
				menu[1]--;
				if menu[1] < 0 menu[1] = 2;
				audio_play_sound(sfx_beep,0,false);
			}
			if keyboard_check_pressed(vk_enter) {
				var item_name = global.inventory[global.menu[1]];
				var item = global.ITEM_INFO[item_name];
				
				menu[0] = 2
				if !audio_is_playing(sfx_heal) audio_play_sound(sfx_select,0,false)
			}
			else if keyboard_check_pressed(vk_shift) {menu[0] = 2; audio_play_sound(sfx_beep,0,false)}
		break
		case 4://Journal
			draw_text_color(55,233,"JOURNAL",c_yellow,c_yellow,c_yellow,c_yellow,1)
			draw_text(208,78,"\""+global.player.name+"\"")
			draw_text(208,138,"LV "+string(global.player.lv))
			draw_text(208,168,string_concat("HP ", global.player.hp, "/", global.player.maxHp));
			draw_text(208,198,"Stan Bucks "+string(global.player.money));
			if global.player.genocide == RUN.ACTIVE draw_set_color(c_red);
			else if global.player.genocide == RUN.ABORTED draw_set_color(c_fuchsia);
			draw_text(208,258,"KILLED: "+string(global.player.kills));
			draw_set_color(c_white)
			if global.player.kills == 0 and global.enemy_spared[ENEMY.SOOS] draw_set_color(c_lime)
			draw_text(208,288,"SPARED: "+string(global.player.spares));
			draw_set_color(c_white)
			var wp = "Imagination";
			var df = "Dreams";
			if !instance_exists(obj_bill_overworld) {
				if global.player.mabel {
					if global.player.at == AT_DF.NONE wp = "Creativity"
					else if global.player.at == AT_DF.BASE wp = "Grapple Hook"
					else wp = "Cannon in Dm";
					if global.player.at == AT_DF.NONE df = "Gma's Sweater";
					else if global.player.at == AT_DF.BASE df = "SStar Sweater"
					else df = "Mothy Sweater"
				}
				else {
					if global.player.at == AT_DF.NONE wp = "Strong Will";
					else if global.player.at == AT_DF.BASE wp = "NYARF Gun"
					else wp = "MAN o' War";
					if global.player.df == AT_DF.NONE df = "Curiosity"
					else if global.player.df == AT_DF.BASE df = "PTree Hat"
					else df = "Newspaper Hat";
				}
			}
			draw_text(208,348,"AT: "+wp)
			draw_text(208,378,"DF: "+df)
			draw_sprite_stretched(spr_menuIcons,(global.player.at == AT_DF.UPGRADE) ? 3 : 2,492,351,18,18)
			draw_sprite_stretched(spr_menuIcons,(global.player.df == AT_DF.UPGRADE) ? 5 : 4,492,381,18,18)
			draw_sprite_stretched(spr_menuIcons,(global.player.bag == BAG.BOTH or global.player.bag == BAG.SHOULDER_BAG) ? 7 : 6,432,411,18,18)
			draw_sprite_stretched(spr_menuIcons,(global.player.bag == BAG.BOTH or global.player.bag == BAG.PIGGER_BAG)   ? 9 : 8,462,411,18,18)
			draw_sprite_stretched(spr_menuIcons,(global.player.coupon) ? 11 : 10,492,411,18,18)
			draw_text(208,408,scr_format_time());
			if keyboard_check_pressed(vk_shift) {menu[0] = 1; audio_play_sound(sfx_beep,0,false)}
		break
	}
}