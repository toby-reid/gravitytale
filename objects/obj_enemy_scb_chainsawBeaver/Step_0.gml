/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if stage == -1 {
		/*switch timer {
			case 10: case 150: case 360: audio_play_sound(sfx_gobberRoar,0,false) break
			case 300: audio_play_sound(sfx_click,0,false); image_blend = c_white break
			case 480: stage++; global.stage[0]++ break
		}*/
		stage++
		global.stage[0]++
		image_blend = c_white
		//audio_play_sound(mus_thundersnail,0,true)
	}
	else {
		switch timer {
			case 0:
				with instance_create_layer(480,320,"Instances",obj_atk_beaver) {image_angle=90; hspeed=-2.5; at = other.at}
				with instance_create_layer(544,272,"Instances",obj_atk_beaver) {image_angle=90; hspeed=-2.5; at = other.at}
				with instance_create_layer(544,368,"Instances",obj_atk_beaver) {image_angle=90; hspeed=-2.5; at = other.at}
				with instance_create_layer(608,320,"Instances",obj_atk_beaver) {image_angle=90; hspeed=-2.5; at = other.at}
				break
			case 75:
				with instance_create_layer(160,320,"Instances",obj_atk_beaver) {image_angle=270; hspeed=3; at = other.at}
				with instance_create_layer( 96,272,"Instances",obj_atk_beaver) {image_angle=270; hspeed=3; at = other.at}
				with instance_create_layer( 96,368,"Instances",obj_atk_beaver) {image_angle=270; hspeed=3; at = other.at}
				with instance_create_layer( 32,320,"Instances",obj_atk_beaver) {image_angle=270; hspeed=3; at = other.at}
				break
			case 180: global.stage[0]++ break
		}
	}
	timer++
}