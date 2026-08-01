/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer%30 == 0 {
		if timer >= 450 global.stage[0]++
		else {
			var dir = irandom(359)
			instance_create_layer(320+lengthdir_x(120,dir),320+lengthdir_y(120,dir),layer,obj_atk_gnome)
		}
	}
	timer++
}