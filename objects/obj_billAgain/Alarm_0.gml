/// @description fade to grey
alpha += .1
obj_lakeBoat.hspeed -= .2
audio_sound_gain(mus_wind,1-alpha,0)
if alpha < 1 alarm[0] = 60 - alpha*50
else {
	if !global.killed[enemy.soos] x = obj_lakeBoat.x - 60
	else x = obj_lakeBoat.x - 40
	audio_stop_all()
	audio_sound_gain(mus_wind,1,0)
}