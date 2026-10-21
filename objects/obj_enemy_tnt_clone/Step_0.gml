/// @description Override - Attack
if (image_alpha == 1 && !instance_exists(obj_textBubble) && global.stage[0] == 4)
{
    if (timer == 0)
    {
        current_attack = choose(obj_atk_paperAirplane, obj_atk_paperBoat);
        if (!audio_is_playing(sfx_paper))
        {
            audio_play_sound(sfx_paper, 0, false);
        }
    }
    else if (timer < 20)
    {
        switch current_attack
        {
            case obj_atk_paperAirplane:
                image_xscale -= 0.1;
                break;
            case obj_atk_paperBoat:
                image_yscale -= 0.1;
                break;
        }
    }
    else if (timer == 20)
    {
        image_xscale = 0;
        instance_create_layer(x, y, layer, current_attack);
    }
    else if (timer == 420)
    {
        image_xscale = 2;
        ++global.stage[0];
    }
    else if (timer > 400)
    {
        image_xscale += 0.1;
    }
    ++timer;
}
update_flutters();
