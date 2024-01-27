///@desc Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "Manly Dan bows his head to you #in final respect."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp < 5 obj_battleCore.text[0] = "Manly Dan takes a knee, #refusing to give up."
else if obj_battleCore.text[0] == "Manly Dan takes a knee, #refusing to give up." {if stage < 3 spare = false; obj_battleCore.text[0] = "Manly Dan stands up once more, #ready to fight once again."}

if global.stage[0] == 5 {timer = 0; buffed = false; encouraged = false; audio_sound_pitch(sfx_whoosh,1)}