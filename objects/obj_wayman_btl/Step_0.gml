var tracks = [mus_rushB_0,mus_rushB_1,mus_rushB_2,mus_rushB_3,mus_rushB_4,mus_rushB_5,mus_rushB_intro,mus_rushB_outro]
var playing = false
for(var i = 0; i < array_length(tracks); i++) {
	if audio_is_playing(tracks[i]) {playing = true; break}
}
if !playing {
	if stage >= 9 audio_play_sound(tracks[7],0,true)
	else audio_play_sound(tracks[irandom(5)],0,false)
}

/// @description Attack - make more mazes
if !instance_exists(bubble) {
	if global.stage[0] == 4 {
		if stage < 10 {
			var box = instance_find(obj_battleBox,0)
			if timer < 60 {
				if timer < 20 {
					box.y -= 4
					switch stage {
						case 0: drawy -= 1.95 break//51
						case 1: 
						case 2: drawy -= 1.45; y-- break//61
					
					}
				}
				else if timer < 40 switch stage {
					case 0:
						drawy += .1
						box.image_xscale -= .01
						box.image_yscale -= .005
						break
					case 1:
					case 2:
						drawy -= .9
						box.image_xscale += .0125
						box.image_yscale += .025
						break
				}
				else if timer == 40 {
					with box {
						sprite_index = spr_wayman_battleBox
						image_index = other.stage
						xscale = image_xscale
						yscale = image_yscale
						image_xscale = 1
						image_yscale = 1
					}
					switch stage {//change this later to use a 2-dimensional array instead
						case 0:
							drawy = 53
							with instance_create_layer(298,220,layer,obj_wayman_platform) {xscale = .2; yscale = 4; wipe = 1}
							with instance_create_layer(338,180,layer,obj_wayman_platform) {xscale = .2; yscale = 2; wipe = 3}
							with instance_create_layer(340,258,layer,obj_wayman_platform) {wipe = 2}
							instance_create_layer(280,280,layer,obj_wayman_mazeGoal)
							break
						case 2:
							with instance_create_layer(402,180,layer,obj_wayman_teeth) {image_angle = 270}
							with instance_create_layer(400,220,layer,obj_wayman_teeth) {image_angle = 90}
							with instance_create_layer(340,320,layer,obj_wayman_teeth) {}
							with instance_create_layer(380,322,layer,obj_wayman_teeth) {image_angle = 180}
						case 1:
							drawy = 43
							with instance_create_layer(260,298,layer,obj_wayman_platform) {xscale = 8; wipe = 2}
							with instance_create_layer(338,218,layer,obj_wayman_platform) {xscale = .2; yscale = 4.1; wipe = 3}
							with instance_create_layer(300,258,layer,obj_wayman_platform) {wipe = 2}
							with instance_create_layer(220,258,layer,obj_wayman_platform) {}
							with instance_create_layer(260,218,layer,obj_wayman_platform) {xscale = 4}
							with instance_create_layer(298,180,layer,obj_wayman_platform) {xscale = .2; yscale = 2; wipe = 3}
							with instance_create_layer(220,178,layer,obj_wayman_platform) {}
							with instance_create_layer(338,140,layer,obj_wayman_platform) {xscale = .2; yscale = 2; wipe = 3}
							with instance_create_layer(378,140,layer,obj_wayman_platform) {xscale = .2; yscale = 6; wipe = 3}
							instance_create_layer(400,160,layer,obj_wayman_mazeGoal)
							break
					}
				}
				obj_soul.x = box.x
				obj_soul.y = box.y
			}
			else if timer == 60 obj_soul.active = true
			else if timer == maxTime[stage] {
				if instance_exists(obj_wayman_mazeGoal) if !obj_wayman_mazeGoal.done {
					stageRepeating = true
					instance_destroy(obj_wayman_mazeGoal)
				}
				with box {
					image_xscale = xscale
					image_yscale = yscale
					sprite_index = spr_battleBox
					image_index = 0
				}
				with obj_wayman_platform event_perform(ev_alarm,1)
				instance_destroy(obj_wayman_teeth)
				with obj_soul {
					active = false
					hspeed = lengthdir_x(point_distance(x,y,320,240)/20,point_direction(x,y,320,240))
					vspeed = lengthdir_y(point_distance(x,y,320,240)/20,point_direction(x,y,320,240))
				}
			}
			if timer >= maxTime[stage] + 20 {
				with obj_soul {
					hspeed = 0
					vspeed = 0
					x = box.x
					y = box.y
				}
				if timer < maxTime[stage] + 40 switch stage {
					case 0:
						drawy -= .1
						box.image_xscale += .01
						box.image_yscale += .005
						break
					case 1:
					case 2:
						drawy += .9
						box.image_xscale -= .0125
						box.image_yscale -= .025
						break
				}
				else if timer < maxTime[stage] + 60 {
					switch stage {
						case 0: drawy += 1.95 break
						case 1: 
						case 2: drawy += 1.45; y++ break
					}
					box.y += 4
				}
				else {
					if !stageRepeating stage++
					drawy = 90
					obj_soul.active = true
					global.stage[0]++
				}
			}
			timer++
		}
		else {
			image_alpha -= .05
			if !audio_is_playing(sfx_enemyDead) {
				audio_group_stop_all(Wayman)
				audio_group_unload(Wayman)
				audio_play_sound(sfx_enemyDead,0,false)
			}
			if image_alpha <= 0 instance_destroy()
		}
	}
	image_speed = 1
}
else with bubble if variable_instance_exists(id,"charCount") if charCount < string_length(text[page]) other.image_speed = 3; else other.image_speed = 1