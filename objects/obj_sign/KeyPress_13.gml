if (!instance_exists(obj_textbox) && instance_exists(obj_dipper) && obj_dipper.canMove)
{
    var _dip_dir = obj_dipper.dir;
    var _ybox = (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
    if (
        (place_meeting(x - 2, y, obj_dipper) && _dip_dir == 0)
        || (place_meeting(x, y + 2, obj_dipper) && _dip_dir == 1)
        || (place_meeting(x + 2, y, obj_dipper) && _dip_dir == 2)
        || (place_meeting(x, y - 2, obj_dipper) && _dip_dir == 3 && sprite_index != spr_sign)
    )
    {
        with instance_create_layer(160, _ybox, layer, obj_textbox)
        {
            set_text(other.text);
            set_head(other.heads);
            if (is_array(other.fonts))
            {
                set_fonts(other.fonts);
            }
            else
            {
                set_font_range(other.fonts);
            }
            if (is_array(other.styles))
            {
                set_styles(other.styles);
            }
            else
            {
                set_style_range(other.styles);
            }
            if (is_array(other.sounds))
            {
                set_sounds(other.sounds);
            }
            else
            {
                set_sound_range(other.sounds);
            }
            if (is_array(other.charRates))
            {
                set_charRates(other.charRates);
            }
            else
            {
                set_charRate_range(other.charRates);
            }
            for (var i = 0, _choiceCounts = array_length(other.choiceCounts), _choiceActions = array_length(other.choiceActions); i < _choiceCounts; ++i)
            {
                if (i < _choiceActions)
                {
                    set_choiceCount(i, other.choiceCounts[i], other.choiceActions[i]);
                }
                else
                {
                    set_choiceCount(i, other.choiceCounts[i]);
                }
            }
            for (var i = 0, _autoskips = array_length(other.autoskips); i < _autoskips; ++i)
            {
                set_autoskip(i, other.autoskips[i]);
            }
        }
    }
    else if (place_meeting(x, y - 2, obj_dipper) && _dip_dir == 3)
    { // Looking at a sign from behind
        with instance_create_layer(160, _ybox, layer, obj_textbox_old)
        {
            text = ["(You try to read the sign, #but there is nothing written #on this side.)"]
            font = [fnt_basic_gui]
            sound = [tlk_default]
            charRate = [.5]
        }
    }
}
