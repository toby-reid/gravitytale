switch stage
{
    case 0:
        if (obj_dipper.y <= 100 || (obj_dipper.y <= 120 && obj_dipper.x >= 120))
        {
            obj_dipper.canMove = false;
            alarm[2] = 60;
            audio_stop_all();
            ++stage;
        }
        break;
    case 1:
        if (alarm[2] == -1)
        {
            obj_dipper.dir = DIRECTION.DOWN;
            audio_play_sound(sfx_applause, 0, false);
            alarm[2] = ceil(game_get_speed(gamespeed_fps) * audio_sound_length(sfx_applause));
            ++stage;
        }
        break;
    case 2:
        if (darkout_alpha < 0.75)
        {
            darkout_alpha += 0.005;
        }
        if (alarm[2] == -1)
        {
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([
                    "OH?",
                    "COULD IT BE...?",
                    string_concat("MY ONE TRUE LOVE?", global.player.mabel ? "" : "`&NO...")
                ]);
                if (!global.player.mabel)
                {
                    set_text("IT'S THE ONE WHO'S COME #BETWEEN US.", array_length(m_text));
                }
                set_sounds(tlk_gideon);
            }
            ++stage;
        }
        break;
    case 3:
        if (!instance_exists(obj_textbox))
        {
            alarm[2] = 60;
            ++stage;
        }
        break;
    case 4:
        if (alarm[2] == -1)
        {
            audio_play_sound(mus_love_0, 1, true);
            current_beat = 1;
            current_measure = 1;
            alarm[4] = beat_time;
            event_perform(ev_alarm, 3);
            ++stage;
        }
        break;
    case 5: // intro sequence
        break;
    case 6: // first stanza
    case 7: // second stanza (repeat of first)
    case 8: // third stanza (change)
    case 9: // fourth stanza (final)
        // TODO: Modify text offset
        break;
    case 10: // ending note
        if (alarm[6] == -1)
        {
            if (darkout_alpha > 0)
            {
                darkout_alpha -= 0.0025;
            }
            else
            {
                darkout_alpha = 0;
                with instance_create_layer(160, 192, layer, obj_textbox)
                {
                    set_text([
                        "SO SAD.",
                        string_concat("SO SAD THAT YOU'VE DECIDED TO #", global.player.mabel ? "REJECT MY GENEROUS PROPOSAL" : "COME BETWEEN US AND OUR LOVE", "."),
                        "I HAVE A SOLUTION TO THAT.",
                        "A CERTAIN LIGHT-BENDING CRYSTAL #I FOUND IN THE WOODS.",
                        string_concat("NOW YOU", global.player.mabel ? "'LL ALWAYS BE MINE" : " CAN'T GET IN THE WAY", "."),
                        string_concat(global.player.mabel ? "YOU" : "SHE", "'LL LEARN TO LOVE ME.&I'LL WAIT AN ETERNITY TO #SEE IT HAPPEN.")
                    ]);
                    set_sounds(tlk_gideon);
                }
                ++stage;
            }
        }
        break;
    case 11:
        if (!instance_exists(obj_textbox))
        {
            audio_play_sound(sfx_click, 0, false);
            audio_play_sound(mus_shrinkRay, 0, true);
            alarm[2] = 120;
            ++stage;
        }
        break;
    case 12:
        if (alarm[2] == -1)
        {
            obj_dipper.image_xscale -= 0.005;
            obj_dipper.image_yscale -= 0.005;
            if (obj_dipper.image_xscale <= 0.01)
            {
                audio_stop_sound(mus_shrinkRay);
                audio_play_sound(sfx_click, 0, false);
                alarm[2] = 60;
                ++stage;
            }
        }
        break;
    case 13:
        if (alarm[2] == -1)
        {
            audio_play_sound(sfx_click, 0, false);
            audio_play_sound(mus_shrinkRay, 0, true);
            alarm[2] = 60;
            ++stage;
        }
        break;
    case 14:
        if (alarm[2] == -1)
        {
            with instance_create_layer(obj_dipper.x - 10, obj_dipper.y - 10, layer, obj_toRoom)
            {
                goto = ow_ttn_03_start;
                music = silence;
                dir = DIRECTION.DOWN;
            }
            obj_dipper.canMove = true;
            global.gideon_tent = 1;
            ++stage;
        }
        break;
    case 15:
        // Wait for obj_toRoom
        break;
}
