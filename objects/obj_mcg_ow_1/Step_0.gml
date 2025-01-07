if (instance_exists(obj_dipper)) switch (stage) {
	case 0:
		if (obj_dipper.x >= 270) {
			obj_dipper.canMove = false;
			alarm[0] = (global.player.genocide == RUN.ACTIVE) ? 30 : 120;
			stage++;
		}
		break;
	case 1:
		if (alarm[0] == -1) {
			vspeed += .01;
			if (draw_y < sprite_height) {
				draw_y++;
			} else {
				drawy = -1; // indicates to 'Draw' event to draw full self
			}
			if (y >= 120) {
				vspeed = 0;
				y = 120;
				alarm[1] = 45 + irandom(30);
				stage++;
			}
		}
		break;
}
