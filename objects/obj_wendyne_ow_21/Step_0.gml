if(instance_exists(obj_dipper)) switch stage {
	case 0:
		if(obj_dipper.x >= 80) {
			if(obj_dipper.canMove) {
				obj_dipper.canMove = false;
				
			}
			else if(!instance_exists(obj_textbox)) {
				
			}
		}
}