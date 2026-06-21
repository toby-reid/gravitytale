/// @description Teleport process (add music)
if teleport {//If we're on the front end (the starting point)
	if drawx[320] == 0 {
		screen = sprite_create_from_surface(application_surface,0,0,640,480,false,false,0,0)
		for(var i = 0; i < 320; i++) {
			drawx[i] = 0
			changeDir[i] = 2*(irandom(1)-.5)
			change[i] = changeDir[i]*2*(irandom(2)+2)
			changeChange[i] = irandom(20)+10
		}
		drawx[320] = 1
		alarm[0] = 120
		alpha = 0
		audio_stop_all()
		audio_play_sound(sfx_teleport,0,false)
	}
	draw_rectangle_color(0,0,639,479,0,0,0,0,false)
	for(var i = 0; i < 320; i++) {
		changeChange[i]--
		if changeChange[i] == 0 {change[i] = changeDir[i]*2*(irandom(2)+2); changeChange[i] = irandom(20)+10}
		drawx[i] += change[i]
		draw_sprite_part(screen,0,0,2*i,640,2,0+drawx[i],2*i)
	}
	if alarm[0] == -1 {
		global.teleport = true
		room_persistent = false
		global.dir = 3
		teleport = false
		drawx[320] = 0
		sprite_delete(screen)
		var _goto = room;
		if (cantp) switch loc {
			case 0: _goto = ow_fst_1_meetStans; break;//Forest
			case 1: _goto = ow_fst_22_caves; break;//Caves
			case 2: _goto = ow_min_01_dump; break;//Dump
			//case 3: _goto = room; break;//UFO
		}
		room_goto(_goto);
	}
	obj_dipper.canMove = false
	instance_destroy(obj_textbox_old)
	draw_set_alpha(alpha)
	draw_rectangle_color(-320,-240,960,720,0,0,0,0,false)
	draw_set_alpha(1)
}
else if global.teleport {//If we're on the back end (the destination)
	if drawx[320] == 0 {
		screen = sprite_create_from_surface(application_surface,0,0,640,480,false,false,0,0)
		for(var i = 0; i < 320; i++) {
			drawx[i] = 1360*(irandom(1)-.5)
			changeDir[i] = -1*drawx[i]/abs(drawx[i])
			change[i] = changeDir[i]*2*(irandom(2)+2)
			changeChange[i] = irandom(20)+10
		}
		drawx[320] = 1
		alpha = 1
		alarm[0] = 1
	}
	draw_rectangle_color(0,0,639,479,0,0,0,0,false)
	var together = true
	for(var i = 0; i < 320; i++) {
		changeChange[i]--
		if changeChange[i] == 0 {change[i] = changeDir[i]*2*(irandom(2)+2); changeChange[i] = irandom(20)+10}
		while (changeDir[i]>0 and drawx[i]+change[i]>0) or (changeDir[i]<0 and drawx[i]+change[i]<0) change[i]-=2*changeDir[i]
		drawx[i] += change[i]
		draw_sprite_part(screen,0,0,2*i,640,2,0+drawx[i],2*i)
		if drawx[i] != 0 together = false
	}
	if together {
		global.teleport = false
		obj_dipper.canMove = true
		drawx[320] = 0
		var _music = mus_snowy;
		if (room == ow_min_01_dump) _music = mus_alphys;
		// else if (room == UFO) _music = UFO;
		audio_play_sound(_music, 0, true)
	}
	if alarm[0] > -1 {
		draw_set_alpha(alpha)
		draw_rectangle_color(-320,-240,960,720,0,0,0,0,false)
		draw_set_alpha(1)
	}
}