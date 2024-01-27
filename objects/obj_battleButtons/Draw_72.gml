if global.stage[1] == image_index image_index += 4
else if image_index >= 4 if image_index-4 != global.stage[1] image_index -= 4

draw_self()