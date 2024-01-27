/// @description Attack
if global.stage[0] == 4 { if !instance_exists(obj_textBubble) {
	switch timer {
		case 0:
			if spare timer = 479
			else {
				for(var i = 0; i < 4; i++) with paintings[i] {
					direction = point_direction(x,y,320+lengthdir_x(85,i*90-45),320+lengthdir_y(85,i*90-45))
					speed = point_distance(x,y,320+lengthdir_x(85,i*90-45),320+lengthdir_y(85,i*90-45)) / 30
				}
				image_alpha = 0
			}
			break
		case 30:
			obj_ford_ow_1.speed = 0
			x = paintings[painting].x
			y = paintings[painting].y
			image_alpha = 1
			break
		case 60://flash old frame
		case 180:
		case 300:
			image_alpha = 0
			paintings[painting].image_index++
			audio_play_sound(sfx_ding,0,false)
			break
		case 80://flash new frame
		case 200:
		case 320:
			paintings[painting].image_index--
			var dest = irandom(3)
			while dest == painting dest = irandom(3)
			painting = dest
			paintings[painting].image_index++
			audio_play_sound(sfx_ding,0,false)
			image_index = painting%2
			break
		case 100:
		case 220:
		case 340:
			paintings[painting].image_index--
			break
		case 120://zoomy zoomy
		case 240:
		case 360:
			instance_create_layer(x,y,layer,obj_atk_beaver)
			x = paintings[painting].x
			y = paintings[painting].y
			image_alpha = 1
			with obj_atk_beaver {
				sprite_index = spr_atk_cat4
				image_angle = point_direction(x,y,other.x,other.y)
				image_xscale = point_distance(x,y,other.x,other.y)
				image_yscale = 10
				if global.stage[1] == 1 and global.stage[5] == 1 at = 0//mirrored
				else at = other.at
			}
			audio_play_sound(sfx_alertAtk,0,false)
			break
		case 168://bye-bye attack beam
		case 288:
		case 408:
			instance_destroy(obj_atk_beaver)
			break
		case 450://return to base
			for(var i = 0; i < 4; i++) with paintings[i] {
				direction = point_direction(x,y,320+lengthdir_x(100,dir),120+lengthdir_y(100,dir))
				speed = point_distance(x,y,320+lengthdir_x(100,dir),120+lengthdir_y(100,dir)) / 30
			}
			image_alpha = 0
			break
		case 480:
			obj_ford_ow_1.speed = 0
			global.stage[0]++
			image_alpha = 1
			x = paintings[painting].x
			y = paintings[painting].y
			break
	}
	if instance_exists(obj_atk_beaver) with obj_atk_beaver if at == 0 if place_meeting(x,y,obj_soul) {
		other.spare = true
		other.timer = 407
		other.image_xscale = 0
		other.image_yscale = 0
		obj_battleCore.text[0] = "Gotcha!&You captured a spectacular #spectacle spectre!"
		instance_destroy()
		audio_play_sound(sfx_heal,0,false)
	}
	timer++
}}
else if !spare {//rotating frames
	for(var i = 0; i < 4; i++) with paintings[i] {
		dir++
		if dir >= 360 dir -= 360
		x = 320+lengthdir_x(100,dir)
		y = 120+lengthdir_y(100,dir)
		image_alpha = other.image_alpha
	}
	x = paintings[painting].x
	y = paintings[painting].y
	if image_alpha < 1 image_alpha += .05
}