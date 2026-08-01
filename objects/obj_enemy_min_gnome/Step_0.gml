if (!revealed)
{
    if (is_leader && alarm[4] == -1 && image_alpha == 1)
    {
        alarm[4] = 300;
    }
}
else if (!initial_round)
{
    if (is_leader)
    {
        if (global.stage[0] == 4 && !instance_exists(obj_textBubble_old))
        {
            ++global.stage[0];
            object_index.initial_round = true;
        }
    }
}
else
{
    event_inherited();
}
