if (instance_exists(obj_dipper) && obj_dipper.y < y)
{
    draw_sprite(spr_gideon_doll, 0, x, y);
    if (is_flaming)
    {
        draw_self();
    }
}
