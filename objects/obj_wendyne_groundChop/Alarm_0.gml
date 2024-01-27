/// @description fade out
image_alpha -= .1
axe.image_alpha = 1 - 2*(1 - image_alpha)
if image_alpha <= 0 instance_destroy()
else alarm[0] = 5