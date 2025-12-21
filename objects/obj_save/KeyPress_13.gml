if save == 0 if instance_exists(obj_dipper) if obj_dipper.canMove {
	var dir = obj_dipper.dir
	if (place_meeting(x-2,y,obj_dipper) and dir==0) or (place_meeting(x,y+2,obj_dipper) and dir==1) or (place_meeting(x+2,y,obj_dipper) and dir==2) or (place_meeting(x,y-2,obj_dipper) and dir==3) {
		obj_dipper.canMove = false
		if y > camera_get_view_y(view_camera[0])+140 ybox = 96
		else ybox = 384
		with instance_create_layer(160,ybox/2,"Instances",obj_textbox) {
			text[0] = other.text
			sound[0] = silence
			if global.player.genocide == RUN.ACTIVE {
				var remaining = global.areaKills[? other.loc].MAX_KILLS - global.areaKills[? other.loc].killCount;
				if remaining > 0 {
					text[0] = string_concat("@ff0000", remaining, " left.");
				} else {
					text[0] = global.player.mabel ? "Immolation." : "Devastation.";
				}
			}
		}
		save = 1
		size = 0
        profile = scr_getSaveProfile();
		global.player.hp = global.player.maxHp;
		audio_play_sound(sfx_heal,0,false)
	}
}