draw_self()
switch stage {
	case 1: if !instance_exists(obj_textbox) {
		with instance_create_layer(0,0,"Instances",obj_toBattle) {
			music = mus_ghostFight
			goto = btl_scb_11_blendin
		}
		global.dir = 4
		stage++
	} break
	case 2: if !instance_exists(obj_toBattle) {
		if global.enemy_killed[ENEMY.BLENDIN] {
			if scr_getKillCount(ENEMY.BLENDIN) > 0 with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"d... did you just...",
					"did you reset the timeline #just to kill me again?",
					"well, it won't work...",
					"i'm going to use the one trick #i have left...",
					"run away!",
					"i'll be back...&eventually..."
				]
				sound = [tlk_blendin,tlk_blendin,tlk_blendin,tlk_blendin,tlk_blendin,tlk_blendin]
			}
			else with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"m-my body is a temple!&how dare you!",
					"i-i'll be back...&eventually..."
				]
				sound = [tlk_blendin,tlk_blendin]
			}
			scr_killedEnemy(ENEMY.BLENDIN);
		}
		else if global.enemy_spared[ENEMY.BLENDIN] {
			if scr_getKillCount(ENEMY.BLENDIN) > 0 with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"thanks for letting me talk...",
					"i've never really had a friend #before...",
					"but you're different, #aren't you?",
					"you killed me in another timeline...",
					"but you came back to spare me...",
					"i'll repay you eventually, #remember that...",
					"thank you."
				]
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_blendin
			}
			else with instance_create_layer(160,192,"Instances",obj_textbox) {
				text = [
					"thanks for letting me talk...",
					"i've never really had a friend #before...",
					"i'm blendin, by the way...&blendin blenjamin blandin...",
					"i guess i should know your name, #right?",
					". . .",
					"@ffff00"+string_lower(global.player.name)+"@ffffff...?&weird name...",
					"i guess it is from the past #though, huh?",
					"well, i'd better get going...&i'll see you around...",
					"friend."
				]
				for(var i = 0; i < array_length(text); i++) sound[i] = tlk_blendin
			}
			sprite_index = spr_blendin_r_hair
			scr_sparedEnemy(ENEMY.BLENDIN);
		}
		else {room_persistent = false; room_restart()}
		stage++
	} break
	case 3:
		if !instance_exists(obj_textbox) {
			if timer == 0 audio_play_sound(sfx_fadeWhite,0,false)
			if timer < 20 drawx += 3
			else if timer < 30 drawx++
			else if timer < 40 drawx--
			else if timer < 60 drawx -= 3
			else if timer ==60 {audio_stop_sound(sfx_fadeWhite); audio_play_sound(sfx_ding,0,false)}
			else if timer < 65 draw_rectangle_color(0,0,320,240,c_white,c_white,c_white,c_white,false)
			else {
				audio_play_sound(mus_ruins,0,true)
				audio_play_sound(mus_ruins,0,true)
				with instance_create_layer(0,0,"Instances",obj_randBattle) loc = AREA.SCUTTLEBUTT;
				instance_destroy()
			}
			timer++
			for(var i = -1; i <= 1; i += 1/3) draw_sprite_ext(spr_blendin_r,3*(i+4/3),x+i*drawx,y,-1,1,0,c_white,.5)
		}
		else obj_dipper.canMove = false
		break
}