///@desc create first laser
with instance_create_layer(x,y,"Instances",obj_atk_laser) {
	image_angle = 180*(other.image_xscale < 0)
	spd = 20
}
audio_play_sound(sfx_gaster_fire,0,false)
alarm[1] = 30
obj_bill_startBattle.x -= 2*image_xscale