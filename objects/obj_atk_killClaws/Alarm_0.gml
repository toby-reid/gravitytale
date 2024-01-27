/// @description grabby grabby
if image_index == 0 {
	image_index++
	hspeed = 0
	alarm[0] = 45
}
else if hspeed == 0 {
	hspeed = -1*image_xscale
	alarm[0] = 60
}