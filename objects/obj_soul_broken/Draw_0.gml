switch stage {
	case 0: draw_self() break
	case 1:
		draw_sprite_general(spr_soul_broken,0,0,0,8,8,x,y,1,1,image_angle,image_blend,image_blend,image_blend,image_blend,1)
		draw_sprite_general(spr_soul_broken,0,8,0,8,8,xstart-(x-xstart),y,1,1,-1*image_angle,image_blend,image_blend,image_blend,image_blend,1)
		draw_sprite_general(spr_soul_broken,0,0,8,8,8,x,ystart-(y-ystart),1,1,-1*image_angle,image_blend,image_blend,image_blend,image_blend,1)
		draw_sprite_general(spr_soul_broken,0,8,8,8,8,xstart-(x-xstart),ystart-(y-ystart),1,1,image_angle,image_blend,image_blend,image_blend,image_blend,1)
		image_angle += 15
		if y-ystart >= 480 {
			stage++
			audio_play_sound(mus_gameover,0,true)
			alarm[1] = 5
			speed = 0
		}
	break
	case 2://fade-in Game Over
		if alpha < 1 alpha += .02
		else {
			charCount += .2
			draw_set_font(fnt_basic_gui)
			var _drawx = 50
			var _drawy = 272
			draw_text(_drawx+irandom(2)-1,_drawy+irandom(2)-1,"*")
			_drawx += string_width("* ")
			for(var i = 1; i <= charCount and i <= string_length(text); i++) {
				if i >= charCount-10 draw_set_font(fnt_bill_gui)
				if i == charCount-10 _drawy += 2
				var char = string_copy(text,i,1)
				if char == "&" {
					draw_set_font(fnt_basic_gui)
					_drawx = 50
					_drawy += 35
					draw_text(_drawx+irandom(2)-1,_drawy+irandom(2)-1,"*")
					_drawx += string_width("* ")
				}
				else if char == "#" {
					draw_set_font(fnt_basic_gui)
					_drawx = 50+string_width("* ")
					_drawy += 35
				}
				else {
					draw_text(_drawx+irandom(2)-1,_drawy+irandom(2)-1,string_copy(text,i,1))
					_drawx += string_width(string_copy(text,i,1))
				}
			}
			if charCount > string_length(text)+9 if keyboard_check_pressed(vk_enter) {
				instance_destroy()
				if(!scr_load(true)) game_restart();
			}
		}
		if keyboard_check_pressed(vk_shift) charCount = string_length(text)+10
		draw_sprite_ext(spr_gameOver,0,320,128,2,2,0,c_white,alpha)
	break
}
if image_angle != 0 switch angle {
	case 90: image_angle -= 2 break
	case 180: image_angle -= 4 break
	case 270: image_angle += 2 break
}