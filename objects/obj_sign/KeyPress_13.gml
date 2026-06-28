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
            set_heads(other.heads);
            set_fonts(other.fonts);
            set_styles(other.styles);
            set_sounds(other.sounds);
            set_charRates(other.charRates);
            set_choiceCounts(other.choiceCounts);
            set_actions_all(other.actions);
            for (var i = 0, _actions_length = array_length(other.actions); i < _actions_length; ++i)
            {
                var _actions = other.actions[i];
                if (is_array(_actions)) // if it's a callable or Undefined, there is no choice to make
                {
                    var _action_count = array_length(_actions);
                    if (array_length(m_choiceCounts) < i || m_choiceCounts[i] < _action_count)
                    {
                        set_choiceCount(i, _action_count);
                    }
                }
            }
            set_autoskips(other.autoskips);
            for (var i = 0, _choices_length = array_length(other.choices); i < _choices_length; ++i)
            {
                var _choices = other.choices[i];
                if (is_array(_choices) && array_length(_choices) != 0)
                {
                    set_choices(i, _choices);
                }
            }
        }
    }
    else if (place_meeting(x, y - 2, obj_dipper) && _dip_dir == 3)
    {
        with instance_create_layer(160, _ybox, layer, obj_textbox)
        {
            set_text(other.back_of_sign);
        }
    }
}
