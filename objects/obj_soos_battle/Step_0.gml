/// @description Attack
if image_alpha == 1 if global.stage[0] == 4 if hp > 0 {
	if !instance_exists(obj_textBubble) {
		if stage < 18 switch attack {
			case 0://Burrito Bites
				if timer == 0 instance_create_layer(320,252,"Instances",obj_atk_soos_bBites)
				if timer == 420 global.stage[0]++
				break
			case 1://Fists
				if timer%30 == 0 instance_create_layer(96+15*(timer%60),160,"Instances",obj_atk_soos_fist)
				if timer == 300 global.stage[0]++
				break
			case 2://Question Mark
				with instance_create_layer(320,114,"Instances",obj_atk_beaver) {
					direction = other.angle
					if global.player.hp <= 3 or other.stage >= 13 speed = 3
					else speed = 10
					sprite_index = spr_atk_soos_qMark
					image_index = other.timer%2
					at = other.at
				}
				angle += angDir
				if angle == 270+16*angDir or (angle==270 and (global.player.hp<=3 or stage>=12)) {angle = 270+64*angDir; angDir = -1*angDir}
				if timer == 360 global.stage[0]++
				break
			case 3://Screwdriver
				if timer == 15 {
					var screws = []
					while array_length(screws) < 5 - 2*(global.player.hp <= 3) {
						var screw = irandom(8)
						var create = true
						var total = 0
						for(var i = 0; i < array_length(screws); i++) {total += screws[i]; if screws[i] == screw create = false}
						if create and !(total+screw==6 and array_length(screws)==2) {
							if screw <= 3 {
								with instance_create_layer(244+152*irandom(1),368-32*screw,layer,obj_atk_soos_sDriver_screw) {
									if x < 320 image_angle = 180
								}
							}
							else {
								with instance_create_layer(128+32*screw,258+124*irandom(1),layer,obj_atk_soos_sDriver_screw) {
									if y < 320 image_angle = 90
									else image_angle = 270
								}
							}
							screws[array_length(screws)] = screw
						}
					}
				}
				if timer == 240 global.stage[0]++
				break
		}
		else global.stage[0]++
		if stage < 13 sprite_index = spr_soos_face_disappoint_side
		image_index = 0
		timer++
	}
	else {
		if variable_instance_exists(instance_find(obj_textBubble,0),"charCount") {
			if obj_textBubble.image_xscale == 2 {
				if obj_textBubble.charCount < string_length(obj_textBubble.text[obj_textBubble.page]) {
					image_index += .1; 
				} 
				else image_index = 0
			}
		}
		if hp <= 0 {
			if global.player.genocide = RUN.ACTIVE {
				if obj_textBubble.page == 1 sprite_index = spr_soos_face_surprise_side
			}
			else if spare switch obj_textBubble.page {
				case 2: sprite_index = spr_soos_face_surprise_side break
				case 3: sprite_index = spr_soos_face_disappoint_closed break
				case 4: sprite_index = spr_soos_face_sad break
				case 5: sprite_index = spr_soos_face_sad_closed break
			}
			else switch obj_textBubble.page {
				case 1: sprite_index = spr_soos_face_disapsmile_closed break
				case 2: sprite_index = spr_soos_face_disapsmile break
				case 3: sprite_index = spr_soos_face_disappoint_closed break
				case 4: sprite_index = spr_soos_face_disapsmile break
				case 5: sprite_index = spr_soos_face_disapsmile_side break
				case 6: sprite_index = spr_soos_face_disappoint_closed break
			}
		}
	}
}