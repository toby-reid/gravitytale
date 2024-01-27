/// @description image_index
if hspeed == 0 or image_index mod 6 != 0 {
	image_index++
	if image_index >= 12 image_index = 0
	if image_index mod 6 == 0 {
		char++
		if char >= 12 char = 1
	}
	alarm[0] = 8
}