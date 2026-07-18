/// @description
if global.soos >= soos
{
    instance_destroy();
    exit;
}

if instance_exists(obj_dipper) {
	if !active {
		if obj_dipper.x > dipx - 10 or dipx == 0
			if obj_dipper.x < dipx + 10 or dipx == 0
				if obj_dipper.y > dipy - 10 or dipy == 0
					if obj_dipper.y < dipy + 10 or dipy == 0 {
						with instance_create_layer(160,196,layer,obj_textbox_old) {
							text = other.text
							head = other.head
							for(var i = 0; i < array_length(text); i++) sound[i] = tlk_soos
						}
						active = true
					}
	}
	else if !instance_exists(obj_textbox_old) {
		speed = 3
		image_speed = 1
	}
}