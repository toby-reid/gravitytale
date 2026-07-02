///@desc Override - Dying / Round Reset
if (hp <= 0)
{
    if (global.stage[0] != 3)
    {
        hp = 0;
        if (image_alpha == 1) audio_play_sound(sfx_enemyDead, 0, false);
        image_alpha -= .05;
        if (image_alpha == 0) instance_destroy();
        instance_destroy(obj_textBubble);
    }
}
else if (global.player.hp <= 0)
{
    global.player.hp = 0;
    scr_diedToEnemy(ENEMY.PACIFICA);
}
else if (global.stage[0] == 5 && timer > 0)
{
    timer = 0;
    tried_shot = false;
    if (rounds_left > 0)
    {
        --rounds_left;
        if (player_stuck_for > 0)
        {
            --player_stuck_for;
        }
        else if (rounds_left == 0)
        {
            spare = true;
            obj_battleCore.text[0] = string_concat("The game is over.&", name, " rests her club.");
        }
    }
}
else if (player_stuck_for > 0 && instance_exists(obj_battleTarget) && obj_battleTarget.alarm[0] > -1)
{
    obj_battleTarget.stop_the_bar(); // immediately stop
    obj_battleCore.text[0] = "You're having a hard time #attacking with all this #@ff00ffperfume@ffffff.";
}
