if other.moving if alarm[0] == -1 {
	image_index++
	alarm[0] = 10
	if alarm[1] == -1 {
		audio_play_sound(sfx_grass,0,false)
		obj_cav_grass.alarm[1] = 20
	}
}
if other.x >= x+10 and place_meeting(x+20,y,obj_cav_grass) other.y = y+20
else if other.x <= x+10 and place_meeting(x-20,y,obj_cav_grass) other.y = y+20