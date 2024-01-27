/// @description GRAVITYTALE
if keyboard_check_pressed(vk_anykey) {
	var char = false;
	if instance_exists(obj_dipper) switch keyboard_key {
		case ord("G"): if order == 0 char = true; break
		case ord("R"): if order == 1 char = true; break
		case vk_left : if order == 2 or order == 8 char = true; break//vk_left bc ord("A") is routed elsewhere
		case ord("V"): if order == 3 char = true; break
		case ord("I"): if order == 4 char = true; break
		case ord("T"): if order == 5 or order == 7 char = true; break
		case ord("Y"): if order == 6 char = true; break
		case ord("L"): if order == 9 char = true; break
		case ord("E"): if order == 10 char = true; break
	}
	if char {
		order++
		if order == 11 {
			order = 0
			scr_get_item(item.spaghetti,true)
		}
	}
	else order = 0
}