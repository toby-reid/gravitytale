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
            // TODO: Dim the lights or something
            audio_play_sound(sfx_applause, 0, false);
            alarm[2] = 360;
            ++stage;
        }
        break;
    case 2:
        if (alarm[2] == -1)
        {
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([
                    "OH?",
                    "COULD IT BE...?",
                    string_concat(global.player.mabel ? "" : "THE MAN BETWEEN ME AND #", "MY ONE TRUE LOVE?")
                ]);
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
        if (alarm[3] == -1 && alarm[0] == -1 && alarm[1] == -1 && arm_index != 0)
        {
            arm = spr_gideon_tv_arm_talk;
            alarm[1] = alArm_speed;
        }
    case 6: // first stanza
    case 7: // second stanza (repeat of first)
    case 8: // third stanza (change)
    case 9: // fourth stanza (final)
        break;
    case 10: // ending note
        if (alarm[2] == -1)
        {
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([
                    "SO SAD.",
                    string_concat("SO SAD THAT YOU'VE DECIDED TO #", global.player.mabel ? "REJECT MY GENEROUS PROPOSAL" : "COME BETWEEN US AND OUR LOVE", "."),
                    "I HAVE A SOLUTION TO THAT.",
                    "A CERTAIN LIGHT-BENDING CRYSTAL #I FOUND IN THE WOODS.",
                    string_concat("NOW YOU", global.player.mabel ? "'LL ALWAYS BE MINE" : " CAN'T GET IN THE WAY", "."),
                    string_concat(global.player.mabel ? "YOU" : "SHE", "'LL LEARN TO LOVE ME!&I'LL WAIT AN ETERNITY TO #SEE IT HAPPEN.")
                ]);
                set_sounds(tlk_gideon);
            }
            ++stage;
        }
        break;
    case 11:
        if (!instance_exists(obj_textbox))
        {
            audio_play_sound(sfx_click, 0, false);
            audio_play_sound(sfx_shrinkRay, 0, true);
            alarm[2] = 60;
            ++stage;
        }
        break;
    case 12:
        if (alarm[2] == -1)
        {
            obj_dipper.image_xscale -= 0.001;
            obj_dipper.image_yscale -= 0.001;
            if (obj_dipper.image_xscale <= 0.01)
            {
                with instance_create_layer(obj_dipper.x - 10, obj_dipper.y - 10, layer, obj_toRoom)
                {
                    goto = ow_ttn_03_start;
                    dir = 0;
                }
                obj_dipper.canMove = true;
                global.gideon_tent = 1;
                ++stage;
            }
        }
        break;
    case 13: // wait for Dipper to shrink
        break;
}
