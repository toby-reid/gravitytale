/// @description music gain
if !audio_is_playing(mus_allstar) audio_play_sound(mus_allstar,0,true)
audio_sound_gain(mus_allstar,(30-point_distance(x,y+10,obj_dipper.x,obj_dipper.y))/30,0)
