image_speed = 0
if canMove {
	if keyboard_check(vk_down) {
		if !place_meeting(x,y+1.5,obj_collide) {y += 1.5; image_speed = 1}
		if((dir==0 and !keyboard_check(vk_right)) or (dir==1 and !keyboard_check(vk_up)) or (dir==2 and !keyboard_check(vk_left))) dir = 3
	}
	if keyboard_check(vk_right) {
		if !place_meeting(x+1.5,y,obj_collide) {x += 1.5; image_speed = 1}
		if((dir==1 and !keyboard_check(vk_up)) or (dir==2 and !keyboard_check(vk_left)) or (dir==3 and !keyboard_check(vk_down))) dir = 0
	}
	if keyboard_check(vk_up) {
		if !place_meeting(x,y-1.5,obj_collide) {y -= 1.5; image_speed = 1}
		if((dir==0 and !keyboard_check(vk_right)) or (dir==2 and !keyboard_check(vk_left)) or (dir==3 and !keyboard_check(vk_down))) dir = 1
	}
	if keyboard_check(vk_left) {
		if !place_meeting(x-1.5,y,obj_collide) {x -= 1.5; image_speed = 1}
		if((dir==0 and !keyboard_check(vk_right)) or (dir==1 and !keyboard_check(vk_up)) or (dir==3 and !keyboard_check(vk_down))) dir = 2
	}
	if global.player[player.mabel] {
		if string_lower(global.player[player.name]) == "waddle" sprite_index = spr_mabdles
		else sprite_index = spr_mabel
	}
	else {
		if string_lower(global.player[player.name]) == "lamby" sprite_index = spr_diplamb
		else if global.player[player.nyarf] < 2 /*or global.costume == 0*/ sprite_index = spr_dipper
		else if(global.player[player.nyarf] == 3 or global.player[player.nyarf] == 5) /*and global.costume == 2*/ sprite_index = spr_dippaper
		else if string_lower(global.player[player.name]) == "mason" sprite_index = spr_dipstar
		else sprite_index = spr_diphat
	}
	if x != xprevious or y != yprevious moving = true
	else moving = false
	if fixCollide > 0 {fixCollide--; while place_meeting(x,y,obj_collide) {x += lengthdir_x(1,90*dir); y += lengthdir_y(1,90*dir)}}
}
else moving = false
if image_speed == 0 image_index = 2*floor(image_index/2)
switch dir {
	case 0: if image_index >= 2 image_index = 0 break
	case 1: if image_index >= 6 or image_index < 2 image_index = 2 break
	case 2: if image_index >= 8 or image_index < 6 image_index = 6 break
	case 3: if image_index < 8 image_index = 8 break
}