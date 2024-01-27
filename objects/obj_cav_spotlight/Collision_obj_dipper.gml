/// @description if not geno
if global.player[player.runActive] != 2 if other.canMove {
	if global.ghost == 0 {
		stage++
		audio_play_sound(sfx_alert,0,false)
	}
	else {
		stage = 2
		with instance_create_layer(160,192,layer,obj_textbox) {
			text = [
				"(. . .)",
				"(...Darn.)",
				"(They're still here.)"
			]
		}
	}
	other.canMove = false
	other.y += 2
	other.dir = 1
}