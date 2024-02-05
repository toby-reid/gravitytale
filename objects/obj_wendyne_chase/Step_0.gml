/// @description Turn
if(alarm[0] == -1) {
	var _x = obj_dipper.x;
	var _y = obj_dipper.y;
	if((_x >= x-40 and _x <= x+40 and direction%180 == 90) or (_y >= y-60 and _y <= y+20 and direction%180 == 0)) {
		if((_x >= x-10 and _x <= x+10 and direction%180 == 0) or (_y >= y-20 and _y <= y and direction%180 == 90)) {
			with instance_create_layer(0,0,layer,obj_toBattle) {
				goto = btl_cav_wendyne;
				music = mus_spearjustice;
				image_index = 3;
			}
			alarm[0] = 180;
			speed = 0;
			image_speed = 0;
		}
	}
	if(point_distance(x,y,targetx,targety) <= 2) {
		speed = 0;
		alarm[0] = 30;
		image_speed = 0;
		direction = newdir;
	}
}
else if(!instance_exists(obj_toBattle)) if(!audio_is_playing(mus_run)) audio_play_sound(mus_run,0,true);