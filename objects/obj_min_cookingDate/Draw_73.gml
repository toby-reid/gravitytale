if (has_butter)
{
    var _blend = c_white;
    if (is_butter_dipped)
    {
        _blend = c_orange;
    }
    else if (is_butter_fried)
    {
        _blend = c_grey;
    }
    with obj_dipper
    {
        draw_sprite_ext(spr_butter, 0, x, y - 20, 1, 1, 0, _blend, 1);
    }
}
