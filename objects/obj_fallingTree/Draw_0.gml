if stage < 3 draw_self()
if instance_exists(obj_buttSwitch) if obj_buttSwitch.done switch stage {
	case 0:
		if global.player[player.runActive] == 2 {if !audio_is_playing(sfx_puzDone_distort) audio_play_sound(sfx_puzDone_distort,0,false)}
		else if !audio_is_playing(sfx_puzDone) audio_play_sound(sfx_puzDone,0,false)
		obj_dipper.canMove = false
		if image_angle < 90 or image_angle > 270 {
			rotAmt += .2*rotDir
			image_angle += rotAmt
		}
		else {
			image_angle = 90*(round(image_angle/90))
			stage++
		}
	break
	case 1:
		if image_xscale > .2 image_xscale -= .05
		else stage++
	break
	case 2:
		if image_xscale < 1 image_xscale += .02
		else {rotAmt = 0; stage++}
	break
	case 3:
		audio_stop_sound(sfx_rocket)
		for(var i = 0; i < sprite_width; i++) {
			draw_sprite_general(sprite_index,image_index,i,0,1,sprite_height,x-58*rotDir+(rotAmt*((rotAmt%2)-.5))/10,y+27-i,1,1,image_angle,c_white,c_white,c_white,c_white,1)
			rotAmt++
			image_alpha -= .01
			if rotAmt >= 100 {obj_dipper.canMove = true; instance_destroy()}
		}
	break
}