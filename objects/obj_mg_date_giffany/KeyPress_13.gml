if place_meeting(x,y,obj_mg_date_cursor) {
	damage += irandom(1)+1
	if damage > 99 {damage = 99; hp--}
	if !audio_is_playing(sfx_giffany_hithere) {
		var copyChar = 1
		for(var i = 1; i < string_length(feedback); i++) if string_copy(feedback,i,1) == "#" {copyChar = i+1; break}
		feedback = string_copy(feedback,copyChar,string_length(feedback)-copyChar+1)+"#"
		if damage == 99 feedback += "> Ouch! That hurt!"
		else feedback += "> Ha ha! You are so funny!"
	}
}
else if sprite_index == spr_mg_date_giffany with obj_mg_date_cursor {
	if place_meeting(x,y,obj_mg_date_answerBox) {
		var inst = instance_place(x,y,obj_mg_date_answerBox)
		if inst.image_blend == c_white {
			audio_stop_sound(sfx_giffany_thatsok)
			if other.day < 11 switch inst.answer {
				case 0:
					inst.image_blend = c_yellow
					with other {
						lovePoints += 100
						baggage = true
						alarm[2] = 120
						sprite_index = spr_mg_date_giffany_happy
						feedback = "> Great job!#> Your LOVE increased!"
					}
					audio_play_sound(sfx_mg_date_goodAnswer,0,false)
					break
				case 2:
					other.hp -= 2
				case 1:
					inst.image_blend = c_red
					other.hp -= 3
					audio_play_sound(sfx_giffany_thatsok,0,false)
					with other {
						var copyChar = 1
						for(var i = 1; i < string_length(feedback); i++) if string_copy(feedback,i,1) == "#" {copyChar = i+1; break}
						feedback = string_copy(feedback,copyChar,string_length(feedback)-copyChar+1)+"#"
						feedback += "> That's ok, try again!"
					}
					break
			}
			else switch inst.answer {
				case 0:
					//you win
					inst.image_blend = c_yellow
					other.stage++
					other.sprite_index = spr_mg_date_giffany_happy
					break
				case 1:
					//creepy crash
					break
				case 2:
					other.hp -= 5
					inst.image_blend = c_red
					audio_play_sound(sfx_giffany_thatsok,0,false)
					break
			}
		}
	}
}