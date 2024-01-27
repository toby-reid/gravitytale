var dip = spr_diphat
if global.player[player.mabel] dip = spr_mabel
else {
	if string_lower(global.player[player.name]) == "lamby" dip = spr_diplamb
	else if string_lower(global.player[player.name]) == "mason" dip = spr_dipstar
}

if !global.killed[enemy.soos] {
	if image_xscale == -1 draw_sprite_part(spr_soos_r,0,0,0,24,24,x-10,y-22)
	else draw_sprite_part(spr_soos_l,0,0,0,24,24,x-10,y-22)
	draw_sprite(dip,3+3*image_xscale,x+25*image_xscale,y+5)
}
else draw_sprite(dip,3+3*image_xscale,x,y)
draw_self()

if !audio_is_playing(mus_wind) audio_play_sound(mus_wind,0,true)