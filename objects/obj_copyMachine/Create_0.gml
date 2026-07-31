event_inherited();

make_clone = function() {
    audio_play_sound(sfx_printer, 0, false);
    alarm[0] = ceil(game_get_speed(gamespeed_fps) * audio_sound_length(sfx_printer));
    obj_dipper.canMove = false;
    with obj_textbox
    {
        setMove = false;
    }
}
