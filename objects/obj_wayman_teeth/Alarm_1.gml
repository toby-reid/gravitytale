/// @description Strike
image_index++
if image_index < 3 {alarm[1] = 5}
else {alarm[0] = 20; audio_play_sound(sfx_click,0,false)}