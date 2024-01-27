if(y < ystart) {
	vspeed *= .9
	image_alpha += .1
}
if ystart-y < .5 y = ystart
if image_index > 6 if sprite_index != spr_ford_atk_stabiliser_charge {
	sprite_index = spr_ford_atk_stabiliser_charge
	image_blend = color
	image_index = 0
	audio_play_sound(sfx_gaster_charge,0,false)
}