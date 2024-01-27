/// @description FIRE
if !audio_is_playing(sfx_zap) {audio_play_sound(sfx_zap,0,true); alarm[0] = 180; alarm[2] = 10}
else {audio_stop_sound(sfx_zap); alarm[1] = 90; obj_soul.image_index = 1}