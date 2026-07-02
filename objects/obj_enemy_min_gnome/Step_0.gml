if (!revealed)
{
    if (alarm[4] == -1 && image_alpha == 1)
    {
        if (stacked_gnome == noone)
        {
            alarm[4] = 300;
        }
        revealed = true;
    }
}
else if (!initial_round)
{
    if (stacked_gnome == noone)
    {
        if (global.stage[0] == 4 && !instance_exists(obj_textBubble))
        {
            ++global.stage[0];
            initial_round = true;
        }
    }
    else
    {
        initial_round = true;
    }
}
else
{
    event_inherited();
}
