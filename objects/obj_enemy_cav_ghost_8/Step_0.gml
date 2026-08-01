/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble_old) if global.stage[0] == 4 {
	if timer == 0 {
		rocks = []
		for(var i = 0; i < 5; i++) rocks[i] = 260 + 30*i
		drawx = 0
		if attention > 0 attention--
		if attention == 0 {
			spare = true
			obj_battleCore.text[0] = "The Cat. 8 is ready to leave #since it missed another #appointment with the Cat. 7."
		}
	}
	else if timer%30 == 0 {
		if(timer < 150) {
			var rock = irandom(array_length(rocks)-1)
			with instance_create_layer(rocks[rock],0,layer,obj_battleAttack) {
				sprite_index = spr_atk_cat8
				image_xscale = 2
				image_yscale = 2
				vspeed = 2
				at = other.at
			}
			var temp = rocks
			rocks = []
			for(var i = 0; i < array_length(temp); i++) if i != rock rocks[array_length(rocks)] = temp[i]
		}
		else if timer == 180 {
			audio_play_sound(sfx_glass,0,false);
			obj_soul.active = false;
		}
		else if(timer == 360) audio_play_sound(sfx_glass_reverse,0,false);
		else if(timer == 390) obj_soul.active = true;
		else if(timer >= 450) global.stage[0]++;
	}
	timer++
}}
else if alarm[5] == -1 image_alpha += .05