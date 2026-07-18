if (global.gideon == 0)
{
    instance_destroy();
    exit;
}

is_jump_down = false;
prepare_jump = function(_is_down) {
    obj_textbox.setCanMove = false;
    is_jump_down = _is_down;
    alarm[0] = 30;
}
jump = function() {
    obj_dipper.hspeed = is_jump_down ? 0.5 : 1;
    if (obj_dipper.dir == DIRECTION.LEFT)
    {
        obj_dipper.hspeed = -obj_dipper.hspeed;
    }
    obj_dipper.vspeed = -4.1; // just using the same as faith plate
    audio_play_sound(sfx_whoosh, 0, false);
    alarm[1] = 40;
}
