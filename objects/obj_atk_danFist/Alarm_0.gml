/// @description Setup Mode
if flashes < 11 {flashes++; alarm[0] = 5; audio_play_sound(sfx_atkAlert,0,false)}
else {image_alpha = 1; speed = 10; audio_sound_pitch(sfx_whoosh,.75); audio_play_sound(sfx_whoosh,0,false)}