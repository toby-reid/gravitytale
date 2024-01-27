///@desc Override - Dying / Round Reset
if hp <= 0 { if global.stage[0] != 3 {
	hp = 0
	obj_battleCore.text[0] = "Kill Billy returns to the #earth, where he spent most of #his life."
	if image_alpha == 1 audio_play_sound(sfx_enemyDead,0,false)
	image_alpha -= .05
	if image_alpha == 0 instance_destroy()
	instance_destroy(bubble)
}}
else if hp == 1 if !spare {spare = true; obj_battleCore.text[0] = "At this rate, Kill Billy #won't make it home in time #for Granny's hedgehog soup."}

if global.stage[0] == 5 {timer = 0; create = true}