obj_dipper.x = return_point.x + 10;
obj_dipper.y = return_point.y + 10;
obj_dipper.image_alpha = 1;
audio_stop_sound(sfx_fall);
audio_play_sound(sfx_slurp, 0, false);
audio_sound_gain(mus_medium, 1, 0.5);
flash_alpha = 1;
self.alarm[1] = 30;
