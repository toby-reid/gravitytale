/// @description sound
image_index++
if image_index%2 == 1 audio_play_sound(sfx_wendyne_step,0,false)
alarm[0] = 24+16*(stage==2)