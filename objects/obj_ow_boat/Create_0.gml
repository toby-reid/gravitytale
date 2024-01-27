alpha = 0
active = false

if global.killed[enemy.soos] {
	if global.dir == 1 with instance_create_layer(160,192,"Instances",obj_textbox) text = ["You crashed your new boat.&No wonder it's illegal for #12-year-olds to drive..."]
	instance_destroy()
}
if room == ow_scb_27_dock image_xscale = -1