///@desc Override - Dying / Round Reset
if (revealed)
{
    if (hp <= 0)
    {
        if (global.stage[0] != 3)
        {
            hp = 0
            obj_battleCore.text[0] = obj_battleCore.text[0]
            if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
            image_alpha -= .05
            if image_alpha == 0 instance_destroy()
            instance_destroy(bubble)
        }
    }
    else if (!spare && hp == 1)
    {
        spare = true;
        obj_battleCore.text[0] = "The Wizard decides to Spare you #as a last-ditch effort.";
    }
}
else if (!m_enemy_exists())
{
    array_push(global.enemy, id);
}
else if ((global.stage[0] == 2 or global.stage[0] == 3) and global.stage[1] == 0 and global.enemy[global.stage[2]] == id and global.stage[4] > 0)
{
    // Can't shoot if not revealed
    global.stage[4] = 0;
}

if global.stage[0] == 5 {timer = 0;}
