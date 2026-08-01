/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer%90 == 0 {
		var i = irandom(2)
		if instance_exists(obj_atk_fedora) while obj_atk_fedora.y == 248+39*i i = irandom(2)
		instance_create_layer(-94+722*irandom(1),248+39*i,"Instances",obj_atk_fedora)
	}
	if timer >= 600 global.stage[0]++
	timer++
}