/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if stage == 3 and global.stage[1] == 1 and global.stage[5] == 1 {
		if timer%5 == 0 with instance_create_layer(x+40,y-62,"Instances",obj_battleAttack) {
			sprite_index = spr_atk_merNote
			image_index = irandom(2)
			image_blend = c_aqua
			direction = irandom(60)+220
			speed = random(2)+2
			audio_sound_pitch(tlk_robbie,random(1.5)+.5)
			audio_play_sound(tlk_robbie,0,false)
		}
		if timer >= 600 global.stage[0]++
	}
	else {
		if timer == 0 instance_create_layer(320,140,"Instances",obj_robbie_attack)
		else if timer >= 420 global.stage[0]++
	}
	timer++
}