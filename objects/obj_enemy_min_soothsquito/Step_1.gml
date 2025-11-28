///@desc Dying / Round Reset
if (self.spare or self.image_xscale >= 2)
{
    if (self.hp <= 0 and global.stage[0] != 3)
    {
        hp = 0
        obj_battleCore.text[0] = obj_battleCore.text[0]
        if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
        image_alpha -= .05
        if image_alpha == 0 instance_destroy()
        instance_destroy(bubble)
    }
}
else if ((global.stage[0] == 2 or global.stage[0] == 3) and global.stage[1] == 0 and global.enemy[global.stage[2]] == id and global.stage[4] > 0)
{
    // Unlike with the Mockroach, we don't want a damage sound effect to play;
    // A miss is a miss with the Soothsquito if it's too small
    global.stage[4] = 0;
}

if global.stage[0] == 5 {timer = 0; create = true}