///@desc Dying / Round Reset
if hp <= 0 { if(global.stage[0] != 3) {
	hp = 0;
	if(sprite_index = spr_wendyne_btl_legs) {//but the earth refused to die
		if(!instance_exists(obj_textBubble)) {
			bubble = instance_create_layer(x+60,y-120,layer,obj_textBubble);
			with bubble {
				text = [
					". . .",
					"No...",
					"No...!",
					"This... can't be happening...",
					"So easily...",
					"Robbie... Soos... Dad... I'm sorry.",
					". . .",
					"No.",
					"I can't let it end like this.",
					"I WON'T let it end like this.",
					"I will destroy you, no matter what.",
					"'Cause I'm a flippin' CORDUROY!!!"
				]
			}
		}
		else {
			
		}
	}
	else if(!instance_exists(obj_textBubble)) {//actually dead
		if(image_alpha == 1) {
			audio_play_sound(sfx_enemyDead,0,false);
			global.enemy = [instance_create_layer(x,y-40,layer,obj_enemySoulBreak)];
			global.enemy[0].image_index = 3;
		}
		image_alpha -= .05
		if(image_alpha == 0) instance_destroy();
	}
}}
else if(global.stage[0] == 3 and global.stage[1] == 0 and global.stage[4] > 0 and global.stage[4] <= 10) {
	if(sprite_index == spr_wendyne_btl_legs) global.stage[4] = 999999;
	else global.stage[4] = 9*power(10,global.stage[4]);
}

if global.stage[0] == 5 {timer = 0;}