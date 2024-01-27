/// @description rippling pectorals
if image_index == 0 {
	image_index = 1+irandom(1)
	alarm[11] = 10
}
else {
	image_index = 0
	alarm[11] = 20+irandom(20)
}