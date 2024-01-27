/// @description create obj_toBattle
with instance_create_layer(0,0,"Instances",obj_toBattle) {
	goto = other.goto
	prevMusic = other.prevMusic
}
image_alpha = 0
global.dir = 4