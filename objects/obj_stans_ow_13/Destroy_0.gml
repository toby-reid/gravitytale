obj_dipper.canMove = true
if !audio_is_playing(mus_snowy)
	audio_play_sound(mus_snowy,0,true)
with instance_create_layer(0,0,"Instances",obj_randBattle) loc = AREA.FOREST