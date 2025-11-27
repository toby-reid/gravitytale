///@desc Dying / Round Reset
if hp < 1
{
    if (self.spare)
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
    else
    {
        self.image_alpha = 1;
        self.hp = 1;
        global.stage[4] = 0;
        if instance_exists(obj_nyarfGun) obj_nyarfGun.hp = self.maxhp;
    }
}

if global.stage[0] == 5 {timer = 0; create = true}