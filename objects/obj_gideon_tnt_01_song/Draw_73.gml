if (stage == 12 || stage == 14)
{
    var _target = (stage == 12) ? [obj_dipper.x, obj_dipper.y - 100] : [x + 10, y - 90];
    draw_sprite_ext(spr_cav_spotlight, 0, _target.x, _target.y - 100, 1, 1, 0, c_fuchsia, 1);
}
