switch state
{
    case 0:
        if (is_interaction())
        {
            obj_dipper.canMove = false;
            ybox = get_ybox();
            with instance_create_layer(160, ybox, layer, obj_textbox)
            {
                if (global.player.genocide == RUN.ACTIVE)
                {
                    var _remaining = global.MAX_KILLS[other.loc] - global.areaKills[other.loc];
                    var _text = (_remaining > 0) ? string_concat(_remaining, " left") : (global.player.mabel ? "Immolation" : "Devastation");
                    set_text(string_concat("@ff0000", _text, "."));
                }
                else
                {
                    set_text(other.text);
                }
                set_sounds(silence);
                set_actions(array_length(m_text) - 1, method({target: other.id}, function() { target.state = 1; }));
            }
            profile = scr_getSaveProfile();
            global.player.hp = global.player.maxHp;
            audio_play_sound(sfx_heal, 0, false);
        }
        break;
    // Case 1 is while growing
    case 2:
        if (action_save)
        {
            ++state;
            scr_save(rmName, music, true);
            profile.name = global.player.name;
            profile.lv = global.player.lv;
            profile.play_time = scr_format_time();
            profile.room_name = rmName;
        }
        else
        {
            state = 4;
        }
        break;
    case 3:
        ++state;
        break;
    // Case 4 is while shrinking
}
