event_inherited();

strength_uniform = shader_get_uniform(shd_desaturate, "strength");

clone_height = 0;
clone_offset = 0;

make_clone = function() {
    audio_play_sound(sfx_printer, 0, false);
    alarm[0] = 60;
    image_index = 1;
    obj_dipper.canMove = false;
    obj_dipper.dir = DIRECTION.RIGHT;
    obj_dipper.image_angle = 90;
    obj_dipper.x = x + 37;
    obj_dipper.y = y - 8;
    with obj_textbox
    {
        setMove = false;
    }
}
