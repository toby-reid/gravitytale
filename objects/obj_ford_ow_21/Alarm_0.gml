/// @description Create smoke
/*with instance_create_layer(x,y,"Instances",obj_ford_ow_1) {
	sprite_index = spr_smoke
	vspeed = random(2)+1
	image_blend = scr_hexdec("E5E5E5")
}
alarm[0] = 10*/
instance_create_layer(x,y,"Instances",obj_ford_jetpackExhaust)
alarm[0] = irandom(5)+5