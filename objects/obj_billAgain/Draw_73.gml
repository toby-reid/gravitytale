/// @description draw greyout
if stage == 0 or instance_exists(obj_textbox) {
	if alarm[0] > -1 {index += (1-alpha); if index >= 40 index -= 40}
	for(var i = 0; i < 640; i += 20) for(var j = 0; j < 240; j += 20) draw_sprite(spr_bill_greyout_lake,(index/20)+2,i,j)
	with obj_lakeBoat {
		var dip = spr_mabel
		if !global.player.mabel {
			if string_lower(global.player.name) == "lamby" dip = spr_diplamb
			else if string_lower(global.player.name) == "mason" dip = spr_dipstar
			else dip = spr_diphat
		}
		if !global.enemy_killed[ENEMY.SOOS] {
			draw_sprite_part(spr_soos_r,0,0,0,24,24,x-10,y-22)
			draw_sprite(dip,0,x-25,y+5)
		} else draw_sprite(dip,0,x,y)
		image_index = other.index/10
		draw_self()
	}
	draw_set_alpha(alpha)
	for(var i = 0; i < 640; i += 20) for(var j = 0; j < 240; j += 20) draw_sprite(spr_bill_greyout_lake,index/20,i,j)
	with obj_lakeBoat {
		var dip = spr_mabel
		if !global.player.mabel {
			if string_lower(global.player.name) == "lamby" dip = spr_diplamb
			else if string_lower(global.player.name) == "mason" dip = spr_dipstar
			else dip = spr_diphat
		}
		if !global.enemy_killed[ENEMY.SOOS] {
			draw_sprite(spr_bill_greyout_soos,0,x-10,y-22)
			draw_sprite(dip,0+6*(other.image_alpha==1),x-25,y+5)
		}
		else draw_sprite(dip,0+6*(other.image_alpha==1),x,y)
		draw_sprite_ext(spr_bill_greyout_boat,other.index/10,x,y,-1,1,0,c_white,other.alpha)
	}
	draw_set_alpha(1)
	draw_self()
}
else {
	if alarm[2] == -1 {
		alarm[2] = 120
		audio_stop_sound(mus_bestFriend)
		audio_play_sound(sfx_pound,0,false)
	}
	draw_rectangle_color(0,0,640,240,0,0,0,0,false)
}