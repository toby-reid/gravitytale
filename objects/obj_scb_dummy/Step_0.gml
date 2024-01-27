if variable_global_exists("dummy") switch global.dummy {
	case 2: case 5: image_index = 1 break
	case 3: image_index = 2 break
	case 6: image_index = 3 break
}