if (global.gideon >= 3)
{
    layer_set_visible(layer_get_id("Tiles_1"), false);
    layer_set_visible(layer_get_id("Tiles_2"), true);
}

self.music = audio_is_playing(mus_medium) ? mus_medium : mus_wind;
