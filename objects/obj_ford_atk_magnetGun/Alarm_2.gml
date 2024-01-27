/// @description Destroy self
if image_alpha > 0 {
	image_alpha -= .1
	alarm[2] = 1
}
else instance_destroy()