/// @description Starting image_index
if place_meeting(x-20,y,obj_cav_grass) {
	if place_meeting(x+20,y,obj_cav_grass) image_index = 2
	else image_index = 4
}