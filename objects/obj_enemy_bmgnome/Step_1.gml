if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 {obj_battleCore.text[0] = "Black Market Gnome is on his #last leg!"}

if global.stage[0] == 5 {timer = 0}