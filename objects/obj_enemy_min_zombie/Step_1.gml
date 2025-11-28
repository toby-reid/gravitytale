///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = obj_battleCore.text[0]
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 {spare = true; obj_battleCore.text[0] = obj_battleCore.text[0]}

if (global.stage[0] == 5 and self.timer != 0)
{
    self.timer = 0;
    if (self.stench > 0)
    {
        --self.stench;
        audio_play_sound(sfx_burp, 0, false);
        if (global.player.hp > 1)
        {
            --global.player.hp;
            audio_play_sound(sfx_damageTaken, 0, false);
        }
    }
}