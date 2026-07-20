if (is_initialized)
{
    for (var i = 0; i < CAMERA_HEIGHT; ++i)
    {
        if (delta_dir[i] != 0)
        {
            --delta_delta[i];
            if (delta_delta[i] == 0)
            {
                drawx_delta[i] = (delta_dir[i] + delta_dir[i]) * irandom_range(2, 4); // scale up by 2x since we're on GUI layer
                delta_delta[i] = irandom_range(10, 30);
            }
            drawx[i] += drawx_delta[i];
            if (global.teleport)
            {
                // Don't overshoot the center
                if (drawx[i] * delta_dir[i] > 0) // if both are negative or both are positive, we've overshot it
                {
                    drawx[i] = 0;
                    delta_dir[i] = 0;
                }
            }
        }
    }
    if (global.teleport)
    {
        if (m_all_together())
        {
            global.teleport = false;
            obj_dipper.canMove = true;
            reset_init();
            var _music = mus_snowy;
            if (room == ow_min_01_dump)
            {
                _music = mus_alphys;
            }
            // TODO: Add case for UFO endpoint
            audio_play_sound(_music, 0, true);
        }
    }
    else if (alarm[0] == -1)
    {
        // time for the sendoff
        global.teleport = true;
        room_persistent = false;
        global.dir = DIRECTION.DOWN;
        var _goto = room;
        if (cantp)
        {
            switch destination
            {
                case PP_DESTINATION.FOREST:
                    _goto = ow_fst_1_meetStans;
                    break;
                case PP_DESTINATION.CAVES:
                    _goto = ow_fst_22_caves;
                    break;
                case PP_DESTINATION.DUMP:
                    _goto = ow_min_01_dump;
                    break;
                case PP_DESTINATION.UFO:
                    // TODO: Add UFO destination when applicable
                    break;
            }
        }
        room_goto(_goto);
    }
}
