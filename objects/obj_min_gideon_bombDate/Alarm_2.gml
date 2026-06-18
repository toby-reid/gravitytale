/// @desc Timer for the big boom!
audio_group_stop_all(Music);
audio_play_sound(sfx_pound, 0, false);
alarm[3] = audio_sound_length(sfx_puzDone) * gamespeed_fps;
obj_dipper.canMove = false;
done = true;
