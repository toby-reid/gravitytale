/// @description Attack
if image_alpha == 1 if !instance_exists(obj_textBubble) {
	if global.stage[0] == 4 {
		if stage != -1 {
			if is_genocide {
				global.stage[0]++ // he won't attack if you're in full geno
			}
			else if(global.stage[1] == 0 and global.stage[4] != 0) {//shot down
				if timer == 0 instance_create_layer(290,330,"Instances",obj_btl_platform)
				if timer <= 810 {
					if timer%100 == 0 with instance_create_layer(20+600*irandom(1),348+36*irandom(1),"Instances",obj_battleAttack) {
						at = other.at
						sprite_index = spr_ford_atk_hand
						if x < 320 {image_xscale = -2; hspeed = 2}
						else hspeed = -2
						if irandom(2) == 0 image_blend = c_aqua
					}
				}
				else if timer >= 1000 global.stage[0]++
			}
			else switch stage {
				case 0: break
				case 1:
					if timer%60 == 0 and timer <= 600 {
						with instance_create_layer(500,440,"Instances",obj_battleAttack) {
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = -2
							if irandom(4) == 0 image_blend = c_aqua
						}
					}
					if timer >= 800 global.stage[0]++
					break
				case 2:
					if timer == 0 instance_create_layer(290,330,"Instances",obj_btl_platform)
					if timer >= 100 {
						if(timer < 1200) { if (timer%85 == 0) with instance_create_layer(irandom(100)+40+460*irandom(1),305+irandom(1)*55,"Instances",obj_ford_atk_stabiliser) {
							if x > 320 image_xscale = -2
							if irandom(2) == 0 color = c_aqua
						}}
						else if timer == 1300 {
							with instance_create_layer(140,305,"Instances",obj_ford_atk_stabiliser)  color = c_orange
							with instance_create_layer(500,360,"Instances",obj_ford_atk_stabiliser) {color = c_orange; image_xscale = -2}
						}
						else if timer >= 1450 global.stage[0]++
					}
					break
				case 3:
					if timer == 0 {
						with instance_create_layer(140,390,"Instances",obj_atk_beaver) {
							at = other.at
							image_angle = 270
							sprite_index = spr_ford_atk_hand
							hspeed = 1
						}
						with instance_create_layer(500,390,"Instances",obj_atk_beaver) {
							at = other.at
							image_xscale = -2
							image_angle = 90
							sprite_index = spr_ford_atk_hand
							hspeed = -1
						}
					}//228 or 412
					if timer < 1200 { if(timer%120 == 0) {
						with instance_create_layer(120+360*irandom(1),320+2*irandom(20),"Instances",obj_btl_platform) {
							image_xscale = 2
							hspeed = 1-2*(x > 320)
						}
					}}
					else global.stage[0]++
					if(timer == 88) obj_atk_beaver.hspeed = 0
					break
				case 4:
					if timer < 1000 { if timer%60 == 0 {
						with instance_create_layer(40+560*irandom(1),240+180*irandom(1),"Instances",obj_battleAttack) {
							if(x < 320) image_xscale = -2
							if(y < 320) image_yscale = -2
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = 3-6*(x > 320)
							if irandom(4) == 0 image_blend = c_aqua
						}
					}}
					else if timer == 1050 {
						with instance_create_layer(60,282,"Instances",obj_ford_atk_stabiliser) {
							image_xscale = 4
							image_yscale = 4
							color = c_aqua
						}
						with instance_create_layer(580,358,"Instances",obj_ford_atk_stabiliser) {
							image_xscale = -4
							image_yscale = 4
							color = c_aqua
						}
					}
					else if timer >= 1200 global.stage[0]++
					break
				case 5:
					switch timer {
						case 0:
							with instance_create_layer(40,400,"Instances",obj_battleAttack) {
								image_xscale = -2
								at = other.at
								sprite_index = spr_ford_atk_hand
								hspeed = 3
							}
							with instance_create_layer(600,400,"Instances",obj_battleAttack) {
								at = other.at
								sprite_index = spr_ford_atk_hand
								hspeed = -3
							}
							with instance_create_layer(120,140,"Instances",obj_battleAttack) {
								sprite_index = spr_ford_atk_gravityFall
								image_index = 1
							}
							with instance_create_layer(520,140,"Instances",obj_battleAttack) sprite_index = spr_ford_atk_gravityFall
							with instance_create_layer(100,100,"Instances",obj_battleAttack) {sprite_index = spr_ford_atk_gravityFall_antenna; image_xscale = -2}
							with instance_create_layer(540,100,"Instances",obj_battleAttack)  sprite_index = spr_ford_atk_gravityFall_antenna
							audio_play_sound(sfx_chargeUp,0,false)
							break
						case 120:
						case 360:
						case 550:
						case 820:
							with instance_create_layer(320,480,"Instances",obj_ford_ow_1) {
								sprite_index = spr_ford_atk_gravityFall_beam
								image_xscale = 2
								image_yscale = 2
							}
							audio_play_sound(sfx_zap,0,false)
							break
						case 130:
							instance_create_layer(140,280,"Instances",obj_ford_atk_stabiliser)
							with instance_create_layer(500,358,"Instances",obj_ford_atk_stabiliser) image_xscale = -2
							with obj_soul {
								hspeed = 0
								vspeed = 0
								image_index = 0
							}
							break
						case 140:
						case 380:
						case 570:
						case 840:
							instance_destroy(obj_ford_ow_1)
							audio_stop_sound(sfx_zap)
							break
						case 240:
							with instance_create_layer(500,301,"Instances",obj_ford_atk_stabiliser) image_xscale = -2
							instance_create_layer(140,337,"Instances",obj_ford_atk_stabiliser)
							break
						case 370:
							with obj_soul {
								hspeed = 0
								vspeed = 0
								image_index = 1
							}
							with instance_create_layer(40,400,"Instances",obj_battleAttack) {
								image_xscale = -2
								at = other.at
								sprite_index = spr_ford_atk_hand
								hspeed = 3
							}
							with instance_create_layer(600,400,"Instances",obj_battleAttack) {
								at = other.at
								sprite_index = spr_ford_atk_hand
								hspeed = -3
							}
							break
						case 560:
							with obj_soul {
								hspeed = 0
								vspeed = 0
								image_index = 0
							}
						case 640:
							with instance_create_layer(240,-20,"Instances",obj_battleAttack) {
								at = other.at
								image_angle = 90
								image_yscale = -2
								sprite_index = spr_ford_atk_hand
								vspeed = 2
							}
							break
						case 520:
						case 600:
							with instance_create_layer(400,-20,"Instances",obj_battleAttack) {
								at = other.at
								image_angle = 90
								sprite_index = spr_ford_atk_hand
								vspeed = 2
							}
							break
						case 830:
							with obj_soul {
								hspeed = 0
								vspeed = 0
								image_index = 1
							}
							with instance_create_layer(500,305,"Instances",obj_ford_atk_stabiliser) {
								image_xscale = -2
								color = c_aqua
							}
							with instance_create_layer(140,360,"Instances",obj_ford_atk_stabiliser) color = c_aqua
							break
						case 1000: global.stage[0]++ break
					}
					break
				case 6:
					if timer == 30 with instance_create_layer(0,0,"Instances",obj_ford_atk_magnetGun) angle = 180
					else if timer >= 90 and timer < 1000 { if timer%60 == 0 {
						with instance_create_layer(40+560*irandom(1),220+180*irandom(1),"Instances",obj_battleAttack) {
							if(x < 320) image_xscale = -2
							if(y < 320) image_yscale = -2
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = 3-6*(x > 320)
							if irandom(4) == 0 image_blend = c_aqua
						}
					}}
					else if timer == 1050 {
						with instance_create_layer(580,282,"Instances",obj_ford_atk_stabiliser) {
							image_xscale = -4
							image_yscale = 4
							color = c_aqua
						}
						with instance_create_layer(60,358,"Instances",obj_ford_atk_stabiliser) {
							image_xscale = 4
							image_yscale = 4
							color = c_aqua
						}
					}
					else if timer == 1200 instance_create_layer(0,0,"Instances",obj_ford_atk_magnetGun)
					else if timer >= 1400 global.stage[0]++
					break
				case 7:
					if timer == 0 {
						instance_create_layer(290,318,"Instances",obj_btl_platform)
						with instance_create_layer(40,400,"Instances",obj_battleAttack) {
							image_xscale = -2
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = 2
						}
						with instance_create_layer(600,220,"Instances",obj_battleAttack) {
							image_yscale = -2
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = -2
						}
					}
					else if(timer%150 == 0 and timer <= 1200) with instance_create_layer(0,0,"Instances",obj_ford_atk_magnetGun) angle = 180*(other.timer%300 != 0)
					else if timer == 200 {
						with instance_create_layer(600,420,"Instances",obj_battleAttack) {
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = -2
						}
						with instance_create_layer(40,240,"Instances",obj_battleAttack) {
							image_xscale = -2
							image_yscale = -2
							at = other.at
							sprite_index = spr_ford_atk_hand
							hspeed = 2
						}
					}
					else if timer == 400 {
						with instance_create_layer(228,200,"Instances",obj_battleAttack) {
							image_yscale = -2
							image_angle = 90
							at = other.at
							sprite_index = spr_ford_atk_hand
							vspeed = 3
							image_blend = c_aqua
						}
						with instance_create_layer(412,200,"Instances",obj_battleAttack) {
							image_angle = 90
							at = other.at
							sprite_index = spr_ford_atk_hand
							vspeed = 3
							image_blend = c_aqua
						}
					}
					else if timer == 550 {
						with instance_create_layer(228,440,"Instances",obj_battleAttack) {
							image_angle = 270
							at = other.at
							sprite_index = spr_ford_atk_hand
							vspeed = -3
							image_blend = c_aqua
						}
						with instance_create_layer(412,440,"Instances",obj_battleAttack) {
							image_yscale = -2
							image_angle = 270
							at = other.at
							sprite_index = spr_ford_atk_hand
							vspeed = -3
							image_blend = c_aqua
						}
					}
					else if timer >= 640 and timer <= 1200 {
						if timer%80 == 0 {
							with instance_create_layer(60+2*irandom(40)+440*irandom(1),279+80*irandom(1),"Instances",obj_ford_atk_stabiliser) {
								if x > 320 image_xscale = -2
								color = choose(c_white,c_white,c_white,c_aqua,c_orange)
							}
						}
					}
					else if timer >= 1350 global.stage[0]++
					break
				case 8:
					switch timer {
						case 0:
						case 600:
							with instance_create_layer(0,0,"Instances",obj_ford_atk_magnetGun) angle = 90
							break
						case 100:
							with instance_create_layer(100,350,"Instances",obj_ford_atk_stabiliser) {
								image_xscale = 3
								image_yscale = 3
							}
							break
						case 180:
							with instance_create_layer(100,286,"Instances",obj_ford_atk_stabiliser) {
								image_xscale = 3
								image_yscale = 3
							}
							break
						case 300:
							with instance_create_layer(317,290,"Instances",obj_btl_platform) {
								image_xscale = .25
								image_yscale = 3
							}
						case 900:
							with instance_create_layer(0,0,"Instances",obj_ford_atk_magnetGun) angle = 270
							break
						case 400:
							with instance_create_layer(540,286,"Instances",obj_ford_atk_stabiliser) {
								image_xscale = -3
								image_yscale = 3
							}
							break
						case 480:
							with instance_create_layer(540,350,"Instances",obj_ford_atk_stabiliser) {
								image_xscale = -3
								image_yscale = 3
							}
							break
						case 560:
							with instance_create_layer(20,318,"Instances",obj_ford_atk_stabiliser) {
								image_xscale = 5
								image_yscale = 5
							}
							break
						case 1200:
							instance_create_layer(0,0,"Instances",obj_ford_atk_magnetGun)
							break
						case 1350: global.stage[0]++ break
					}
					if timer >= 700 if timer < 1200 if timer%80 == 0 {
						with instance_create_layer(240+160*irandom(1),140+360*irandom(1),"Instances",obj_battleAttack) {
							image_angle = 90+180*(y>320)
							image_yscale = 2-4*((image_angle=90 and x<320) or (image_angle=270 and x>320))
							at = other.at
							sprite_index = spr_ford_atk_hand
							vspeed = 2-4*(y>320)
							if irandom(4) == 0 image_blend = c_aqua
						}
					}
					break
				case 9:
					global.stage[0]++
					break
				case 10:
					if obj_ford_infinityDie.stage == 4 if obj_ford_infinityDie.alarm[1] == -1 {
						instance_destroy(obj_ford_infinityDie)
						global.stage[0]++
					}
					break
			}
			timer++
		}
		else if spare {//genocide
			global.stage[0]++
			if audio_is_playing(mus_nyeh) audio_stop_sound(mus_nyeh)
		}
		else {//starting attack
			if timer == 0 or timer == 16 instance_create_layer(540-timer*27.5,100,"Instances",obj_ford_atk_gravityFall)
			if timer <= 16 timer++
			if timer == 30 {
				global.stage[0]++
				if audio_is_playing(mus_nyeh) audio_stop_sound(mus_nyeh)
				stage++
			}
		}
		sprite_index = spr_ford_head_battle_neutral
		image_speed = 0
		image_index = 0
	}
	else if !audio_is_playing(mus_bonetrousle) if global.stage[0] < 5 {
		audio_play_sound(mus_bonetrousle,0,true)
	}
}
else if bubble.grow == 0 {
	if bubble.charCount < string_length(bubble.segText[array_length(bubble.segText)-1]) image_speed = 1
	else if bubble.charCount >= string_length(bubble.segText[array_length(bubble.segText)-1]) image_index = 0
	with bubble if variable_instance_exists(id,"headid") switch headid {
		case -5:
			switch page {
				case 1: 
				case 5: 
				case 8: other.sprite_index = spr_ford_head_battle_mad break
				case 2: 
				case 7: other.sprite_index = spr_ford_head_battle_neutral break
				case 4: 
				case 6: other.sprite_index = spr_ford_head_battle_bashful break
			}
			break
		case -4:
			if page == 4 other.sprite_index = spr_ford_head_battle_neutral
			else other.sprite_index = spr_ford_head_battle_bashful
			break
		case -3:
			switch page {
				case 0: other.sprite_index = spr_ford_head_battle_mad break
				case 2: other.sprite_index = spr_ford_head_battle_bashful break
				case 3: other.sprite_index = spr_ford_head_battle_neutral break
			}
			break
		case -2:
			switch page {
				case 0: other.sprite_index = spr_ford_head_battle_mad break
				case 1: 
				case 4: other.sprite_index = spr_ford_head_battle_bashful break
				case 3: other.sprite_index = spr_ford_head_battle_neutral break
			}
			break
		case -1:
			switch page {
				case 1: other.sprite_index = spr_ford_head_battle_bashful break
				case 2: 
				case 4: other.sprite_index = spr_ford_head_battle_neutral break
				case 3: 
				case 5: other.sprite_index = spr_ford_head_battle_mad break
			}
			break
		case 0: 
			other.sprite_index = spr_ford_head_battle_neutral 
			break
		case 1:
			if page == 1 other.sprite_index = spr_ford_head_battle_mad
			break
		case 3:
		case 4:
			if page == 0 other.sprite_index = spr_ford_head_battle_bashful
			if page == 1 other.sprite_index = spr_ford_head_battle_mad
			break
		case 5:
		case 7:
			if page == 0 other.sprite_index = spr_ford_head_battle_bashful
			if page == 1 other.sprite_index = spr_ford_head_battle_neutral
			break
		case 6:
		case 9:
			other.sprite_index = spr_ford_head_battle_mad
			break
		case 8:
			if page == 0 other.sprite_index = spr_ford_head_battle_mad
			if page == 1 other.sprite_index = spr_ford_head_battle_neutral
			break
		case 10:
			if page%4 == 0 other.sprite_index = spr_ford_head_battle_mad//how convenient
			if (page-1)%4 == 0 other.sprite_index = spr_ford_head_battle_neutral//indeed
			break
	}
	else other.sprite_index = spr_ford_head_battle_neutral
}