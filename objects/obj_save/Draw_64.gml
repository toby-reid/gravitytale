if (state != 0)
{
    draw_sprite_ext(spr_savebox, 0, 320, ybox, savebox_size, savebox_size, 0, c_white, 1);
    draw_set_font(fnt_basic_gui);
    if (state == 2 || state == 3)
    {
        if (state == 3)
        {
            draw_set_colour(c_yellow);
        }
        draw_text(140, ybox - 67, profile.name);
        draw_text(280, ybox - 67, string_concat("LV ", profile.lv));
        draw_set_halign(fa_right);
        draw_text(500, ybox - 67, profile.play_time);
        draw_set_halign(fa_left);
        draw_text(140, ybox - 17, profile.room_name);
        if (state == 2)
        {
            var _color = action_save ? c_yellow : c_white;
            draw_text_colour(169, ybox + 36, "Save", _color, _color, _color, _color, 1);
            _color = action_save ? c_white : c_yellow;
            draw_text_colour(320, ybox + 36, "Return", _color, _color, _color, _color, 1);
        }
        else
        {
            draw_text(169, ybox + 36, "Game has been saved!");
            draw_set_colour(c_white);
        }
    }
}
