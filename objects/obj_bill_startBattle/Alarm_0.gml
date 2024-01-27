/// @description the first Attack
with instance_create_layer(x+38,y+8,"Instances",obj_bill_laser) {
	dir = 0
	spd = 3 - other.stage/2
	if spd <= 0 spd = 1
}
stage++