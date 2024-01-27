/// @description hammer
image_index = !image_index
if image_index == 1 alarm[11] = 20
else alarm[11] = 30 + irandom(60)