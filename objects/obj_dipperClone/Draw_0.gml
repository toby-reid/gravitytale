if (obj_dipper.y >= y)
{
    shader_set(shd_desaturate);
    draw_self();
    shader_reset();
}
