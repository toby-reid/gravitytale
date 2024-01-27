/// @description Smoke
if hp > 0 {
	instance_create_layer(x+160,y+2,"Instances",obj_atk_chainSmoke)
	if stage < 1 alarm[7] = irandom(29)+1
	else if stage == 1 alarm[7] = irandom(30)+30
}