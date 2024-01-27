/// @description 
if !active {
	if obj_dipper.x >= 110 {
		obj_dipper.x -= 2
		obj_dipper.canMove = false
		obj_dipper.dir = 0
		alarm[0] = 30
	}
	if alarm[0] == -1 {
		sprite_index = spr_soos_r
		image_speed = 0
	}
}
else if !instance_exists(obj_textbox) and !instance_exists(obj_toBattle) {
	if global.killed[enemy.soos] instance_destroy()
	else if global.soos < 27 {
		with instance_create_layer(0,0,layer,obj_toBattle) {
			goto = btl_scb_22_soos
			music = mus_heartache
			prevMusic = mus_wind
		}
		global.soos = 27
	}
	else if global.soos == 27 with instance_create_layer(160,192,layer,obj_textbox) {
		setMove = true
		var slang = "dude"
		var col = "1970FF"
		if global.player[player.mabel] {slang = "Hambone"; col = "CC277A"}
		if global.spared[enemy.soos] {
			text = [
				"Well, it seems no one #will be able to stop #you...",
				"...let's hope.",
				"Good luck out there, #@"+col+global.player[player.name]+"@ffffff.",
				"Come talk to me when #you're ready to go."
			]
			head = [
				spr_soos_face_disappoint_closed,
				spr_soos_face_disappoint,
				spr_soos_face_disappoint_closed,
				spr_soos_face_neutral
			]
			global.soos = 28
		}
		else {
			text = [
				"There ya go, "+slang+"!&I knew you'd #understand...",
				"It's too dangerous for #you out there.",
				"Go back to the cabin.&I'll meet you there #soon."
			]
			head = [
				spr_soos_face_disapsmile_side,
				spr_soos_face_disapsmile,
				spr_soos_face_disapsmile_side
			]
			other.active = false
		}
		for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
	}
	else {//moving right, destroying
		sprite_index = spr_soos_r
		image_speed = 1.5
		direction = point_direction(x,y,230,120)
		speed = 2
		if x >= 228 instance_destroy()
	}
}
if instance_exists(obj_textbox) if obj_textbox.grow > 0 obj_dipper.canMove = false