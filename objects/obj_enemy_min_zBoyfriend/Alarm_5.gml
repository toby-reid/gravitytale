if (spare)
{
    if (revealed && !instance_exists(obj_textBubble))
    {
        if (image_alpha == 1)
        {
            audio_play_sound(sfx_enemyDead, 0, false);
            m_create_gnomes();
        }
        image_alpha -= 0.02;
        obj_enemy_min_gnome.image_alpha = 1 - image_alpha;
        if (image_alpha == 0)
        {
            instance_destroy();
        }
    }
    alarm[5] = 1;
}
