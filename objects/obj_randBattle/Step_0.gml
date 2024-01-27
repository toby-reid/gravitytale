if global.battleTimer > 0 {if alarm[0] == -1 global.battleTimer--}
else if instance_exists(obj_dipper) if obj_dipper.canMove if obj_dipper.moving {
	if irandom(1500) == 0 or global.battleTimer <= -1800 {
		switch loc {
			//area.unknown will not be necessary.
			case area.scuttlebutt:	goto = btl_scb_general; prevMusic = mus_ruins; prevMusic_nbs = mus_ruins break
			case area.forest:		goto = btl_fst_general; prevMusic = mus_snowy; prevMusic_nbs = mus_snowy break
			case area.caves:		goto = btl_cav_general; /*prevMusic set at CC*/ break
			
			//More areas - tent, ufo
		}
		if loc != area.unknown {
			alarm[0] = 30
			audio_stop_all()
			audio_play_sound(sfx_alert,0,false)
			x = obj_dipper.x
			y = obj_dipper.y - 20
			image_alpha = 1
			obj_dipper.canMove = false
		}
		else with instance_create_layer(160,192,"Instances",obj_textbox) text = ["An error has occurred.&Please report this!&Error code: @ff0000BTLOC"]
	}
	else global.battleTimer--
}