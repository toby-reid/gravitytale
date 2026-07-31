if (obj_dipper.y >= y)
{
    shader_set(shd_desaturate);
    shader_set_uniform_f(strength_uniform, desaturate_strength);
    draw_self();
    shader_reset();
}
