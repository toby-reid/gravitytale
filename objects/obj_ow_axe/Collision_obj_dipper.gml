/// @description Insert description here
// You can write your code in this editor
with instance_create_layer(other.x,other.y,layer,obj_toBattle) {
	flashes = 3
	music = mus_run
	goto = btl_cav_axeBarrage
	dest = 2
}
instance_destroy(obj_ow_axe)