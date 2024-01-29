///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}

if(global.stage[0] == 5) if(timer != 0) {
	timer = 0;
	trap--;//must be negative to re-trap
	if(trap == 0) {
		obj_soul.image_index = 0;
		if(global.wendyne < 21) global.wendyne = 21;
		obj_battleCore.text[0] = "Broke free of Wendy's trap.&You can move now.";
		run = true;
	}
	else if(trap < 0) if(irandom(abs(trap)+1) > 1) {
		trap = 1+irandom(2);
		obj_soul.image_index = 3;
		obj_battleCore.text[0] = "Seems you got caught in another #trap.&Such is life.";
		run = false;
	}
}