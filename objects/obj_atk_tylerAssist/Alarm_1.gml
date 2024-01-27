/// @description Grow/Destroy
image_alpha -= .05
image_xscale += .1
image_yscale += .1
alarm[1] = 1

if image_alpha == 0 instance_destroy()