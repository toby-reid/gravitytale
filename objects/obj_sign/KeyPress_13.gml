if (is_interaction())
{
    var _ybox = (y > camera_get_view_y(view_camera[0]) + 140) ? 48 : 192;
    if (sprite_index != spr_sign || obj_dipper.dir != DIRECTION.DOWN)
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
    else
    {
        with instance_create_layer(160, _ybox, layer, obj_textbox)
        {
            set_text(other.back_of_sign);
        }
    }
}
