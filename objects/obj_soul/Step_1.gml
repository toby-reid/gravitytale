switch global.stage[0] {
	case 0://battleButtons
		x = 49+156*global.stage[1]
		y = 452
		image_alpha = 1
	break
	case 1:
		switch global.stage[1] {
			case 0: case 1: case 3://Enemy select
				x = 63 + (272 * (global.stage[2] div 3));
				y = 282 + (35 * (global.stage[2] mod 3));
			break
			case 2://item select
				x = 63+272*(floor(global.stage[3]/2)%2)
				y = 282+35*(global.stage[3]%2)
			break
		}
	break
	case 2:
		switch global.stage[1] {
			case 0:
				image_alpha = 0
			break
			case 1://Actions
				x = 63+272*floor(global.stage[5]/2)
				y = 282+70*(global.stage[5]%2)
			break
			case 2://Nothing needed.
			break
			case 3://Spare/Run
				x = 63
				y = 282+35*global.stage[4]
			break
		}
	break
	case 3:
		if global.stage[1] != 3 {
			image_alpha = 0
			x = 320
			y = 320
			xstart = 320
			ystart = 320
		}
		else if alarm[1] == -1 alarm[1] = 1
	break
	case 4:
		image_alpha = 1
		if active if instance_exists(obj_battleBox) switch image_index {
			case 0://Blue - Pine Tree
				if keyboard_check(vk_down)  if !place_meeting(x,y+2,obj_battleBox) y += self.is_slow ? 1 : 2;
				if keyboard_check(vk_up)    if !place_meeting(x,y-2,obj_battleBox) y -= self.is_slow ? 1 : 2;
				if keyboard_check(vk_right) if !place_meeting(x+2,y,obj_battleBox) x += self.is_slow ? 1 : 2;
				if keyboard_check(vk_left)  if !place_meeting(x-2,y,obj_battleBox) x -= self.is_slow ? 1 : 2;
			break
			case 1://Bluer - Gravity Falling (Ford)
				if image_angle != rot if instance_exists(obj_battleBox) {//to prevent wall warping
					x -= (x > obj_battleBox.x+40)*2
					x += (x < obj_battleBox.x-40)*2
					y -= (y > obj_battleBox.y+50)*2
					y += (y < obj_battleBox.y-50)*2
				}
				switch image_angle {
					case 0://Down/normal
						hspeed = 0
						if place_meeting(x,y+1,obj_battleBox) {
							if keyboard_check(vk_up) vspeed = -4
							else with instance_place(x,y+1,obj_battleBox) other.hspeed = hspeed
							if place_meeting(x+hspeed,y,obj_battleBox) hspeed = 0
						}
						else {
							vspeed += .2
							if keyboard_check(vk_down) vspeed += .25
							if keyboard_check(vk_up)   vspeed -= .1
						}
						if keyboard_check(vk_right) if !place_meeting(x+2,y,obj_battleBox) x+=2
						if keyboard_check(vk_left)  if !place_meeting(x-2,y,obj_battleBox) x-=2
						if place_meeting(x,y+vspeed,obj_battleBox) {vspeed = 0; while place_meeting(x,y+8,obj_battleBox) and !place_meeting(x,y+1,obj_battleBox) y++}
						while place_meeting(x,y,obj_battleBox) y--
					break
					case 90://Right
						vspeed = 0
						if place_meeting(x+1,y,obj_battleBox) {
							if keyboard_check(vk_left) hspeed = -4.5
							else with instance_place(x+1,y,obj_battleBox) other.vspeed = vspeed
							if place_meeting(x,y+vspeed,obj_battleBox) vspeed = 0
						}
						else {
							hspeed += .2
							if keyboard_check(vk_right) hspeed += .25
							if keyboard_check(vk_left)  hspeed -= .1
						}
						if keyboard_check(vk_down)  if !place_meeting(x,y+2,obj_battleBox) y+=2
						if keyboard_check(vk_up)    if !place_meeting(x,y-2,obj_battleBox) y-=2
						if place_meeting(x+hspeed,y,obj_battleBox) {hspeed = 0; while place_meeting(x+8,y,obj_battleBox) and !place_meeting(x+1,y,obj_battleBox) x++}
						while place_meeting(x,y,obj_battleBox) x--
					break
					case 180://Up
						hspeed = 0
						if place_meeting(x,y-1,obj_battleBox) {
							if keyboard_check(vk_down) vspeed = 4
							else with instance_place(x,y-1,obj_battleBox) other.hspeed = hspeed
							if place_meeting(x+hspeed,y,obj_battleBox) hspeed = 0
						}
						else {
							vspeed -= .2
							if keyboard_check(vk_up)   vspeed -= .25
							if keyboard_check(vk_down) vspeed += .1
						}
						if keyboard_check(vk_right) if !place_meeting(x+2,y,obj_battleBox) x+=2
						if keyboard_check(vk_left)  if !place_meeting(x-2,y,obj_battleBox) x-=2
						if place_meeting(x,y+vspeed,obj_battleBox) {vspeed = 0; while place_meeting(x,y-8,obj_battleBox) and !place_meeting(x,y-1,obj_battleBox) y--}
						while place_meeting(x,y,obj_battleBox) y++
					break
					case 270://Left
						vspeed = 0
						if place_meeting(x-1,y,obj_battleBox) {
							if keyboard_check(vk_right) hspeed = 4.5
							else with instance_place(x-1,y,obj_battleBox) other.vspeed = vspeed
							if place_meeting(x,y+vspeed,obj_battleBox) vspeed = 0
						}
						else {
							hspeed -= .2
							if keyboard_check(vk_left)  hspeed -= .25
							if keyboard_check(vk_right) hspeed += .1
						}
						if keyboard_check(vk_down)  if !place_meeting(x,y+2,obj_battleBox) y+=2
						if keyboard_check(vk_up)    if !place_meeting(x,y-2,obj_battleBox) y-=2
						if place_meeting(x+hspeed,y,obj_battleBox) {hspeed = 0; while place_meeting(x-8,y,obj_battleBox) and !place_meeting(x-1,y,obj_battleBox) x--}
						while place_meeting(x,y,obj_battleBox) x++
					break
				}
			break
			case 2://Orange - Boingy-Boing (Mabel)
				if keyboard_check(vk_right) if !place_meeting(x+2,y,obj_battleBox) x+=2
				if keyboard_check(vk_left)  if !place_meeting(x-2,y,obj_battleBox) x-=2
				vspeed += .1
				if place_meeting(x,y+3,obj_battleBox) vspeed = -4
				if place_meeting(x,y+vspeed,obj_battleBox) vspeed = 0
				while place_meeting(x,y,obj_battleBox) y--
			break
			case 3://Green - Shield of Shielding (Wendyne)
				x = obj_battleBox.x
				y = obj_battleBox.y
				if !instance_exists(obj_soul_3_shield) instance_create_layer(x,y,layer,obj_soul_3_shield)
				if keyboard_check_pressed(vk_down)  image_angle = 180
				if keyboard_check_pressed(vk_up)    image_angle = 0
				if keyboard_check_pressed(vk_right) image_angle = 270
				if keyboard_check_pressed(vk_left)  image_angle = 90
			break
			case 4://Yellow - Shoot-Em-Up (Gideon)
				if keyboard_check(vk_down)  if !place_meeting(x,y+2,obj_battleBox) y+=2
				if keyboard_check(vk_up)    if !place_meeting(x,y-2,obj_battleBox) y-=2
				if keyboard_check(vk_right) if !place_meeting(x+2,y,obj_battleBox) x+=2
				if keyboard_check(vk_left)  if !place_meeting(x-2,y,obj_battleBox) x-=2
				if keyboard_check_pressed(vk_enter) if instance_number(obj_soul_4_beam) < 3 instance_create_layer(x,y,layer,obj_soul_4_beam)
			break
			case 5://Magenta - Line Upon Line (Pacifica)
				if keyboard_check_pressed(vk_down) if !place_meeting(x,y+20,obj_battleBox) y+=40
				if keyboard_check_pressed(vk_up)   if !place_meeting(x,y-20,obj_battleBox) y-=40
				if keyboard_check(vk_right) if !place_meeting(x+3,y,obj_battleBox) x+=2
				if keyboard_check(vk_left)  if !place_meeting(x-3,y,obj_battleBox) x-=2
				obj_battleBox.image_index = 2
			break
			case 6://Cyan - 9-Square (McGucket)
				x = obj_battleBox.x
				y = obj_battleBox.y
				if keyboard_check(vk_down)  y+=44
				if keyboard_check(vk_up)    y-=44
				if keyboard_check(vk_right) x+=52
				if keyboard_check(vk_left)  x-=52
				obj_battleBox.image_index = 3
			break
		}
	break
	case 5:
		speed = 0
		image_angle = 0
	break
}

if alarm[0] > 0 image_blend = c_silver
if (global.player.hp <= 0) {
	global.player.hp = 0;
	if !instance_exists(obj_soul_broken) {
		instance_create_layer(x,y,layer,obj_soul_broken);
	}
}
moving = ((x != xprev) or (y != yprev));
xprev = x
yprev = y

rot = image_angle//Previous rotation, used to prevent wall warping