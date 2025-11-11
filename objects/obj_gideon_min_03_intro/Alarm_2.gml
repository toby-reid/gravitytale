/// @description Turn on the lights!

layer_set_visible(layer_get_id("Tiles_1"), false);
layer_set_visible(layer_get_id("Tiles_2"), true);
layer_set_visible(layer_get_id("Tiles_3"), true);
audio_play_sound(sfx_pound, 0, false);
self.alarm[3] = 300;
