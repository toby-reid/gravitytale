/// @desc Attack
if(image_alpha==1 and alarm[11]==-1 and !instance_exists(bubble) and alpha==0 and instance_exists(obj_battleBox) and global.stage[0]==4) {
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
		else if(geno) {// first time
			//TODO: set animation sequence starts
			sprite_index = spr_wendyne_geno_legs;
			audio_play_sound(mus_truehero,0,true);
			geno = false;
			global.stage[0]++;
		}
		else {
			if(global.wendy < 21) {
				if(timer < 240) {
					if(timer%60 == 30) makeaxe(obj_soul.x,obj_soul.y-240);
				}
				else global.wendy = 21;
			}
			else {
				if(timer == 60) attack = 5//irandom(5);
				switch attack {
					case 0://onslaught of medi-speedy
						if(timer%20 == 0) {
							if(timer < 540) {
								var _dir = 90*irandom(3);
								if(irandom(3) == 0) with instance_create_layer(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),layer,obj_wendyne_axe_yellow) speed = 2;
								else makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),2);
							}
							else if(timer >= 700) timer = 3000;
						}
						break;
					case 1://fastballs, no yellow
						if(timer%20 == 0) {
							if(timer <= 600) {
								var _dir = 90*irandom(3);
								makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),8);
							}
							else if(timer >= 720) timer = 3000;
						}
						break;
					case 2://slightly spacier fastballs with yellow
						if(timer%40 == 0) {
							if(timer <= 600) {
								var _dir = 90*irandom(3);
								if(irandom(3) == 0) with instance_create_layer(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),layer,obj_wendyne_axe_yellow) speed = 8;
								else makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),8);
							}
							else if(timer >= 720) timer = 3000;
						}
						break;
					case 3://turtles with yellow
						if(timer%15 == 0) {
							if(timer < 330) {
								var _dir = 90*irandom(3);
								if(irandom(3) == 0) with instance_create_layer(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),layer,obj_wendyne_axe_yellow) speed = 1;
								else makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),1);
							}
							else if(timer >= 660) timer = 3000;
						}
						break;
					case 4://slightly spacier turtles and juggernauts
						if(timer%30 == 0) {
							if(timer < 330) {
								var _dir = 90*irandom(3);
								if(irandom(3) == 0) {
									if(irandom(3) == 0) makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),1,at*2,c_fuchsia);
									else with instance_create_layer(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),layer,obj_wendyne_axe_yellow) speed = 1;
								}
								else makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),1);
							}
							else if(timer >= 660) timer = 3000;
						}
						break;
					case 5://turtles, fastballs, and juggernauts, no yellow
						if(timer%20 == 0) {
							if(timer <= 540) {
								var _dir = 90*irandom(3);
								if(irandom(15) == 0) {
									makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),1,at*2,c_fuchsia);
								}
								else makeaxe(obj_soul.x+lengthdir_x(320,_dir),obj_soul.y+lengthdir_y(320,_dir),1+3*(irandom(3)==0));
							}
							else if(!instance_exists(obj_battleAttack)) timer = 3000;
						}
						break;
				}
			}
		}
		if instance_exists(obj_battleAttack) {
			var _closest = noone;
			for(var i = 0; i < instance_number(obj_battleAttack); i++) with instance_find(obj_battleAttack,i) {
				var _dist = point_distance(x,y,obj_soul.x,obj_soul.y);
				if(_dist < 5) instance_destroy();
				else if(image_blend != c_yellow and image_blend != c_fuchsia) {
					if(speed < 4) {
						if(!instance_exists(_closest)) _closest = id;
						else with _closest if(_dist < point_distance(x,y,obj_soul.x,obj_soul.y)) _closest = other.id;
					}
					if(image_blend == c_red) image_blend = c_orange;
				}
			}
			with _closest if(image_blend != c_yellow and image_blend != c_fuchsia) image_blend = c_red;
		}
	}
	else {//default soul attacks
		if(timer == 30) with instance_create_layer(0,0,layer,obj_btl_axeBarrage) at = other.at;
		else if(timer >= 300) {
			global.stage[0]++;
			instance_destroy(obj_btl_axeBarrage);
		}
		with obj_btl_axeBarrage if(timer == 120) timer = 0;
	}
	timer++;
}