if (clone_height > 0)
{
    shader_set(shd_desaturate);
    shader_set_uniform_f(strength_uniform, desaturate_strength);
    draw_sprite_general(obj_dipper.sprite_index, 8, 0, 0, sprite_get_width(obj_dipper.sprite_index), clone_height, x + 60 + clone_height, y - 2 + clone_offset, 1, 1, 270, c_white, c_white, c_white, c_white, 1);
    shader_reset();
}
draw_self();
