///@desc in-game menu & barbell
/*if barbell > 0 {
	camera_set_view_size(camera_get_active(),320-(barbell/4),240-(barbell/3))
	draw_rectangle_color(0,0,640,barbell,0,0,0,0,false)
	draw_rectangle_color(0,480,640,480-barbell,0,0,0,0,false)
	if canMove
		barbell -= 4
}
if !canMove {
	if barbell < 60
		barbell += 4
}*/

if menu[0] > 0 {
	if global.player[player.mabel] var index = spr_soulM
	else var index = spr_soul
	draw_sprite(spr_menu,0,30,60)
	if menu[0] > 1 {
		draw_sprite(spr_menu,1,30,60)
		if menu[0] == 4 draw_sprite(spr_menu,2,30,60)
	}
	draw_set_color(c_white)
	draw_set_font(fnt_basic_bubble)
	draw_text_ext(46,106,"LV  "+string(global.player[player.lv])+"\nHP  "+string(global.player[player.hp])+"/"+string(global.player[player.maxhp])+"\n$   "+string(global.player[player.money]),18,200)
	draw_set_font(fnt_basic_gui)
	draw_text(43,69,global.player[player.name])
	draw_sprite_stretched(spr_menuIcons,global.player[player.mabel],142,72,18,18)
	draw_text(55,197,"ITEM")
	draw_text(55,233,"JOURNAL")
	if global.player[player.nyarf] > 1 draw_text(55,269,"COMLINK")
	switch menu[0] {
		case 1://select
			if !instance_exists(obj_textbox) {
				draw_sprite(index,0,46,209+global.menu[0]*36)
				if keyboard_check_pressed(vk_down) {global.menu[0]++; if global.menu[0]>2 or (global.menu[0]>1 and global.player[player.nyarf]<2) global.menu[0]=0; audio_play_sound(sfx_beep,0,false)}//if global.menu[0]==0 or (global.menu[0]==1 and global.player[player.nyarf]>1) {global.menu[0]++; audio_play_sound(sfx_beep,0,false)}
				if keyboard_check_pressed(vk_up) {global.menu[0]--; if global.menu[0]<0 {if global.player[player.nyarf]>1 global.menu[0]=2; else global.menu[0]=1}; audio_play_sound(sfx_beep,0,false)}//if global.menu[0] > 0 {global.menu[0]--; audio_play_sound(sfx_beep,0,false)}
				if keyboard_check_pressed(vk_enter) {
					switch global.menu[0] {
						case 0:
							var haveItem = false
							for(var i = 0; i <= 7; i++) if global.inventory[i] != item.none haveItem = true
							if haveItem menu[0] = 2
							else with instance_create_layer(320,192,"Instances",obj_textbox) text = ["(You don't have any Items.&(What's the point of looking?)"]
							break
						case 1: menu[0] = 4 break
						case 2:
							if global.killed[enemy.soos] or instance_exists(obj_bill_overworld) with instance_create_layer(320,192,"Instances",obj_textbox) text = ["(You tried to contact Soos...`````#...but there was no answer.)"]
							else with instance_create_layer(160,192,"Instances",obj_textbox) {
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
								text[array_length(text)] = "Click *"
							}
							audio_play_sound(sfx_comlink,0,false)
							break
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
			var inv = ""
			for(var i = 0; i < 8; i++) inv += string(global.item_index[# global.inventory[i],item_info.name])+"\n"
			draw_text_ext(215,78,inv,32,1500)
			draw_text(212,340,"USE   INFO  DROP")
			if !instance_exists(obj_textbox) {
				if global.inventory[global.menu[1]] == item.none if !scr_menu_itemSelect(1) menu[0] = 1
				draw_sprite(index,0,204,92+32*global.menu[1])
				if keyboard_check_pressed(vk_down) scr_menu_itemSelect(1)
				if keyboard_check_pressed(vk_up) scr_menu_itemSelect(-1)
				if keyboard_check_pressed(vk_enter) {if global.inventory[global.menu[1]] != item.none {menu = [3,0]; audio_play_sound(sfx_select,0,false)}}
				else if keyboard_check_pressed(vk_shift) {menu[0] = 1; audio_play_sound(sfx_beep,0,false)}
			}
			else {
				draw_text_color(215,78+32*global.menu[1],global.item_index[# global.inventory[global.menu[1]],item_info.name],c_yellow,c_yellow,c_yellow,c_yellow,1)
				switch menu[1] {
					case 0: draw_text_color(212,340,"USE",c_yellow,c_yellow,c_yellow,c_yellow,1) break
					case 1: draw_text_color(212+string_width("USE   "),340,"INFO",c_yellow,c_yellow,c_yellow,c_yellow,1) break
					case 2: draw_text_color(212+string_width("USE   INFO  "),340,"DROP",c_yellow,c_yellow,c_yellow,c_yellow,1) break
				}
			}
		break
		case 3://Item action
			draw_text_color(55,197,"ITEM",c_yellow,c_yellow,c_yellow,c_yellow,1)
			var inv = ""
			for(var i = 0; i < 8; i++) inv += global.item_index[# global.inventory[i],item_info.name]+"\n"
			draw_text_ext(215,78,inv,32,640)
			draw_text_color(215,78+32*global.menu[1],global.item_index[# global.inventory[global.menu[1]],item_info.name],c_yellow,c_yellow,c_yellow,c_yellow,1)
			draw_text(212,340,"USE   INFO  DROP")
			draw_sprite(index,0,202+string_width("USE   ")*menu[1],352)
			if keyboard_check_pressed(vk_right) {menu[1]++; if menu[1] > 2 menu[1] = 0; audio_play_sound(sfx_beep,0,false)}
			if keyboard_check_pressed(vk_left)  {menu[1]--; if menu[1] < 0 menu[1] = 2; audio_play_sound(sfx_beep,0,false)}
			if keyboard_check_pressed(vk_enter) {
				var it = global.inventory[global.menu[1]]
				switch menu[1] {
					case 0://Use
						if global.player[player.hp] >= global.player[player.maxhp] with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You were going to eat the #"+global.item_index[# global.inventory[global.menu[1]],item_info.name]+", #but your HP was already full.)"
						else {
							switch it {
								case item.refreshing_pizza: with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You tried to eat the pizza, #but it is still regenerating.&(Have patience, you monster.)" break
								case item.infinite_pizza: global.inventory[global.menu[1]] = item.refreshing_pizza break
								case item.cookie3: global.inventory[global.menu[1]] = item.cookie2 break
								case item.cookie2: global.inventory[global.menu[1]] = item.cookie1 break
								case item.cookie1: global.inventory[global.menu[1]] = item.cookie0 break
								case item.cookie0: with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You gnawed on the glass, #but it didn't taste very good.)" break
								case item.milk: global.inventory[global.menu[1]] = item.milk2 break
								case item.onion02: case item.onion03: case item.onion04: case item.onion05: case item.onion06: case item.onion07: case item.onion08: case item.onion09: case item.onion10: case item.onion11: case item.onion12: case item.onion13: case item.onion14: case item.onion15: case item.onion16:
									global.inventory[global.menu[1]] = it+1
									break
								//case item.fairy_dust: with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(What are you doing?&(Don't use that on yourself!&(Wait til you're in battle!)" break
								
							}
							var restore = string(global.item_index[# it,item_info.heal])
							if restore == "-1" {
								restore = "All"
								global.player[player.hp] = global.player[player.maxhp]
							}
							else {
								global.player[player.hp] += global.item_index[# it,item_info.heal]
								if global.player[player.hp] > global.player[player.maxhp] global.player[player.hp] = global.player[player.maxhp]
							}
							if !instance_exists(obj_textbox) with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = restore+" HP restored.&"+global.item_index[# it,item_info.response]
							if restore != "0" audio_play_sound(sfx_heal,0,false)
							if it == global.inventory[global.menu[1]] and it != item.refreshing_pizza and it != item.cookie0 /*and it != item.fairy_dust*/ 
								global.inventory[global.menu[1]] = item.none//if inventory slot hasn't been changed
						}
					break
					case 1://Info
						if it == item.spaghetti var restore = "all"
						else var restore = global.item_index[# it,item_info.heal]
						if !instance_exists(obj_textbox) with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = global.item_index[# it,item_info.name]+" - Restores "+string(restore)+" HP.&"+global.item_index[# it,item_info.desc]
					break
					case 2://Drop
						switch it {
							case item.infinite_pizza:
							case item.refreshing_pizza:
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You tried tossing the pizza, #but it reversed time...&(May the guilt crush you.)"
								break
							case item.cookie3:
								global.inventory[global.menu[1]] = item.cookie2
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You threw away Slow's Cookie.&(You have 2 cookies left.)"
								break
							case item.cookie2:
								global.inventory[global.menu[1]] = item.cookie1
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You threw away Slow's Cookie.&(1 cookie remains in the jar.)"
								break
							case item.cookie1:
								global.inventory[global.menu[1]] = item.cookie0
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You threw away Slow's Cookie.&(Congratulations!&(It's now just an empty jar.)"
								break
							case item.cookie0:
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You were going to throw away #Slow's Cookie Jar, but you liked #its articulate design too much.)"
								break
							case item.onion02: case item.onion03: case item.onion04: case item.onion05: case item.onion06: case item.onion07: case item.onion08: case item.onion09: case item.onion10: case item.onion11: case item.onion12: case item.onion13: case item.onion14: case item.onion15: case item.onion16:
								global.inventory[global.menu[1]] = it+1
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You peeled off a layer of the #onion and tossed it away.&(Now you're making *me* cry.)"
								break
							case item.onion01:
								global.inventory[global.menu[1]] = item.none
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You threw the rest of the onion #into the sunlight.&(It'll get brown and hairy soon.)"
								break
							default:
								with instance_create_layer(160,192,"Instances",obj_textbox) text[0] = "(You threw away "+string_copy(global.item_index[# it,item_info.name],1,13)+".)&Whooh! Whatever that was, #it's gone forever!"
								global.inventory[global.menu[1]] = item.none
								break
						}
					break
				}
				menu[0] = 2
				if !audio_is_playing(sfx_heal) audio_play_sound(sfx_select,0,false)
			}
			else if keyboard_check_pressed(vk_shift) {menu[0] = 2; audio_play_sound(sfx_beep,0,false)}
		break
		case 4://Journal
			draw_text_color(55,233,"JOURNAL",c_yellow,c_yellow,c_yellow,c_yellow,1)
			draw_text(208,78,"\""+global.player[player.name]+"\"")
			draw_text(208,138,"LV "+string(global.player[player.lv]))
			draw_text(208,168,"HP "+string(global.player[player.hp])+"/"+string(global.player[player.maxhp]))
			draw_text(208,198,"Stan Bucks "+string(global.player[player.money]))
			if global.player[player.runActive] == 2 draw_set_color(c_red)
			draw_text(208,258,"KILLED: "+string(global.player[player.kills]))
			draw_set_color(c_white)
			if global.player[player.kills] == 0
				if global.spared[enemy.soos] draw_set_color(c_lime)
			draw_text(208,288,"SPARED: "+string(global.player[player.spares]))
			draw_set_color(c_white)
			var wp = "MAN o' War"
			var df = "Newspaper Hat"
			if instance_exists(obj_bill_overworld) {wp = "Imagination"; df = "Dreams"}
			else if global.player[player.mabel] {
				if global.player[player.nyarf] == 0 wp = "Creativity"
				else if global.player[player.nyarf] < 4 wp = "Grapple Hook"
				if global.player[player.nyarf] != 3 and global.player[player.nyarf] != 5
					df = "SStar Sweater"
				else df = "Mothy Sweater"
			}
			else {
				if global.player[player.nyarf] < 4 wp = "NYARF Gun"
				if global.player[player.nyarf] < 2 df = "Curiosity"
				else if global.player[player.nyarf] mod 2 == 0 df = "PTree Hat"
			}
			draw_text(208,348,"AT: "+wp)
			draw_text(208,378,"DF: "+df)
			draw_sprite_stretched(spr_menuIcons,2+(wp == "MAN o' War"),492,351,18,18)
			draw_sprite_stretched(spr_menuIcons,4+(df == "Mothy Sweater" or df == "Newspaper Hat"),492,381,18,18)
			draw_sprite_stretched(spr_menuIcons,6+(global.player[player.bonus]%2 != 0),432,411,18,18)
			draw_sprite_stretched(spr_menuIcons,8+(global.player[player.bonus]==2 or global.player[player.bonus]==3 or global.player[player.bonus]>=6),462,411,18,18)
			draw_sprite_stretched(spr_menuIcons,10+(global.player[player.bonus] > 3),492,411,18,18)
			var time = [string(global.player[player.hours]),string(global.player[player.minutes]),string(global.player[player.seconds])]
			for(var i = 0; i < 3; i++) if string_length(time[i]) < 2 time[i] = "0"+time[i]
			draw_text(208,408,time[0]+":"+time[1]+":"+time[2])
			if keyboard_check_pressed(vk_shift) {menu[0] = 1; audio_play_sound(sfx_beep,0,false)}
		break
	}
}