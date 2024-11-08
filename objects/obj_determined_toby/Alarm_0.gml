/// @description Blink
if image_index == 0 {
	image_index = irandom(1) + 1
	alarm[0] = 10
} else {
	image_index = 0
	alarm[0] = irandom(29) + 1
}