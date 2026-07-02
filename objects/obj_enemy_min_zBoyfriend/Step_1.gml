///@desc Override - Dying / Round Reset
if hp <= 0
{
    hp = 0;
    if (global.stage[0] != 3)
    {
        obj_battleCore.text[0] = "It's Gnomes.&Of course it's Gnomes.&It's always Gnomes.";
       	if image_alpha == 1
        {
            audio_play_sound(sfx_enemyDead,0,false);
            m_create_gnomes();
        }
       	image_alpha -= .02;
        obj_enemy_min_gnome.image_alpha = 1 - image_alpha;
       	if image_alpha == 0
        {
            instance_destroy();
        }
       	instance_destroy(obj_textBubble);
    }
}

if (global.player.hp <= 0)
{
    scr_diedToEnemy(ENEMY.ZOMBIE_BOYFRIEND);
}

if global.stage[0] == 5 {timer = 0;}
