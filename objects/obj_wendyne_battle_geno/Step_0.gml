/// @desc Attack
if image_alpha == 1 if(instance_exists(obj_battleBox)) if global.stage[0] == 4 {
	if(obj_soul.image_index == 3) {
		if(timer < 20) with obj_battleBox {//set up battlebox
			image_xscale -= .04;
			image_yscale -= .0375;
		}
		else if(timer == 20) with obj_battleBox {
			image_index = 1;
			image_xscale = 1;
			image_yscale = 1;
		}
		else if(timer < 60) { 
			if(timer == 59) obj_battleBox.y = 240;
			else if(timer >= 40) obj_battleBox.y -= 4;
		}
		else if(timer > 3000) {
			if(timer <= 3020) obj_battleBox.y += 4;
			else if(timer <= 3040) with(obj_battleBox) {
				if(other.timer == 3021) {
					y = 320;
					image_index = 0;
					image_xscale = .2;
					image_yscale = .25;
				}
				image_xscale += .04;
				image_yscale += .0375;
			}
			else global.stage[0]++;
		}
		else if(sprite_index == spr_wendyne_btl_legs) {
			if(timer%60 == 0) {
				if(timer <= 420) {
					var _dir = 90*irandom(3);
					makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),2);
				}
				else if(timer >= 600) timer = 3000;
			}
		}
		else {
			
		}
	}
	else {//default soul attacks
		
	}
	timer++;
}