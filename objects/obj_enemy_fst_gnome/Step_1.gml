if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "Gnome, gnome on the range...&You've murdered it; you are #deranged..."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {
	spare = true;
	obj_battleCore.text[0] = "Gnome still has a job to do, #so he decides to spare you."
	if global.player[player.mabel] obj_battleCore.text[0] = "Gnome has realised you would #make an abusive queen, #so he decides to spare you."
}

if global.stage[0] == 5 {
	if flipped > 0 if timer > 0 {
		flipped--
		if flipped == 0 {
			image_speed = 1
			image_yscale = 2
			if hp > 1 spare = false
		}
	}
	timer = 0
	create = true
}