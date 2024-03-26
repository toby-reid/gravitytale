if !instance_exists(obj_toBattle) {
	draw_self()
	draw_set_font(fnt_basic_gui)
	var enemyExists = false
	for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) enemyExists = true
	if enemyExists battle = true
	if enemyExists switch global.stage[0] {
		case 0:
			if !instance_exists(global.enemy[global.stage[2]]) scr_btl_enemySelect(1)
			if keyboard_check_pressed(vk_right) {global.stage[1]++; audio_play_sound(sfx_beep,0,false)}
			if keyboard_check_pressed(vk_left)  {global.stage[1]--; audio_play_sound(sfx_beep,0,false)}
			if global.stage[1] == -1 global.stage[1] = 3
			if global.stage[1] ==  4 global.stage[1] = 0
			if keyboard_check_pressed(vk_enter) {
				audio_play_sound(sfx_select,0,false)
				if global.stage[1] == 2 {for(var i = 0; i <= 7 and global.stage[0] == 0; i++) if global.inventory[i] != item.none global.stage[0]++}//Returns if no items.
				else global.stage[0]++
			}
			var drawx = 55
			var drawy = 269
			draw_text(drawx,drawy,"*")
			drawx += string_width("* ")
			for(var j = 1; j <= charCount and j <= string_length(text[0]); j++) {
				var char = string_copy(text[0],j,1)
				if char == "&" {
					drawx = 55
					drawy += 35
					draw_text(drawx,drawy,"*")
					drawx += string_width("* ")
				}
				else if char == "#" {
					drawx = 55+string_width("* ")
					drawy += 35
				}
				else if char == "@" {
					j += 6
				}
				else {
					draw_text(drawx,drawy,char)
					drawx += string_width(char)
				}
			}
			charCount += .5
			if keyboard_check_pressed(vk_shift) charCount = string_length(text[0])
		break
		case 1:
			switch global.stage[1] {
				case 0: case 1://Enemy select
					if keyboard_check_pressed(vk_down) scr_btl_enemySelect(1)//if global.stage[2] < array_length_1d(global.enemy)-1 {global.stage[2]++; audio_play_sound(sfx_beep,0,false)}
					if keyboard_check_pressed(vk_up) scr_btl_enemySelect(-1)//if global.stage[2] > 0 {global.stage[2]--; audio_play_sound(sfx_beep,0,false)}
					if keyboard_check_pressed(vk_enter) if instance_exists(global.enemy[global.stage[2]]) {
						global.stage[0]++
						if global.stage[1] == 0 {
							instance_create_layer(39,257,"Instances",obj_battleTarget)
							global.stage[4] = -1
						}
						audio_play_sound(sfx_select,0,false)
					}
					for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) {//name list. battleEnemy should have spare t/f and name ""
						if global.enemy[i].spare draw_text_color(55+string_width("* "),269+35*i,global.enemy[i].name,c_yellow,c_yellow,c_yellow,c_yellow,1)
						else draw_text(55+string_width("* "),269+35*i,global.enemy[i].name)
						if global.stage[1] == 0 draw_healthbar(55+string_width(global.enemy[i].name+"*  "),277+35*i,135+string_width(global.enemy[i].name+"*  "),293+35*i,100*(global.enemy[i].hp/global.enemy[i].maxhp),c_red,c_lime,c_lime,0,true,false)
						if global.stage[2] != i draw_text(55,269+35*i,"*")
					}
				break
				case 2://inventory. 0 > 2 \n 1 > 3; 4 > 6 \n 5 > 7
					if keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) scr_btl_itemSelect(0)
					else if keyboard_check_pressed(vk_right) scr_btl_itemSelect(1)
					else if keyboard_check_pressed(vk_left) scr_btl_itemSelect(-1)
					if keyboard_check_pressed(vk_enter) if global.inventory[global.stage[3]] != item.none {
						var it = global.inventory[global.stage[3]]
						switch it {
							case item.refreshing_pizza: text[1] = "You tried to eat the pizza, #but it is still reforming.&Grow some patience, you monster." break
							case item.infinite_pizza: global.inventory[global.stage[3]] = item.refreshing_pizza break
							case item.cookie3: global.inventory[global.stage[3]] = item.cookie2 break
							case item.cookie2: global.inventory[global.stage[3]] = item.cookie1 break
							case item.cookie1: global.inventory[global.stage[3]] = item.cookie0 break
							case item.milk:	global.inventory[global.stage[3]] = item.milk2 break
							case item.onion02: case item.onion03: case item.onion04: case item.onion05: case item.onion06: case item.onion07: case item.onion08: case item.onion09: case item.onion10: case item.onion11: case item.onion12: case item.onion13: case item.onion14: case item.onion15: case item.onion16:
								global.inventory[global.menu[1]] = it+1
								break
							/*case item.fairy_dust:
								if room == btl_scb_general or room == btl_fst_general or room == btl_cav_general or instance_exists(obj_enemy_fst_gnome) {
									for(var i = 0; i < instance_number(obj_battleEnemy); i++) instance_find(obj_battleEnemy,i).sleep = true
									text[1] = "You blew the fairy dust around the #area.&Enemies fell asleep!"
								}
								else text[1] = "You tried to use the fairy dust, #but no one here is affected by it."
								global.inventory[global.stage[3]] = item.none
								break*/
							case item.holy_water:
								var enemies = [obj_enemy_scb_beaver,obj_enemy_scb_sDuck,obj_enemy_scb_merman,obj_enemy_scb_hawktopus,obj_enemy_scb_gobbie,obj_enemy_fst_plaidypus,obj_enemy_cav_scampfire,obj_enemy_cav_geodite,obj_enemy_cav_gobber,obj_enemy_min_mockroach,obj_enemy_min_zombie,obj_enemy_tnt_clone,obj_enemy_scb_chainsawBeaver,obj_enemy_cav_ghost,obj_enemy_min_zBoyfriend]
								text[0] = "You threw the bottle at the enemy.&Nothing happened.&Seems it only works on certain types."
								audio_play_sound(sfx_glass,0,false)
								for(var i = 0; i < array_length(enemies); i++) if instance_exists(enemies[i]) {
									enemies[i].hp = 0
									text[1] = "You threw the bottle at the enemy.&Undead, Water, and Abomination #types were dispelled!"
								}
								break
								
						}
						if it != item.holy_water {
							var restore = string(global.item_index[# it,item_info.heal])
							if restore == "-1" {
								restore = "All"
								global.player[player.hp] = global.player[player.maxhp]
							}
							else {
								global.player[player.hp] += global.item_index[# it,item_info.heal]
								if global.player[player.hp] > global.player[player.maxhp] global.player[player.hp] = global.player[player.maxhp]
							}
							if it != item.refreshing_pizza and it != item.cookie0 /*and it != item.fairy_dust*/ {
								if restore != "0" audio_play_sound(sfx_heal,0,false)
								if global.inventory[global.stage[3]] == it {
									global.inventory[global.stage[3]] = item.none
									if !scr_btl_itemSelect(0) scr_btl_itemSelect(1)//Selects another available item slot
								}
								text[1] = restore+" HP restored.&"+global.item_index[# it,item_info.response]
							}
							if !audio_is_playing(sfx_heal) audio_play_sound(sfx_select,0,false)
						}
						global.stage[0] = 3
						charCount = 0
					}
					for(var i = 0; i < 4; i++) {
						draw_text(55+272*floor(i/2)+string_width("* "),269+35*(i%2),string_copy(global.item_index[# global.inventory[(4*floor(global.stage[3]/4))+i],item_info.name],1,13))
						if i!=global.stage[3] if i+4!=global.stage[3] if global.inventory[(4*floor(global.stage[3]/4))+i]!=item.none draw_text(55+272*floor(i/2),269+35*(i%2),"*")
					}
					var pages = 1
					for(var i = 4*(-1*floor(global.stage[3]/4)+1); i < 4*(-1*floor(global.stage[3]/4)+2); i++) if global.inventory[i] != item.none pages = 2
					
					draw_text(407,339,"Page "+string(floor(global.stage[3]/4)*(pages-1)+1)+" of "+string(pages))
				break
				case 3:
					global.stage[4] = 0
					global.stage[0]++
				break
			}
			if keyboard_check_pressed(vk_shift) if !keyboard_check(vk_enter) {global.stage[0]--; audio_play_sound(sfx_beep,0,false); charCount = 0}
		break
		case 2:
			switch global.stage[1] {
				case 0://Fight bar. nothing needed here.
				break
				case 1://Action list
					if keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) {if global.stage[5]%2 == 0 global.stage[5]++; else global.stage[5]--; audio_play_sound(sfx_beep,0,false)}
					if keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left) {global.stage[5]+=2; if global.stage[5]>3 global.stage[5]-=4; audio_play_sound(sfx_beep,0,false)}
					if keyboard_check_pressed(vk_enter) {
						var e = global.enemy[global.stage[2]]
						e.alarm[global.stage[5]] = 1
						charCount = 0
						global.stage[0]++
						audio_play_sound(sfx_select,0,false)
						if global.stage[5] == 0 text[1] = string_upper(e.name)+" - AT "+string(e.at)+" HP "+string(e.hp)+"&"+e.check
					}
					else if keyboard_check_pressed(vk_shift) {global.stage[0]--; audio_play_sound(sfx_beep,0,false)}
					for(var i = 0; i < 4; i++) {
						draw_text(55+272*floor(i/2)+string_width("* "),269+70*(i%2),global.enemy[global.stage[2]].act[i])
						if i != global.stage[5] draw_text(55+272*floor(i/2),269+70*(i%2),"*")
					}
				break
				case 2://Items should skip global.stage[0] == 2.
				break
				case 3://Spare or run
					if keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_up) {global.stage[4]=1-global.stage[4]; audio_play_sound(sfx_beep,0,false)}
					if keyboard_check_pressed(vk_enter) {//alarm[5] and [6] are for Spare / Run
						for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[global.stage[4]+5] = 1
						if global.stage[4] == 1 global.stage[0] = 3
						else {
							global.stage[0] = 4
							obj_soul.x = 320
							obj_soul.y = 320
							obj_soul.xstart = 320
							obj_soul.ystart = 320
							for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[4] = 1//alarm[4] is textbubble
						}
						audio_play_sound(sfx_select,0,false)
					}
					else if keyboard_check_pressed(vk_shift) {global.stage[0] = 0; audio_play_sound(sfx_beep,0,false)}
					draw_text_ext(55+string_width("* "),269,"Spare\nRun",35,1500)
					for(var i=0;i<array_length(global.enemy);i++) if instance_exists(global.enemy[i]) if global.enemy[i].spare {draw_text_color(55+string_width("* "),269,"Spare",c_yellow,c_yellow,c_yellow,c_yellow,1); break}
					draw_text(55,269+35*abs(global.stage[4]-1),"*")
				break
			}
		break
		case 3:
			if global.stage[1] != 3 {
				charCount += .5
				if global.stage[1] != 0 {
					var drawx = 55
					var drawy = 269
					draw_text(drawx,drawy,"*")
					drawx += string_width("* ")
					for(var j = 1; j <= charCount and j <= string_length(text[1]); j++) {
						var char = string_copy(text[1],j,1)
						if char == "&" {
							drawx = 55
							drawy += 35
							draw_text(drawx,drawy,"*")
							drawx += string_width("* ")
						}
						else if char == "#" {
							drawx = 55+string_width("* ")
							drawy += 35
						}
						else if char == "@" {
							j += 6
						}
						else {
							draw_text(drawx,drawy,char)
							drawx += string_width(char)
						}
					}
					charCount += .5
					if keyboard_check_pressed(vk_enter) if charCount >= string_length(text[1]) {
						global.stage[0]++
						for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.enemy[i].alarm[4] = 1
					}
					if keyboard_check_pressed(vk_shift) charCount = string_length(text[1])
				}
			}
			else with obj_soul {
				if !audio_is_playing(sfx_rocket) if vspeed < 0 audio_play_sound(sfx_rocket,0,true)
				if global.player[player.mabel] sprite_index = spr_soulM_run_0
				else sprite_index = spr_soul_run_0
				vspeed -= .1
				if !global.enemy[global.stage[2]].run if y <= 264 {
					vspeed *= -1
					if global.player[player.mabel] sprite_index = spr_soulM
					else sprite_index = spr_soul
					audio_stop_sound(sfx_rocket)
					audio_play_sound(sfx_ding,0,false)
				}
				if vspeed > 0 {
					if y >= 300 {
						x = 320
						y = 320
						xstart = 320
						ystart = 320
						vspeed = 0
						if global.player[player.mabel] sprite_index = spr_soulM
						else sprite_index = spr_soul
						for(var i = 0; i < array_length(global.enemy); i++) global.enemy[i].alarm[4] = 1
						global.stage[0]++
					}
				}
				if y <= 0 {
					audio_group_stop_all(Music)
					audio_stop_sound(sfx_rocket)
					audio_group_unload(Battle)
					audio_play_sound(other.music,0,true)
					if room == btl_scb_general or room == btl_fst_general or room == btl_cav_general {
						global.battleTimer = -1740
						global.runemy = []
						for(var i = 0; i < array_length(global.enemy); i++) if instance_exists(global.enemy[i]) global.runemy[array_length(global.runemy)] = global.enemy[i].object_index
					}
					//global.player[player.money] += other.sb//you don't get money if you run!
					room_goto(other.goto)
				}
			}
		break
		case 4:
			if !instance_exists(obj_battleBox) {
				image_xscale -= .2
				if image_xscale == .6 {image_alpha = 0; instance_create_layer(320,320,"Instances",obj_battleBox)}
			}
		break
		case 5:
		default://if it's anything else
			instance_destroy(obj_battleBox)
			image_alpha = 1
			image_xscale += .2
			if image_xscale >= 2 {global.stage[0] = 0; image_xscale = 2}
			charCount = 0
		break
	}
	else {//Either Genocide "no one came" or all enemies are done
		global.runemy = []
		if global.player[player.runActive] == 2 and !battle {//Genocide
			instance_destroy(obj_soul)
			draw_text_color(55,269,"* But there was no one to fight.",c_red,c_red,c_red,c_red,1)
		}
		else if !battle {//Not geno, but a lot of deaths in this area
			instance_destroy(obj_soul)
			draw_text(55,269,"* But no one wanted to fight.")
		}
		else {//Everyone's been killed
			audio_group_stop_all(Music)
			if instance_exists(obj_soul) if lv > 0 {
				global.player[player.lv] += lv
				if global.player[player.maxhp] != 1 {
					global.player[player.maxhp] += 5*lv
					global.player[player.hp] += 5*lv
					if global.player[player.maxhp] > 99 global.player[player.maxhp] = 99
					if global.player[player.hp] > global.player[player.maxhp] global.player[player.hp] = global.player[player.maxhp]
				}
				audio_play_sound(sfx_lvup,0,false)
				for(var i = 0; i <= 7; i++) if global.inventory[i] == item.refreshing_pizza global.inventory[i] = item.infinite_pizza
			}
			instance_destroy(obj_soul)
			instance_destroy(obj_battleBox)
			image_alpha = 1
			if image_xscale == 2 {
				draw_text_ext(55,269,"* YOU WON!\n* You earned "+string(sb)+" Stan Bucks.",35,1500)
				if lv draw_text(55,339,"* Your LV and HP increased.")
			}
		}
		if keyboard_check_pressed(vk_enter) {
			if (battle or global.player[player.runActive] != 2) {
				audio_play_sound(music,0,true)
			}
			audio_group_unload(Battle)
			global.player[player.money] += sb
			room_goto(goto)
		}
		global.stage[0] = 5
		instance_destroy(obj_battleAttack)
		if image_xscale < 2 image_xscale += .2
	}

	draw_set_font(fnt_battle)
	draw_text(30,403,global.player[player.name]+"  LV "+string(global.player[player.lv]))
	draw_sprite(spr_hpkr,0,250,405)
	draw_healthbar(280,400,300+(4*global.player[player.lv]),420,100*(global.player[player.hp]/global.player[player.maxhp]),c_red,c_yellow,c_yellow,0,true,false)
	draw_text(315+(4*global.player[player.lv]),403,string(global.player[player.hp])+" / "+string(global.player[player.maxhp]))
	//if instance_exists(obj_stans_battle) we'll move that text, add a second healthbar, draw hpkr,1, and calculate Karma
	
	draw_text(0,0,music);
	draw_text(0,30,silence);
}