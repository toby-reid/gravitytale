/// @description Attack
if image_alpha == 1 { if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if stage < 5 {
		if timer == 0 {
			stage++
			switch stage {
				case 1: obj_battleCore.text[0] = "The Cat. 7 looks at you #inquisitively." break
				case 2: obj_battleCore.text[0] = "The Cat. 7 asks if you know its #purpose in (un)life." break
				case 3: obj_battleCore.text[0] = "The Cat. 7 complains louder." break
				case 4: obj_battleCore.text[0] = "The Cat. 7 is on the brink #of screaming in absolute #frustration." break
				case 5:
					obj_battleCore.text[0] = "The Cat. 7 is about ready to #give up and go home."
					spare = true
					break
			}
			text = choose("WHATDOYOUWANTFROMME","IDONTKNOWWHATTODO","IJUSTWANNAGOHOME","WHATISMYPURPOSE")
		}
		else if timer%20 == 0 {
			if timer/20 <= string_length(text) with instance_create_layer(x,y,layer,obj_battleAttack) {
				sprite_index = spr_collide
				//image_alpha = 0
				image_xscale = .75
				image_yscale = .75
				char = string_copy(other.text,other.timer/20,1)
				at = other.at
				direction = 240 + irandom(60)
				speed = 4
			}
			else global.stage[0]++
		}
	}
	else if timer >= 60 global.stage[0]++
	timer++
}}
else if alarm[5] == -1 image_alpha += .05