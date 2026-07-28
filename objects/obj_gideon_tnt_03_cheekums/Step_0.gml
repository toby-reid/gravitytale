switch stage
{
    case 0:
        if (obj_dipper.canMove)
        {
            audio_play_sound(mus_dungeon, 0, false);
            obj_ford_ow_1.hspeed = 1;
            obj_ford_ow_1.image_speed = 1;
            arm_index = 1;
            text_length = 1;
            alarm[2] = BEAT_TIME;
            ++stage;
            global.gideon_tent = 3;
        }
        break;
    case 1:
        x = min(obj_dipper.x + 120, 1200);
        if (!audio_is_playing(mus_dungeon))
        {
            alarm[2] = -1;
            text_length = 0;
            obj_ford_ow_1.hspeed = 0;
            obj_ford_ow_1.image_speed = 0;
            alarm[3] = -1;
            with instance_create_layer(160, 192, layer, obj_textbox)
            {
                set_text([
                    global.player.mabel ? "OH, BUT I COULD NEVER HURT A #HAIR ON YOUR ITTY-BITTY HEAD." : "GOODNESS, THIS IS PAINFUL #TO WATCH.",
                    "I'LL JUST LET Y'ALL #GO ON."
                ]);
                set_sounds(tlk_gideon);
            }
            ++stage;
        }
        // fallthrough
    case 2:
        if (obj_ford_ow_1.x >= obj_dipper.x)
        {
            with instance_create_layer(0, 0, layer, obj_toBattle)
            {
                music = mus_dungeon;
                goto = btl_ttn_03_cheekums;
                dest = 2;
            }
            obj_dipper.x = obj_ford_ow_1.x + 1;
            if (stage == 1)
            {
                obj_ford_ow_1.hspeed = 0;
                obj_ford_ow_1.image_speed = 0;
                alarm[3] = 60;
            }
        }
        break;
}
