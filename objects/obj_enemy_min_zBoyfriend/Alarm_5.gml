if (spare)
{
    if (!revealed || instance_exists(obj_textBubble))
    {
        alarm[5] = 1;
    }
    else
    {
        if (!instance_exists(obj_enemy_min_gnome))
        {
            m_create_gnomes();
        }
        event_inherited();
    }
}
