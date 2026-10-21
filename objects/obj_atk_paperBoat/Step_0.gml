if (yscale_mult < 1)
{
    yscale_mult += 0.05;
    if (yscale_mult >= 1)
    {
        yscale_mult = 1;
        alarm[1] = 30;
    }
}
else if (dummy_exists)
{
    if (alarm[1] == -1)
    {
        dummy_vspeed += dummy_gravity;
        dummy_x += dummy_hspeed;
        dummy_y += dummy_vspeed;
        if (dummy_y >= y)
        {
            dummy_exists = false;
            if (!audio_is_playing(sfx_splash))
            {
                audio_play_sound(sfx_splash, 0, false);
            }
            alarm[0] = rocking_speed;
            vspeed = -0.4;
        }
    }
}
else
{
    if (vspeed != 0 and y <= battlebox_top + 30)
    {
        vspeed = 0;
    }
    if (obj_soul.y > y)
    {
        paper_cut();
    }
}
