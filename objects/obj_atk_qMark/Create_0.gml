at = obj_enemy_fst_qQuail.at
image_xscale = 2
image_yscale = 2
image_alpha = 0
image_angle = 10*irandom(35)
if instance_number(obj_enemy) == 1 {
	vspeed = random(.5)-.25
	hspeed = random(.5)-.25
}
dir = 2*(irandom(1)-.5)