/// @description Attack
if(image_alpha == 1 or stage == 10) { if !instance_exists(obj_textBubble) if global.stage[0] == 4 {
	if timer == 0 {
		var text = [
			"Also, \"ain't afraid of no\" is #a double negative, so either #way, the ghosts win.",
			"Keep dodging.&It's bound to go away #eventually...",
			"The Grim Reaper is merely the #most famous of these phantoms, #not nearly the most terrifying.",
			"The Grave Filler and the Slim #Creeper are far deadlier than #the Grim Reaper.",
			"I'm not certain what this Cat. #10's name is though.&Maybe you should ask.",
			"You're doing quite well!&So well, in fact, I think #I'll start digging.",
			"The Cat. 10 is steadily #dropping the temperature on #the Rankine scale.",
			"Oh hey, did you know that if #you run, you can come right #back here?",
			"Kinda late to mention, but #it's helpful, right?                 &...right?",
			"This message will never appear #in the flavor text.&Isn't that weird?"
		]
		obj_battleCore.text[0] = text[stage]
		stage++
	}
	else if stage == 10 {
		spare = true
		if image_alpha > 0 if timer > 180 image_alpha -= .05
		switch timer {
			case 30:
				audio_play_sound(sfx_glass,0,false)
				image_speed = 0
				path_end()
				break
			case 179:
				bubble = instance_create_layer(x+100,y-40,layer,obj_textBubble)
				bubble.text = [". . .","what"]
				bubble.style = [4,4]
				break
			case 180:
				if instance_exists(obj_textBubble) timer--
				else audio_play_sound(sfx_enemyDead,0,false)
				break
			case 299:
				with instance_create_layer(0,80,layer,obj_textBubble) {
					id.text = [
						"Nyes, how'd you like that, foul beast?",
						"A splash of my home-brewed holy moley water - does wonders for the soul!",
						"Although, if you lack a soul, it's quite toxic, nyes.",
						"And to you, child cowering before the beast...",
						"Always remember that the only thing we have to fear",
						"is gigantic, man-eating spiders!",
						"Not some rubbishry of a demon!",
						"Now then, I'd best be off.",
						"Trembley, away!"
					]
					image_index = 1
				}
				break
			case 300:
				if instance_exists(obj_textBubble) timer--
				break
			case 420:
				instance_destroy()
				break
		}
	}
	else {
		if timer == 30 or timer == 210 {
			var coords = choose([240,320,0],[320,260,270],[320,380,90],[400,320,180])
			with instance_create_layer(coords[0],coords[1],layer,obj_atk_beaver) {
				sprite_index = spr_atk_cat10
				image_xscale = 2
				image_yscale = choose(2,-2)
				image_alpha = 0
				image_angle = coords[2]
				angle = image_angle + image_yscale * -40
				at = other.at
				if global.stage[1] == 1 if global.stage[5] == 2 at = ceil(at/2)
			}
		}
		else if timer == 450 global.stage[0]++
		for(var i = 0; i < instance_number(obj_battleAttack); i++) with instance_find(obj_battleAttack,i) {
			if object_index == obj_atk_beaver {
				if image_alpha < 1 image_alpha += .02
				else if angle != image_angle image_angle -= 4*image_yscale
				else {
					var coords = []
					if y == 380 coords = [260,310,30,0]
					else if y == 260 coords = [260,330,30,0]
					else if x == 240 coords = [310,260,0,30]
					else coords = [330,260,0,30]
					var _indices = [0,1,2,3,4];
					while(array_length(_indices) > 1) {
						var j = irandom(array_length(_indices)-1);
						with instance_create_layer(coords[0]+_indices[j]*coords[2],coords[1]+_indices[j]*coords[3],layer,obj_battleAttack) {
							sprite_index = spr_atk_cat10_fire
							image_xscale = 2
							image_yscale = 2
							direction = 3*coords[2] + 180*irandom(1)
							at = other.at
						}
						array_delete(_indices, j, 1);
					}
					var _atk_2 = instance_find(obj_battleAttack,2);
					var _dir = _atk_2.direction + 180;
					for(var j = 0; j < 5; j++) {
						if(instance_find(obj_battleAttack,j).direction != _dir-180) {
							_dir -= 180;
							break;
						}
					}
					_atk_2.direction = _dir;
					audio_play_sound(sfx_sans_pound,0,false)
					instance_destroy()
				}
			}
			else {
				speed += .04;
			}
		}
	}
	timer++
}}
else if(!spare and image_alpha < 1) image_alpha += .05