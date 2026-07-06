if global.battleTimer > 0 {
	if alarm[0] == -1
		global.battleTimer--
}
else if instance_exists(obj_dipper) {
	if obj_dipper.canMove and obj_dipper.moving {
		if irandom(1500) == 0 or global.battleTimer <= -1800 {
			switch loc {
				case AREA.SCUTTLEBUTT:	goto = btl_scb_general; prevMusic = mus_ruins;  break;
				case AREA.FOREST:		goto = btl_fst_general; prevMusic = mus_snowy;  break;
				case AREA.CAVES:		goto = btl_cav_general; /*prevMusic set at CC*/ break;
				case AREA.MINES:        goto = btl_min_general; prevMusic = mus_medium; break;
				// AREA.TENT should not have random encounters
			}
			if loc != AREA.UNKNOWN {
				start_alert();
			}
			else with instance_create_layer(160,192,layer,obj_textbox_old) text = ["An error has occurred.&Please report this!&Error code: @ff0000BTLOC"]
		}
		else global.battleTimer--
	}
}