/// @description image_index
index = !index
if stage == 0 image_index = index
else if stage == 1 {image_index += .5; if image_index == 2 image_index = 0}
else image_index = 0
alarm[8] = 12