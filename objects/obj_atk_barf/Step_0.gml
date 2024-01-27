/// @description expansion
if image_yscale < 2 {
	image_yscale += .2
}
else if !instance_exists(obj_atk_barfPool) instance_create_layer(320,386,layer,obj_atk_barfPool)