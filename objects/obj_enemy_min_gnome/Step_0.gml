if (!revealed)
{
    if (alarm[4] == -1)
    {
        if (stacked_gnome == noone)
        {
            if (image_alpha == 1)
            {
                alarm[4] = 60;
            }
        }
        else
        {
            revealed = true;
        }
    }
}
else if (!initial_round)
{
    if (global.stage[0] == 4 && !instance_exists(obj_textBubble))
    {
        ++global.stage[0];
        initial_round = true;
    }
}
else
{
    event_inherited();
}
