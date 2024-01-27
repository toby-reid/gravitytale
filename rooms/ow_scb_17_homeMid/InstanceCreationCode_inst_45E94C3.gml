if global.killed[enemy.soos] {
	text = ["(It's a fireplace.&(The fire has died out.)"]
	sprite_index = spr_scb_fireplace
}
else {
	text = [
		"(It's a fireplace.)",
		"(Fire makes heat.)",
		"(Heat is hot.)",
		"(I don't think you should touch #it.)"
	]
	with instance_create_layer(x,y,layer,obj_sign) {
		text = other.text
		sprite_index = spr_scb_fireplace
	}
	sprite_index = spr_scb_fire
	x = 84
	y = 106
}