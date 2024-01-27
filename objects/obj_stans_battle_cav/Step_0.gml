/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) {
	if global.stage[0] == 4 {
		if stage == 0 {
			stage++
			global.stage[0]++
			audio_stop_sound(mus_birds)
			audio_play_sound(mus_songMightPlay,0,true)
			audio_play_sound(mus_songMightPlay,0,true)
			path_end()
			y = ystart
			path_start(pth_float,.4,path_action_restart,false)
		}
		else {
			if timer%120 == 0 with instance_create_layer(440-240*irandom(1),360,layer,obj_battleAttack) {
				at = other.at
				sprite_index = spr_stans_atk_cane
				if x > 320 image_xscale = -2
				hspeed = image_xscale/2
			}
			if timer >= 300 global.stage[0]++
		}
		timer++
		index = spr_stans_head_neutral
		bubbleText = "c'mon, kid, let's finish this."
	}
	sprite_index = spr_stans_head_neutral
}
else if stage == 0 if bubble.page == 4 sprite_index = spr_stans_head_joke