/// @desc end jump
obj_dipper.hspeed = 0;
obj_dipper.vspeed = 0;
audio_play_sound(is_jump_down ? sfx_fall : sfx_grass, 0, false);
if (!is_jump_down)
{
    obj_dipper.canMove = true;
}
