/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 path_end()
	else if timer == 60 {
		if image_index == 0 {
			direction = point_direction(x,y,480,obj_soul.y)
			speed = point_distance(x,y,480,obj_soul.y) / 90
		}
	}
	else if timer >= 90 {
		if image_index == 0 {
			image_index++
			speed = 0
			direction = 180
		}
		else if image_index == 1 {
			speed += .25
			if place_meeting(x,y,obj_soul) image_index++
			if x < -50 {
				speed = 0
				image_alpha = 0
				x = xstart
				y = ystart
				path_start(pth_float,.1,path_action_continue,false)
				global.stage[0]++
			}
		}
		else {
			if image_yscale < 2 {//splattered already
				if timer >= 60 {
					global.stage[0]++
				}
			}
			else if speed > 0 {
				speed += .5
				if x < -50 {
					speed = 0
					image_alpha = 0
					x = xstart
					y = ystart
					path_start(pth_float,.1,path_action_continue,false)
					global.stage[0]++
				}
			}
			else {
				if timer < 120 {
					x = xstart-2+2*irandom(2)
					y = ystart-2+2*irandom(2)
				}
				else if timer == 120 {
					audio_play_sound(sfx_slurp,0,false)
				}
				else if timer == 160 {
					global.player[player.hp] -= at
					audio_play_sound(sfx_damageTaken,0,false)
				}
				else if timer >= 220 {
					x = xstart
					y = ystart
					path_start(pth_float,.1,path_action_continue,false)
					global.stage[0]++
				}
			}
		}
	}
	timer++
}}
else if alarm[5] == -1 image_alpha += .05